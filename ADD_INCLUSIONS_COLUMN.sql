-- Quick Fix: Add inclusions column to products table
-- Run this in Supabase SQL Editor

-- Add inclusions column if it doesn't exist
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'products' 
    AND column_name = 'inclusions'
  ) THEN
    ALTER TABLE products 
    ADD COLUMN inclusions TEXT[];
    
    COMMENT ON COLUMN products.inclusions IS 'Array of items included in the complete set/kit';
    
    RAISE NOTICE 'Successfully added inclusions column to products table';
  ELSE
    RAISE NOTICE 'inclusions column already exists';
  END IF;
END $$;

-- Verify the column was added
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'products' 
AND column_name = 'inclusions';

