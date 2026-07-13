-- ============================================================
-- EXERCISE_RESPONSES — Table des tentatives individuelles
-- + record_attempt fonctionnel
-- Coller dans le SQL Editor Supabase et exécuter
-- ============================================================

-- 1. Créer la table exercise_responses
-- ---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS exercise_responses (
  id               UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id       UUID        NOT NULL REFERENCES exercise_sessions(id) ON DELETE CASCADE,
  child_id         UUID        NOT NULL REFERENCES children(id)          ON DELETE CASCADE,
  question_id      UUID        NOT NULL REFERENCES questions(id)         ON DELETE CASCADE,
  is_correct       BOOLEAN     NOT NULL,
  answer_given     TEXT,
  response_time_ms INT,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Index pour l'anti-répétition
CREATE INDEX IF NOT EXISTS idx_exercise_responses_child_question
  ON exercise_responses (child_id, question_id, created_at DESC);

-- RLS
ALTER TABLE exercise_responses ENABLE ROW LEVEL SECURITY;

-- Policy : les parents lisent les réponses de leurs enfants
DROP POLICY IF EXISTS "parent_read_responses" ON exercise_responses;
CREATE POLICY "parent_read_responses"
  ON exercise_responses FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM parent_child_links
      WHERE parent_child_links.parent_id = auth.uid()
        AND parent_child_links.child_id  = exercise_responses.child_id
    )
  );


-- 2. Recréer record_attempt
-- ---------------------------------------------------------------
CREATE OR REPLACE FUNCTION record_attempt(
  p_session_id       UUID,
  p_child_id         UUID,
  p_question_id      UUID,
  p_is_correct       BOOLEAN,
  p_answer_given     TEXT    DEFAULT NULL,
  p_response_time_ms INT     DEFAULT NULL
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO exercise_responses (
    session_id, child_id, question_id,
    is_correct, answer_given, response_time_ms
  ) VALUES (
    p_session_id, p_child_id, p_question_id,
    p_is_correct, p_answer_given, p_response_time_ms
  );
END;
$$;


-- 3. Vérification
-- ---------------------------------------------------------------
SELECT
  (SELECT COUNT(*) FROM information_schema.tables
   WHERE table_name = 'exercise_responses' AND table_schema = 'public')
   AS table_exists,
  (SELECT COUNT(*) FROM pg_proc WHERE proname = 'record_attempt')
   AS record_attempt_fn;
