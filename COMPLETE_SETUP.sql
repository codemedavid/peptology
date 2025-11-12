-- ============================================================
-- COMPLETE DATABASE SETUP FOR PEPTOLOGY BY ISSA
-- Run this entire file in your Supabase SQL Editor
-- ============================================================

-- ============================================================
-- STEP 1: Drop existing tables if they exist
-- ============================================================
DROP TABLE IF EXISTS add_ons CASCADE;
DROP TABLE IF EXISTS variations CASCADE;
DROP TABLE IF EXISTS menu_items CASCADE;
DROP TABLE IF EXISTS product_variations CASCADE;
DROP TABLE IF EXISTS product_inclusions CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS payment_methods CASCADE;
DROP TABLE IF EXISTS site_settings CASCADE;

-- ============================================================
-- STEP 2: Create categories table
-- ============================================================
CREATE TABLE categories (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  icon TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- STEP 3: Create products table
-- ============================================================
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  category TEXT NOT NULL REFERENCES categories(id),
  base_price DECIMAL(10,2) NOT NULL,
  discount_price DECIMAL(10,2),
  discount_start_date TIMESTAMPTZ,
  discount_end_date TIMESTAMPTZ,
  discount_active BOOLEAN DEFAULT false,
  
  -- Peptide-specific fields
  purity_percentage DECIMAL(5,2) DEFAULT 99.00,
  molecular_weight TEXT,
  cas_number TEXT,
  sequence TEXT,
  storage_conditions TEXT DEFAULT 'Store at -20°C',
  
  -- Stock and availability
  stock_quantity INTEGER DEFAULT 0,
  available BOOLEAN DEFAULT true,
  featured BOOLEAN DEFAULT false,
  
  -- Images and metadata
  image_url TEXT,
  safety_sheet_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- STEP 4: Create product variations table
-- ============================================================
CREATE TABLE product_variations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  quantity_mg DECIMAL(10,2) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- STEP 5: Create product inclusions table
-- ============================================================
CREATE TABLE product_inclusions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  quantity INTEGER DEFAULT 1,
  description TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- STEP 6: Create payment methods table
-- ============================================================
CREATE TABLE payment_methods (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  account_number TEXT NOT NULL,
  account_name TEXT NOT NULL,
  qr_code_url TEXT,
  active BOOLEAN DEFAULT true,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- STEP 7: Create site settings table
-- ============================================================
CREATE TABLE site_settings (
  id TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  type TEXT DEFAULT 'text',
  description TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- STEP 8: Enable Row Level Security
-- ============================================================
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_variations ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_inclusions ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE payment_methods ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

-- ============================================================
-- STEP 9: Create RLS Policies (Public Access for Admin Dashboard)
-- Note: Admin dashboard uses password protection in frontend
-- ============================================================

-- Products policies - Allow public to manage (admin has password protection)
CREATE POLICY "Public can read products"
  ON products FOR SELECT TO public USING (true);

CREATE POLICY "Public can insert products"
  ON products FOR INSERT TO public WITH CHECK (true);

CREATE POLICY "Public can update products"
  ON products FOR UPDATE TO public USING (true) WITH CHECK (true);

CREATE POLICY "Public can delete products"
  ON products FOR DELETE TO public USING (true);

-- Product variations policies
CREATE POLICY "Public can read product variations"
  ON product_variations FOR SELECT TO public USING (true);

CREATE POLICY "Public can insert product variations"
  ON product_variations FOR INSERT TO public WITH CHECK (true);

CREATE POLICY "Public can update product variations"
  ON product_variations FOR UPDATE TO public USING (true) WITH CHECK (true);

CREATE POLICY "Public can delete product variations"
  ON product_variations FOR DELETE TO public USING (true);

-- Product inclusions policies
CREATE POLICY "Public can read product inclusions"
  ON product_inclusions FOR SELECT TO public USING (true);

CREATE POLICY "Public can insert product inclusions"
  ON product_inclusions FOR INSERT TO public WITH CHECK (true);

CREATE POLICY "Public can update product inclusions"
  ON product_inclusions FOR UPDATE TO public USING (true) WITH CHECK (true);

CREATE POLICY "Public can delete product inclusions"
  ON product_inclusions FOR DELETE TO public USING (true);

-- Categories policies
CREATE POLICY "Public can read categories"
  ON categories FOR SELECT TO public USING (true);

CREATE POLICY "Public can insert categories"
  ON categories FOR INSERT TO public WITH CHECK (true);

CREATE POLICY "Public can update categories"
  ON categories FOR UPDATE TO public USING (true) WITH CHECK (true);

CREATE POLICY "Public can delete categories"
  ON categories FOR DELETE TO public USING (true);

-- Payment methods policies
CREATE POLICY "Public can read payment methods"
  ON payment_methods FOR SELECT TO public USING (true);

CREATE POLICY "Public can insert payment methods"
  ON payment_methods FOR INSERT TO public WITH CHECK (true);

CREATE POLICY "Public can update payment methods"
  ON payment_methods FOR UPDATE TO public USING (true) WITH CHECK (true);

CREATE POLICY "Public can delete payment methods"
  ON payment_methods FOR DELETE TO public USING (true);

-- Site settings policies
CREATE POLICY "Public can read site settings"
  ON site_settings FOR SELECT TO public USING (true);

CREATE POLICY "Public can insert site settings"
  ON site_settings FOR INSERT TO public WITH CHECK (true);

CREATE POLICY "Public can update site settings"
  ON site_settings FOR UPDATE TO public USING (true) WITH CHECK (true);

CREATE POLICY "Public can delete site settings"
  ON site_settings FOR DELETE TO public USING (true);

-- ============================================================
-- STEP 10: Insert Categories
-- ============================================================
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('all', 'All Products', 'Grid', 0, true),
  ('research-peptides', 'Research Peptides', 'FlaskConical', 1, true),
  ('performance-enhancement', 'Performance Enhancement', 'Zap', 2, true),
  ('cognitive-enhancement', 'Cognitive Enhancement', 'Brain', 3, true),
  ('cosmetic-peptides', 'Cosmetic Peptides', 'Sparkles', 4, true),
  ('healing-recovery', 'Healing & Recovery', 'Heart', 5, true),
  ('complete-sets', 'Complete Sets', 'Package', 6, true);

-- ============================================================
-- STEP 11: Insert Your Products
-- ============================================================

-- BA3 Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'BA3',
  'Premium peptide compound BA3 for research applications. High purity formulation designed for optimal stability and effectiveness.',
  'research-peptides',
  120.00,
  120.00,
  false,
  99.5,
  '342.4 Da',
  'BA3-001',
  'Custom Sequence',
  'Store at -20°C, protect from light',
  100,
  true,
  true,
  null
);

-- BA10 Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'BA10',
  'Advanced peptide formulation BA10 with enhanced bioavailability. Ideal for research in cellular function and signaling pathways.',
  'research-peptides',
  150.00,
  150.00,
  false,
  99.7,
  '485.6 Da',
  'BA10-002',
  'Custom Sequence',
  'Store at -20°C, protect from light',
  100,
  true,
  true,
  null
);

-- 5AD (AOD) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  '5AD (AOD)',
  'Anti-obesity drug peptide fragment for advanced metabolic research. Known for its stability and research-grade purity.',
  'performance-enhancement',
  1600.00,
  1600.00,
  false,
  98.8,
  '1815.1 Da',
  '221231-10-3',
  'Tyr-Leu-Arg-Ile-Val-Gln-Cys-Arg-Ser-Val-Glu-Gly-Ser-Cys-Gly-Phe',
  'Store at -20°C in lyophilized form',
  50,
  true,
  true,
  null
);

-- SK5 (Selank) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'SK5 (Selank)',
  'Anxiolytic peptide analog for cognitive research. Demonstrates excellent stability profile and research applications.',
  'cognitive-enhancement',
  900.00,
  900.00,
  false,
  99.2,
  '751.9 Da',
  '129954-34-3',
  'Thr-Lys-Pro-Arg-Pro-Gly-Pro',
  'Store at 2-8°C, protect from moisture',
  75,
  true,
  false,
  null
);

-- XA5 (Semax) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'XA5 (Semax)',
  'Neuropeptide analog for neurological research. Widely studied for its nootropic properties and research potential.',
  'cognitive-enhancement',
  800.00,
  800.00,
  false,
  99.4,
  '813.9 Da',
  '80714-61-0',
  'Met-Glu-His-Phe-Pro-Gly-Pro',
  'Store at 2-8°C, protect from moisture',
  75,
  true,
  false,
  null
);

-- CU50 (GHK-Cu) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'CU50 (GHK-Cu)',
  'Copper peptide complex for regenerative research and cosmetic applications. Known for its wound healing properties.',
  'cosmetic-peptides',
  800.00,
  800.00,
  false,
  99.0,
  '404.0 Da',
  '49557-75-7',
  'Gly-His-Lys-Cu²⁺',
  'Store at room temperature, protect from oxidation',
  100,
  true,
  false,
  null
);

-- MS10 (MOTS-C) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'MS10 (MOTS-C)',
  'Mitochondrial-derived peptide for metabolic research. Studied for its effects on exercise performance and longevity.',
  'performance-enhancement',
  1300.00,
  1300.00,
  false,
  98.5,
  '1675.0 Da',
  'MOTS-001',
  'Met-Arg-Trp-Gln-Glu-Met-Gly-Tyr-Ile-Phe-Tyr-Pro-Arg-Lys-Leu-Arg',
  'Store at -20°C, protect from light',
  60,
  true,
  false,
  null
);

-- GTT (Glutathione) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'GTT (Glutathione)',
  'Master antioxidant tripeptide for research in oxidative stress and cellular protection. Essential for detoxification studies.',
  'healing-recovery',
  1400.00,
  1400.00,
  false,
  99.8,
  '307.3 Da',
  '70-18-8',
  'γ-Glu-Cys-Gly',
  'Store at 2-8°C, protect from oxidation',
  80,
  true,
  true,
  null
);

-- NJ500 (NAD+) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'NJ500 (NAD+)',
  'Nicotinamide adenine dinucleotide for cellular energy research. Critical coenzyme for mitochondrial function studies.',
  'healing-recovery',
  1500.00,
  1500.00,
  false,
  99.9,
  '663.4 Da',
  '53-84-9',
  'Coenzyme Structure',
  'Store at -20°C, protect from light and moisture',
  70,
  true,
  true,
  null
);

-- CGL5 (Cagrilintide) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'CGL5 (Cagrilintide)',
  'Long-acting amylin analog for metabolic and appetite research. Advanced formulation with extended half-life.',
  'performance-enhancement',
  2100.00,
  2100.00,
  false,
  98.9,
  '3899.4 Da',
  'CGL-2024',
  'Modified Amylin Analog',
  'Store at 2-8°C, do not freeze',
  40,
  true,
  true,
  null
);

-- KPV10 Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'KPV10',
  'Anti-inflammatory tripeptide for research in inflammatory pathways and immune modulation. Derived from α-MSH.',
  'healing-recovery',
  1300.00,
  1300.00,
  false,
  99.3,
  '341.4 Da',
  'KPV-003',
  'Lys-Pro-Val',
  'Store at -20°C, stable at room temperature for short periods',
  65,
  true,
  false,
  null
);

-- LC216 (Lipo-C) Product
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'LC216 (Lipo-C)',
  'Lipotropic compound blend for metabolic and fat metabolism research. Contains methionine, inositol, and choline.',
  'performance-enhancement',
  1500.00,
  1500.00,
  false,
  98.7,
  'Variable',
  'LC-2024',
  'Lipotropic Complex',
  'Store at room temperature, protect from moisture',
  85,
  true,
  false,
  null
);

-- TR15 Complete Set
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'TR15 Complete Set',
  'Complete Tirzepatide 15mg research kit including all necessary components and accessories for comprehensive research studies.',
  'complete-sets',
  2500.00,
  2500.00,
  false,
  99.5,
  '4813.5 Da',
  '2023788-19-2',
  'Modified GIP/GLP-1 Dual Agonist',
  'Store at 2-8°C before reconstitution, -20°C after',
  30,
  true,
  true,
  null
);

-- TR30 Complete Set
INSERT INTO products (
  id, name, description, category, base_price, discount_price, discount_active,
  purity_percentage, molecular_weight, cas_number, sequence,
  storage_conditions, stock_quantity, available, featured, image_url
) VALUES (
  gen_random_uuid(),
  'TR30 Complete Set',
  'Premium Tirzepatide 30mg complete research kit with enhanced quantity for extended studies. Includes comprehensive accessories.',
  'complete-sets',
  3000.00,
  3000.00,
  false,
  99.5,
  '4813.5 Da',
  '2023788-19-2',
  'Modified GIP/GLP-1 Dual Agonist',
  'Store at 2-8°C before reconstitution, -20°C after',
  25,
  true,
  true,
  null
);

-- ============================================================
-- STEP 12: Insert Site Settings
-- ============================================================
INSERT INTO site_settings (id, value, type, description) VALUES
  ('site_name', 'Peptology by Issa', 'text', 'Name of the business'),
  ('site_tagline', 'Premium Peptide Solutions', 'text', 'Business tagline'),
  ('contact_email', 'info@peptologybyissa.com', 'text', 'Contact email address'),
  ('contact_phone', '+63 XXX XXX XXXX', 'text', 'Contact phone number'),
  ('minimum_order', '500', 'number', 'Minimum order amount in PHP');

-- ============================================================
-- DONE! Your database is now set up with all 14 products
-- ============================================================
-- You can now run: npm run dev
-- And visit: http://localhost:5173

