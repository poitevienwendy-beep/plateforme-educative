-- ============================================================
-- PHASE 2 — Rapport parent & Mode révision
-- Coller dans le SQL Editor Supabase et exécuter
-- ============================================================

-- 1. Fonction : erreurs d'une session (pour mode révision)
-- ---------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_session_errors(
  p_session_id UUID,
  p_child_id   UUID
)
RETURNS TABLE(
  question_id     UUID,
  question_text   TEXT,
  options         JSONB,
  correct_answer  TEXT,
  answer_given    TEXT,
  explanation     TEXT,
  skill_name      TEXT
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  RETURN QUERY
  SELECT
    er.question_id,
    (q.content ->> 'question')::TEXT  AS question_text,
    (q.content -> 'options')::JSONB   AS options,
    (q.content ->> 'answer')::TEXT    AS correct_answer,
    er.answer_given,
    q.explanation,
    s.name                            AS skill_name
  FROM exercise_responses er
  JOIN questions  q ON q.id = er.question_id
  LEFT JOIN skills s ON s.id = q.skill_id
  WHERE er.session_id = p_session_id
    AND er.child_id   = p_child_id
    AND er.is_correct = false
  ORDER BY er.created_at;
END;
$$;

GRANT EXECUTE ON FUNCTION get_session_errors(UUID, UUID) TO authenticated;


-- 2. Fonction : statistiques hebdomadaires XP (8 dernières semaines)
-- ---------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_weekly_xp(
  p_child_id UUID,
  p_weeks    INT DEFAULT 8
)
RETURNS TABLE(
  week_start  DATE,
  week_label  TEXT,
  xp_earned   INT,
  sessions    INT,
  avg_pct     NUMERIC
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  RETURN QUERY
  WITH weeks AS (
    SELECT
      (current_date - (gs * 7) * INTERVAL '1 day')::DATE
        - EXTRACT(DOW FROM current_date - (gs * 7) * INTERVAL '1 day')::INT
      AS wstart
    FROM generate_series(p_weeks - 1, 0, -1) AS gs
  )
  SELECT
    w.wstart                                          AS week_start,
    TO_CHAR(w.wstart, 'DD Mon')                      AS week_label,
    COALESCE(SUM(xl.amount)::INT, 0)                 AS xp_earned,
    COUNT(DISTINCT es.id)::INT                        AS sessions,
    COALESCE(
      ROUND(
        AVG(
          CASE WHEN es.total_questions > 0
               THEN es.correct_answers::NUMERIC / es.total_questions * 100
          END
        ), 1
      ), 0
    )                                                 AS avg_pct
  FROM weeks w
  LEFT JOIN xp_log xl
         ON xl.child_id   = p_child_id
        AND DATE_TRUNC('week', xl.created_at)::DATE = w.wstart
  LEFT JOIN exercise_sessions es
         ON es.child_id    = p_child_id
        AND DATE_TRUNC('week', es.started_at)::DATE = w.wstart
        AND es.total_questions > 0
  GROUP BY w.wstart
  ORDER BY w.wstart;
END;
$$;

GRANT EXECUTE ON FUNCTION get_weekly_xp(UUID, INT) TO authenticated;


-- 3. Fonction : données rapport email hebdomadaire
-- ---------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_weekly_report_data(p_child_id UUID)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_result JSON;
  v_week_start DATE := DATE_TRUNC('week', NOW())::DATE;
BEGIN
  SELECT JSON_BUILD_OBJECT(
    'child_name',      c.display_name,
    'xp_this_week',    COALESCE((
      SELECT SUM(amount) FROM xp_log
      WHERE child_id = p_child_id AND created_at >= v_week_start
    ), 0),
    'sessions_this_week', COALESCE((
      SELECT COUNT(*) FROM exercise_sessions
      WHERE child_id = p_child_id
        AND started_at >= v_week_start
        AND total_questions > 0
    ), 0),
    'streak',          COALESCE(st.current_streak, 0),
    'total_xp',        COALESCE(c.total_xp, 0),
    'avg_accuracy',    COALESCE(ROUND((
      SELECT AVG(correct_answers::NUMERIC / NULLIF(total_questions,0) * 100)
      FROM exercise_sessions
      WHERE child_id = p_child_id
        AND started_at >= NOW() - INTERVAL '7 days'
        AND total_questions > 0
    ), 1), 0),
    'top_skill',       (
      SELECT s.name FROM knowledge_states ks
      JOIN skills s ON s.id = ks.skill_id
      WHERE ks.child_id = p_child_id
      ORDER BY ks.p_mastery DESC LIMIT 1
    ),
    'weak_skill',      (
      SELECT s.name FROM knowledge_states ks
      JOIN skills s ON s.id = ks.skill_id
      WHERE ks.child_id = p_child_id AND ks.p_mastery < 0.5
      ORDER BY ks.p_mastery ASC LIMIT 1
    )
  )
  INTO v_result
  FROM children c
  LEFT JOIN streaks st ON st.child_id = p_child_id
  WHERE c.id = p_child_id;

  RETURN v_result;
END;
$$;

GRANT EXECUTE ON FUNCTION get_weekly_report_data(UUID) TO authenticated;

-- Vérification
SELECT
  (SELECT COUNT(*) FROM pg_proc WHERE proname = 'get_session_errors')  AS fn_errors,
  (SELECT COUNT(*) FROM pg_proc WHERE proname = 'get_weekly_xp')       AS fn_weekly_xp,
  (SELECT COUNT(*) FROM pg_proc WHERE proname = 'get_weekly_report_data') AS fn_report;
