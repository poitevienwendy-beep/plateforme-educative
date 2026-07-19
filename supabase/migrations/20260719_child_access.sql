-- =====================================================================
-- Migration : Accès enfant (PIN primaire + mode autonomie secondaire)
-- À exécuter dans : Supabase Dashboard → SQL Editor
-- =====================================================================

-- 1. Colonnes supplémentaires sur children
ALTER TABLE children
  ADD COLUMN IF NOT EXISTS child_pin_hash       TEXT,
  ADD COLUMN IF NOT EXISTS child_system_password TEXT,
  ADD COLUMN IF NOT EXISTS child_user_id        UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS autonomy_mode        BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS child_email          TEXT;

-- Index pour lookups child_user_id rapides
CREATE INDEX IF NOT EXISTS idx_children_child_user_id ON children(child_user_id);

-- =====================================================================
-- 2. Politiques RLS pour les utilisateurs "enfant"
--    (s'ajoutent aux politiques parent existantes)
-- =====================================================================

-- children : l'enfant peut lire son propre profil
DROP POLICY IF EXISTS "child_read_own_profile" ON children;
CREATE POLICY "child_read_own_profile"
  ON children FOR SELECT
  USING (child_user_id = auth.uid());

-- knowledge_states : l'enfant peut lire ses propres états
DROP POLICY IF EXISTS "child_read_own_knowledge_states" ON knowledge_states;
CREATE POLICY "child_read_own_knowledge_states"
  ON knowledge_states FOR SELECT
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- knowledge_states : l'enfant peut mettre à jour ses propres états
DROP POLICY IF EXISTS "child_update_own_knowledge_states" ON knowledge_states;
CREATE POLICY "child_update_own_knowledge_states"
  ON knowledge_states FOR UPDATE
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- knowledge_states : l'enfant peut insérer ses propres états
DROP POLICY IF EXISTS "child_insert_own_knowledge_states" ON knowledge_states;
CREATE POLICY "child_insert_own_knowledge_states"
  ON knowledge_states FOR INSERT
  WITH CHECK (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- exercise_sessions : l'enfant peut lire/écrire ses propres sessions
DROP POLICY IF EXISTS "child_read_own_sessions" ON exercise_sessions;
CREATE POLICY "child_read_own_sessions"
  ON exercise_sessions FOR SELECT
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

DROP POLICY IF EXISTS "child_insert_own_sessions" ON exercise_sessions;
CREATE POLICY "child_insert_own_sessions"
  ON exercise_sessions FOR INSERT
  WITH CHECK (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

DROP POLICY IF EXISTS "child_update_own_sessions" ON exercise_sessions;
CREATE POLICY "child_update_own_sessions"
  ON exercise_sessions FOR UPDATE
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- exercise_responses : l'enfant peut lire/insérer ses propres réponses
DROP POLICY IF EXISTS "child_read_own_responses" ON exercise_responses;
CREATE POLICY "child_read_own_responses"
  ON exercise_responses FOR SELECT
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

DROP POLICY IF EXISTS "child_insert_own_responses" ON exercise_responses;
CREATE POLICY "child_insert_own_responses"
  ON exercise_responses FOR INSERT
  WITH CHECK (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- streaks : l'enfant peut lire/écrire son propre streak
DROP POLICY IF EXISTS "child_read_own_streak" ON streaks;
CREATE POLICY "child_read_own_streak"
  ON streaks FOR SELECT
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

DROP POLICY IF EXISTS "child_upsert_own_streak" ON streaks;
CREATE POLICY "child_upsert_own_streak"
  ON streaks FOR ALL
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- xp_log : l'enfant peut lire/insérer son propre XP
DROP POLICY IF EXISTS "child_read_own_xp" ON xp_log;
CREATE POLICY "child_read_own_xp"
  ON xp_log FOR SELECT
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

DROP POLICY IF EXISTS "child_insert_own_xp" ON xp_log;
CREATE POLICY "child_insert_own_xp"
  ON xp_log FOR INSERT
  WITH CHECK (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- child_badges : l'enfant peut lire ses propres badges
DROP POLICY IF EXISTS "child_read_own_badges" ON child_badges;
CREATE POLICY "child_read_own_badges"
  ON child_badges FOR SELECT
  USING (
    child_id IN (SELECT id FROM children WHERE child_user_id = auth.uid())
  );

-- (consent_records a été supprimé — aucune politique nécessaire)
