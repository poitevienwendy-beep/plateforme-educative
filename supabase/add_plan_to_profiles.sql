-- Ajouter la colonne plan au profil parent (freemium)
-- À exécuter dans l'éditeur SQL de Supabase

ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS plan text NOT NULL DEFAULT 'free'
  CHECK (plan IN ('free', 'premium'));

-- Pour passer un compte en premium (remplacer par le vrai user_id) :
-- UPDATE profiles SET plan = 'premium' WHERE id = 'uuid-du-parent';
