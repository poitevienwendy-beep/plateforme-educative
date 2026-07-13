-- ============================================================
-- NETTOYAGE — Suppression des tables inutilisées
-- Coller dans le SQL Editor Supabase et exécuter
-- ============================================================

-- Doublons remplacés par les nouvelles tables
DROP TABLE IF EXISTS attempts             CASCADE; -- remplacé par exercise_responses
DROP TABLE IF EXISTS mastery_states       CASCADE; -- remplacé par knowledge_states
DROP TABLE IF EXISTS sessions             CASCADE; -- remplacé par exercise_sessions

-- Tables de fonctionnalités futures non encore implémentées
DROP TABLE IF EXISTS question_skills      CASCADE;
DROP TABLE IF EXISTS skill_prerequisites  CASCADE;
DROP TABLE IF EXISTS recommendations      CASCADE;
DROP TABLE IF EXISTS weekly_reports       CASCADE;
DROP TABLE IF EXISTS subscriptions        CASCADE;
DROP TABLE IF EXISTS consent_records      CASCADE;
DROP TABLE IF EXISTS data_deletion_requests CASCADE;

-- Vérification — doit retourner seulement les tables actives
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
