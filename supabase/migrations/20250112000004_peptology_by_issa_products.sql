-- Peptology by Issa - Product Update Migration
-- Clear existing products and add new product catalog

-- Clear existing products
TRUNCATE TABLE products CASCADE;

-- Insert BA3 product
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

-- Insert BA10 product
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

-- Insert 5AD (AOD) product
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

-- Insert SK5 (Selank) product
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

-- Insert XA5 (Semax) product
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

-- Insert CU50 (GHK-Cu) product
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

-- Insert MS10 (MOTS-C) product
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

-- Insert GTT (Glutathione) product
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

-- Insert NJ500 (NAD+) product
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

-- Insert CGL5 (Cagrilintide) product
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

-- Insert KPV10 product
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

-- Insert LC216 (Lipo-C) product
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

-- Insert TR15 Complete Set
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

-- Insert TR30 Complete Set
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

-- Update site settings for Peptology by Issa
UPDATE site_settings SET value = 'Peptology by Issa' WHERE id = 'site_name';
UPDATE site_settings SET value = 'Premium Peptide Solutions' WHERE id = 'site_tagline';
UPDATE site_settings SET value = 'info@peptologybyissa.com' WHERE id = 'contact_email';
UPDATE site_settings SET value = '+63 XXX XXX XXXX' WHERE id = 'contact_phone';

-- Update or insert site settings if they don't exist
INSERT INTO site_settings (id, value, type, description) 
VALUES ('site_name', 'Peptology by Issa', 'text', 'Name of the business')
ON CONFLICT (id) DO UPDATE SET value = 'Peptology by Issa';

INSERT INTO site_settings (id, value, type, description) 
VALUES ('site_tagline', 'Premium Peptide Solutions', 'text', 'Business tagline')
ON CONFLICT (id) DO UPDATE SET value = 'Premium Peptide Solutions';

-- Ensure all product categories exist
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('research-peptides', 'Research Peptides', 'FlaskConical', 1, true),
  ('performance-enhancement', 'Performance Enhancement', 'Zap', 2, true),
  ('cognitive-enhancement', 'Cognitive Enhancement', 'Brain', 3, true),
  ('cosmetic-peptides', 'Cosmetic Peptides', 'Sparkles', 4, true),
  ('healing-recovery', 'Healing & Recovery', 'Heart', 5, true),
  ('complete-sets', 'Complete Sets', 'Package', 6, true)
ON CONFLICT (id) DO NOTHING;

-- Success message
DO $$
BEGIN
  RAISE NOTICE 'Peptology by Issa products have been successfully added!';
END $$;

