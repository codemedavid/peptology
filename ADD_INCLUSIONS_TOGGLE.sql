-- Add toggle to control when inclusions are displayed
-- Run this in Supabase SQL Editor after ADD_INCLUSIONS_COLUMN.sql

-- Add show_inclusions column to products table
ALTER TABLE products 
ADD COLUMN IF NOT EXISTS show_inclusions BOOLEAN DEFAULT false;

-- Add comment for documentation
COMMENT ON COLUMN products.show_inclusions IS 'Toggle to show/hide inclusions on product page. Enable for complete sets, disable for single items.';

-- Example: Enable inclusions for complete sets (optional)
-- Uncomment and modify as needed:
/*
UPDATE products 
SET show_inclusions = true 
WHERE name LIKE '%Complete Set%' 
   OR name LIKE '%Kit%'
   OR inclusions IS NOT NULL;
*/

-- Verify the columns were added
SELECT 
  column_name, 
  data_type, 
  column_default,
  is_nullable
FROM information_schema.columns 
WHERE table_name = 'products' 
AND column_name IN ('inclusions', 'show_inclusions')
ORDER BY column_name;

