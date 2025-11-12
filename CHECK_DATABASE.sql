-- ============================================================
-- CHECK DATABASE STATUS
-- Run this to see what's actually in your database
-- ============================================================

-- 1. Check if products table exists and has data
SELECT 
  'Products in database:' as info,
  COUNT(*) as total_products
FROM products;

-- 2. Check the specific product you're trying to update (5AD)
SELECT 
  id,
  name,
  base_price,
  discount_price,
  category,
  stock_quantity,
  available
FROM products
WHERE name LIKE '%5AD%' OR name LIKE '%AOD%';

-- 3. Check all current RLS policies on products table
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies
WHERE tablename = 'products'
ORDER BY policyname;

-- 4. Check if RLS is enabled
SELECT 
  tablename,
  rowsecurity as "RLS Enabled"
FROM pg_tables
WHERE schemaname = 'public'
AND tablename IN ('products', 'product_variations', 'categories');

-- 5. List all your products with prices
SELECT 
  name,
  base_price,
  discount_price,
  stock_quantity,
  available
FROM products
ORDER BY name;

