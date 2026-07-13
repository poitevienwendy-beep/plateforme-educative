-- ============================================================
-- BKT v2 — Algorithme enrichi avec signal temps de réponse
-- Eva Étude — PRD v2.0
-- À exécuter dans le SQL Editor Supabase
-- ============================================================

-- Redéfinition de update_bkt avec paramètre p_response_time_ms
-- Logique de pondération :
--   • Bonne réponse < 3s  → factor 0.5  (possible inattention/chance, demi-crédit)
--   • Bonne réponse ≥ 3s  → factor 1.0  (réflexion réelle, crédit complet)
--   • Mauvaise réponse < 4s → factor 0.6 (erreur rapide = inattention, pénalité réduite)
--   • Mauvaise réponse > 30s → factor 1.4 (réflexion longue = lacune réelle, pénalité augmentée)
--   • Autres cas           → factor 1.0  (comportement standard)

CREATE OR REPLACE FUNCTION update_bkt(
  p_child_id        UUID,
  p_question_id     UUID,
  p_is_correct      BOOLEAN,
  p_response_time_ms INT DEFAULT NULL
) RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
  v_skill_id    UUID;
  v_old_mastery FLOAT;
  v_posterior   FLOAT;
  v_new_mastery FLOAT;
  -- Paramètres BKT standards
  v_p_guess     FLOAT := 0.25;   -- probabilité de deviner
  v_p_slip      FLOAT := 0.10;   -- probabilité de glisser
  v_p_transit   FLOAT := 0.15;   -- probabilité d'apprendre à chaque essai
  -- Facteur de pondération selon le temps
  v_time_factor FLOAT := 1.0;
BEGIN
  -- 1. Trouver le skill_id via la question
  SELECT skill_id INTO v_skill_id
  FROM questions
  WHERE id = p_question_id;

  IF v_skill_id IS NULL THEN
    RETURN;
  END IF;

  -- 2. Lire la maîtrise actuelle (défaut 0.3 si première fois)
  SELECT COALESCE(p_mastery, 0.3) INTO v_old_mastery
  FROM knowledge_states
  WHERE child_id = p_child_id AND skill_id = v_skill_id;

  IF NOT FOUND THEN
    v_old_mastery := 0.3;
  END IF;

  -- 3. Calculer le facteur temps
  IF p_response_time_ms IS NOT NULL THEN
    IF p_is_correct AND p_response_time_ms < 3000 THEN
      -- Bonne réponse ultra-rapide : possible chance ou inattention
      v_time_factor := 0.5;

    ELSIF NOT p_is_correct AND p_response_time_ms > 30000 THEN
      -- Mauvaise réponse après longue réflexion : lacune conceptuelle confirmée
      v_time_factor := 1.4;

    ELSIF NOT p_is_correct AND p_response_time_ms < 4000 THEN
      -- Mauvaise réponse rapide : probablement inattention, pas une lacune réelle
      v_time_factor := 0.6;

    -- Tous les autres cas : comportement standard (factor = 1.0)
    END IF;
  END IF;

  -- 4. Mise à jour BKT (formule bayésienne)
  IF p_is_correct THEN
    v_posterior := (v_old_mastery * (1.0 - v_p_slip)) /
                   (v_old_mastery * (1.0 - v_p_slip) + (1.0 - v_old_mastery) * v_p_guess);
  ELSE
    v_posterior := (v_old_mastery * v_p_slip) /
                   (v_old_mastery * v_p_slip + (1.0 - v_old_mastery) * (1.0 - v_p_guess));
  END IF;

  -- 5. Appliquer le facteur temps sur le delta de maîtrise
  v_posterior := v_old_mastery + (v_posterior - v_old_mastery) * v_time_factor;

  -- 6. Transition d'apprentissage
  v_new_mastery := v_posterior + (1.0 - v_posterior) * v_p_transit;

  -- 7. Borner entre 0 et 1
  v_new_mastery := GREATEST(0.0, LEAST(1.0, v_new_mastery));

  -- 8. Upsert dans knowledge_states
  INSERT INTO knowledge_states (child_id, skill_id, p_mastery, last_updated)
  VALUES (p_child_id, v_skill_id, v_new_mastery, NOW())
  ON CONFLICT (child_id, skill_id)
  DO UPDATE SET
    p_mastery    = EXCLUDED.p_mastery,
    last_updated = NOW();
END;
$$;

-- Vérification
SELECT 'update_bkt v2 (time-enriched) installée avec succès ✓' AS statut;
