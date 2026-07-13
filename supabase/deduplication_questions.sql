-- ============================================================
-- DÉDUPLICATION questions — garde 1 exemplaire par (title, skill_id)
-- Coller dans Supabase → SQL Editor → Run
-- ============================================================

-- 1. Aperçu avant suppression
SELECT COUNT(*) AS total_avant FROM questions;

-- 2. Suppression des doublons
-- Garde le premier enregistrement (par id) pour chaque (title, skill_id)
WITH ranked AS (
  SELECT id,
         ROW_NUMBER() OVER (
           PARTITION BY title, skill_id
           ORDER BY id
         ) AS rn
  FROM questions
)
DELETE FROM questions
WHERE id IN (
  SELECT id FROM ranked WHERE rn > 1
);

-- 3. Vérification après
SELECT COUNT(*) AS total_apres FROM questions;

-- 4. Comptes par compétence (doit être ≥ 100 partout)
SELECT
  s.name        AS competence,
  COUNT(q.id)   AS nb_questions
FROM questions q
JOIN skills s ON s.id = q.skill_id
WHERE q.is_active = true
GROUP BY s.name
ORDER BY s.name;
