-- ============================================================
-- PHASE 3 — Stripe : stripe_customer_id sur profiles
-- Coller dans le SQL Editor Supabase et exécuter
-- ============================================================

-- Ajouter stripe_customer_id à profiles (idempotent)
ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS stripe_customer_id TEXT,
  ADD COLUMN IF NOT EXISTS stripe_subscription_id TEXT,
  ADD COLUMN IF NOT EXISTS plan_expires_at TIMESTAMPTZ;

-- Index pour lookup rapide par customer Stripe
CREATE UNIQUE INDEX IF NOT EXISTS idx_profiles_stripe_customer
  ON profiles (stripe_customer_id)
  WHERE stripe_customer_id IS NOT NULL;

-- Fonction : mettre à jour le plan depuis le webhook Stripe
CREATE OR REPLACE FUNCTION set_user_plan(
  p_stripe_customer_id TEXT,
  p_plan               TEXT,           -- 'free' | 'premium'
  p_subscription_id    TEXT  DEFAULT NULL,
  p_expires_at         TIMESTAMPTZ DEFAULT NULL
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE profiles
  SET
    plan                   = p_plan,
    stripe_subscription_id = COALESCE(p_subscription_id, stripe_subscription_id),
    plan_expires_at        = p_expires_at,
    updated_at             = NOW()
  WHERE stripe_customer_id = p_stripe_customer_id;
END;
$$;

GRANT EXECUTE ON FUNCTION set_user_plan(TEXT, TEXT, TEXT, TIMESTAMPTZ) TO service_role;

-- Fonction : enregistrer le customer_id Stripe pour un utilisateur
CREATE OR REPLACE FUNCTION set_stripe_customer(
  p_user_id            UUID,
  p_stripe_customer_id TEXT
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE profiles
  SET stripe_customer_id = p_stripe_customer_id,
      updated_at         = NOW()
  WHERE id = p_user_id;
END;
$$;

GRANT EXECUTE ON FUNCTION set_stripe_customer(UUID, TEXT) TO service_role;

-- Vérification
SELECT
  (SELECT COUNT(*) FROM information_schema.columns
   WHERE table_name = 'profiles' AND column_name = 'stripe_customer_id') AS col_customer_id,
  (SELECT COUNT(*) FROM information_schema.columns
   WHERE table_name = 'profiles' AND column_name = 'stripe_subscription_id') AS col_sub_id,
  (SELECT COUNT(*) FROM pg_proc WHERE proname = 'set_user_plan') AS fn_set_plan,
  (SELECT COUNT(*) FROM pg_proc WHERE proname = 'set_stripe_customer') AS fn_set_customer;
