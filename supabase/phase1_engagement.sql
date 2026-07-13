-- ============================================================
-- PHASE 1 — Engagement : XP, Streaks, Badges
-- À exécuter dans Supabase → SQL Editor → Run
-- ============================================================

-- ── 1. XP sur la table enfants ──────────────────────────────
ALTER TABLE children ADD COLUMN IF NOT EXISTS total_xp INT NOT NULL DEFAULT 0;

-- ── 2. Journal XP ───────────────────────────────────────────
CREATE TABLE IF NOT EXISTS xp_log (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  child_id   UUID REFERENCES children(id) ON DELETE CASCADE,
  amount     INT NOT NULL,
  reason     TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE xp_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY "parents_read_xp_log" ON xp_log FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM parent_child_links
    WHERE parent_id = auth.uid() AND child_id = xp_log.child_id
  ));

-- ── 3. Streaks ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS streaks (
  child_id         UUID PRIMARY KEY REFERENCES children(id) ON DELETE CASCADE,
  current_streak   INT NOT NULL DEFAULT 0,
  longest_streak   INT NOT NULL DEFAULT 0,
  last_session_date DATE
);
ALTER TABLE streaks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "parents_read_streaks" ON streaks FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM parent_child_links
    WHERE parent_id = auth.uid() AND child_id = streaks.child_id
  ));

-- ── 4. Badges ───────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS badges (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug        TEXT UNIQUE NOT NULL,
  name        TEXT NOT NULL,
  icon        TEXT NOT NULL,
  description TEXT NOT NULL
);
ALTER TABLE badges ENABLE ROW LEVEL SECURITY;
CREATE POLICY "badges_public_read" ON badges FOR SELECT USING (true);

-- ── 5. Badges des enfants ───────────────────────────────────
CREATE TABLE IF NOT EXISTS child_badges (
  child_id  UUID REFERENCES children(id) ON DELETE CASCADE,
  badge_id  UUID REFERENCES badges(id) ON DELETE CASCADE,
  earned_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (child_id, badge_id)
);
ALTER TABLE child_badges ENABLE ROW LEVEL SECURITY;
CREATE POLICY "parents_read_child_badges" ON child_badges FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM parent_child_links
    WHERE parent_id = auth.uid() AND child_id = child_badges.child_id
  ));

-- ── 6. Données initiales — badges ───────────────────────────
INSERT INTO badges (slug, name, icon, description) VALUES
  ('premier_pas',    'Premier pas',       '🌱', 'Termine ta première session d''exercices'),
  ('semaine_de_feu', 'Semaine de feu',    '🔥', 'Complète une session 7 jours de suite'),
  ('premiere_etoile','Première étoile',   '⭐', 'Atteins ⭐⭐ dans une compétence'),
  ('perfectionniste','Perfectionniste',   '💎', 'Obtiens 100 % dans une session'),
  ('assidu',         'Assidu',            '🚀', 'Complète 10 sessions au total'),
  ('curieux',        'Curieux',           '🧠', 'Essaie 5 compétences différentes'),
  ('cent_bonnes',    'Centenaire',        '🏅', 'Atteins 100 bonnes réponses au total'),
  ('champion',       'Champion PFEQ',     '🏆', 'Atteins ⭐⭐ dans les 12 compétences de Sec 1')
ON CONFLICT (slug) DO NOTHING;

-- ── 7. Fonction : attribuer des XP ──────────────────────────
CREATE OR REPLACE FUNCTION award_xp(
  p_child_id UUID,
  p_amount   INT,
  p_reason   TEXT DEFAULT NULL
)
RETURNS INT
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE v_new_xp INT;
BEGIN
  INSERT INTO xp_log (child_id, amount, reason) VALUES (p_child_id, p_amount, p_reason);
  UPDATE children SET total_xp = total_xp + p_amount WHERE id = p_child_id
  RETURNING total_xp INTO v_new_xp;
  RETURN v_new_xp;
END;
$$;

-- ── 8. Fonction : mettre à jour le streak ───────────────────
CREATE OR REPLACE FUNCTION update_streak(p_child_id UUID)
RETURNS JSON
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE
  v_today      DATE := CURRENT_DATE;
  v_last       DATE;
  v_current    INT;
  v_longest    INT;
  v_new_streak INT;
  v_new_longest INT;
BEGIN
  SELECT last_session_date, current_streak, longest_streak
  INTO v_last, v_current, v_longest
  FROM streaks WHERE child_id = p_child_id;

  IF NOT FOUND THEN
    INSERT INTO streaks (child_id, current_streak, longest_streak, last_session_date)
    VALUES (p_child_id, 1, 1, v_today);
    RETURN json_build_object('current_streak', 1, 'longest_streak', 1, 'is_new_day', true);
  END IF;

  -- Déjà une session aujourd'hui → pas de changement
  IF v_last = v_today THEN
    RETURN json_build_object('current_streak', v_current, 'longest_streak', v_longest, 'is_new_day', false);
  END IF;

  -- Hier → incrémenter
  IF v_last = v_today - INTERVAL '1 day' THEN
    v_new_streak := v_current + 1;
  ELSE
    -- Streak brisé
    v_new_streak := 1;
  END IF;

  v_new_longest := GREATEST(v_longest, v_new_streak);

  UPDATE streaks SET
    current_streak    = v_new_streak,
    longest_streak    = v_new_longest,
    last_session_date = v_today
  WHERE child_id = p_child_id;

  RETURN json_build_object(
    'current_streak',  v_new_streak,
    'longest_streak',  v_new_longest,
    'is_new_day',      true
  );
END;
$$;

-- ── 9. Fonction : vérifier et attribuer les badges ──────────
CREATE OR REPLACE FUNCTION check_badges(p_child_id UUID)
RETURNS TEXT[]
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE
  v_badge_id    UUID;
  v_slug        TEXT;
  v_sessions    INT;
  v_streak      INT;
  v_correct     INT;
  v_mastered    INT;
  v_skills_tried INT;
  v_perfect     BOOLEAN;
  v_new_badges  TEXT[] := '{}';
BEGIN
  SELECT COUNT(*) INTO v_sessions
  FROM exercise_sessions WHERE child_id = p_child_id AND completed_at IS NOT NULL;

  SELECT COALESCE(current_streak, 0) INTO v_streak
  FROM streaks WHERE child_id = p_child_id;

  SELECT COUNT(*) INTO v_correct
  FROM exercise_responses WHERE child_id = p_child_id AND is_correct = true;

  SELECT COUNT(*) INTO v_mastered
  FROM knowledge_states WHERE child_id = p_child_id AND p_mastery >= 0.65;

  SELECT COUNT(DISTINCT skill_id) INTO v_skills_tried
  FROM exercise_sessions WHERE child_id = p_child_id;

  SELECT EXISTS (
    SELECT 1 FROM exercise_sessions
    WHERE child_id = p_child_id
      AND completed_at IS NOT NULL
      AND total_questions > 0
      AND correct_answers = total_questions
  ) INTO v_perfect;

  FOR v_slug, v_badge_id IN SELECT slug, id FROM badges LOOP
    CONTINUE WHEN EXISTS (
      SELECT 1 FROM child_badges
      WHERE child_id = p_child_id AND badge_id = v_badge_id
    );

    IF  (v_slug = 'premier_pas'     AND v_sessions    >= 1)
     OR (v_slug = 'semaine_de_feu'  AND v_streak      >= 7)
     OR (v_slug = 'premiere_etoile' AND v_mastered    >= 1)
     OR (v_slug = 'perfectionniste' AND v_perfect)
     OR (v_slug = 'assidu'          AND v_sessions    >= 10)
     OR (v_slug = 'curieux'         AND v_skills_tried >= 5)
     OR (v_slug = 'cent_bonnes'     AND v_correct     >= 100)
     OR (v_slug = 'champion'        AND v_mastered    >= 12)
    THEN
      INSERT INTO child_badges (child_id, badge_id)
      VALUES (p_child_id, v_badge_id) ON CONFLICT DO NOTHING;
      v_new_badges := array_append(v_new_badges, v_slug);
    END IF;
  END LOOP;

  RETURN v_new_badges;
END;
$$;

-- ── Vérification ────────────────────────────────────────────
SELECT 'Tables créées ✅' AS status;
SELECT slug, name, icon FROM badges ORDER BY slug;
