-- ============================================================
-- TEMPORARY: Disable RLS to Test if That's the Issue
-- This is just for testing - we'll re-enable it after
-- ============================================================

-- Disable RLS on products table
ALTER TABLE products DISABLE ROW LEVEL SECURITY;

-- Disable RLS on related tables
ALTER TABLE product_variations DISABLE ROW LEVEL SECURITY;
ALTER TABLE product_inclusions DISABLE ROW LEVEL SECURITY;
ALTER TABLE categories DISABLE ROW LEVEL SECURITY;
ALTER TABLE payment_methods DISABLE ROW LEVEL SECURITY;
ALTER TABLE site_settings DISABLE ROW LEVEL SECURITY;

-- Check status
SELECT 
  tablename,
  rowsecurity as "RLS Enabled (should be false)"
FROM pg_tables
WHERE schemaname = 'public'
AND tablename IN ('products', 'product_variations', 'categories')
ORDER BY tablename;

