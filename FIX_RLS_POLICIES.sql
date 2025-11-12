-- ============================================================
-- FIX: Allow Admin Dashboard to Update Products
-- Run this in your Supabase SQL Editor
-- ============================================================

-- Drop ALL existing policies on these tables
DO $$ 
DECLARE 
  pol RECORD;
BEGIN
  FOR pol IN 
    SELECT policyname, tablename 
    FROM pg_policies 
    WHERE schemaname = 'public' 
    AND tablename IN ('products', 'product_variations', 'product_inclusions')
  LOOP
    EXECUTE format('DROP POLICY IF EXISTS %I ON %I', pol.policyname, pol.tablename);
  END LOOP;
END $$;

-- ============================================================
-- Products: Allow public to read AND manage (admin has password)
-- ============================================================
CREATE POLICY "Public can read products"
  ON products FOR SELECT 
  TO public 
  USING (true);

CREATE POLICY "Public can insert products"
  ON products FOR INSERT 
  TO public 
  WITH CHECK (true);

CREATE POLICY "Public can update products"
  ON products FOR UPDATE 
  TO public 
  USING (true) 
  WITH CHECK (true);

CREATE POLICY "Public can delete products"
  ON products FOR DELETE 
  TO public 
  USING (true);

-- ============================================================
-- Product Variations: Allow public to manage
-- ============================================================
CREATE POLICY "Public can read product variations"
  ON product_variations FOR SELECT 
  TO public 
  USING (true);

CREATE POLICY "Public can insert product variations"
  ON product_variations FOR INSERT 
  TO public 
  WITH CHECK (true);

CREATE POLICY "Public can update product variations"
  ON product_variations FOR UPDATE 
  TO public 
  USING (true) 
  WITH CHECK (true);

CREATE POLICY "Public can delete product variations"
  ON product_variations FOR DELETE 
  TO public 
  USING (true);

-- ============================================================
-- Product Inclusions: Allow public to manage
-- ============================================================
CREATE POLICY "Public can read product inclusions"
  ON product_inclusions FOR SELECT 
  TO public 
  USING (true);

CREATE POLICY "Public can insert product inclusions"
  ON product_inclusions FOR INSERT 
  TO public 
  WITH CHECK (true);

CREATE POLICY "Public can update product inclusions"
  ON product_inclusions FOR UPDATE 
  TO public 
  USING (true) 
  WITH CHECK (true);

CREATE POLICY "Public can delete product inclusions"
  ON product_inclusions FOR DELETE 
  TO public 
  USING (true);

-- ============================================================
-- DONE! Your admin dashboard should now work
-- ============================================================

-- Verify policies are active:
SELECT schemaname, tablename, policyname, cmd, qual
FROM pg_policies
WHERE tablename IN ('products', 'product_variations', 'product_inclusions')
ORDER BY tablename, policyname;

