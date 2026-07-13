-- ============================================================
-- ANTI-RÉPÉTITION — Cooldown 60 jours par enfant
-- Coller dans l'éditeur SQL Supabase et exécuter
-- ============================================================

-- Remplace la fonction get_questions_for_skill existante.
-- Nouveau paramètre optionnel : p_child_id
-- Comportement :
--   • Sans p_child_id → tirage aléatoire (compatibilité rétrograde)
--   • Avec p_child_id → questions non vues dans les 60 derniers jours
--     en priorité ; si pas assez, complète avec les moins récemment vues.

CREATE OR REPLACE FUNCTION get_questions_for_skill(
  p_skill_id   UUID,
  p_limit      INT     DEFAULT 5,
  p_child_id   UUID    DEFAULT NULL
)
RETURNS TABLE (
  id               UUID,
  title            TEXT,
  content          JSONB,
  difficulty_level INT,
  expected_time_ms INT,
  explanation      TEXT
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  -- ── Sans enfant : comportement original ──────────────────
  IF p_child_id IS NULL THEN
    RETURN QUERY
      SELECT q.id, q.title, q.content, q.difficulty_level,
             q.expected_time_ms, q.explanation
      FROM questions q
      WHERE q.skill_id = p_skill_id
        AND q.is_active = true
      ORDER BY RANDOM()
      LIMIT p_limit;
    RETURN;
  END IF;

  -- ── Avec enfant : priorité aux questions non vues ────────
  -- recently_seen = 1 si vue dans les 60 derniers jours, 0 sinon
  -- Tri : 0 (non vu) avant 1 (vu récemment), puis aléatoire
  RETURN QUERY
    WITH seen AS (
      SELECT DISTINCT er.question_id
      FROM exercise_responses er
      WHERE er.child_id    = p_child_id
        AND er.created_at  > NOW() - INTERVAL '60 days'
    )
    SELECT
      q.id,
      q.title,
      q.content,
      q.difficulty_level,
      q.expected_time_ms,
      q.explanation
    FROM questions q
    LEFT JOIN seen s ON s.question_id = q.id
    WHERE q.skill_id  = p_skill_id
      AND q.is_active = true
    ORDER BY
      CASE WHEN s.question_id IS NULL THEN 0 ELSE 1 END ASC,
      RANDOM()
    LIMIT p_limit;
END;
$$;

-- Vérification : la fonction doit apparaître ici
SELECT proname, pronargs
FROM pg_proc
WHERE proname = 'get_questions_for_skill';
