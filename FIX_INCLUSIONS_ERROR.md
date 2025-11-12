# 🔧 Fix "inclusions column not found" Error

## Problem
Error message: **"Could not find the 'inclusions' column of 'products' in the schema cache"**

This means your Supabase database is missing the `inclusions` column.

---

## ✅ Quick Fix (2 Minutes)

### Step 1: Open Supabase Dashboard

1. Go to [supabase.com](https://supabase.com)
2. Open your **Peptology project**
3. Click on **SQL Editor** in the left sidebar

### Step 2: Run the Fix SQL

1. Click **+ New query**
2. Copy and paste this code:

```sql
-- Add inclusions column to products table
ALTER TABLE products 
ADD COLUMN IF NOT EXISTS inclusions TEXT[];

-- Add comment for documentation
COMMENT ON COLUMN products.inclusions IS 'Array of items included in the complete set/kit';
```

3. Click **RUN** button (or press Ctrl/Cmd + Enter)
4. You should see: ✅ **Success. No rows returned**

### Step 3: Verify the Fix

Run this query to confirm:

```sql
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'products' 
AND column_name = 'inclusions';
```

You should see:
```
column_name  | data_type
-------------|----------
inclusions   | ARRAY
```

### Step 4: Test It

1. Go back to your admin panel
2. Try adding or editing a product
3. The error should be gone! ✅

---

## 🎯 What This Column Does

The `inclusions` column allows you to list what's included in complete peptide sets:

**Example:**
- 🧬 Peptide and bacteriostatic water
- 🧬 Syringe for reconstitution
- 🧬 6pcs Insulin Syringe
- 🧬 Plastic container and box
- 🧬 10pcs alcohol pads

This appears as a beautiful checklist on product pages!

---

## 📁 Alternative: Use the SQL File

I've created a ready-to-use SQL file for you:

**File:** `ADD_INCLUSIONS_COLUMN.sql`

1. Open it in your code editor
2. Copy all the contents
3. Paste into Supabase SQL Editor
4. Run it

---

## ❓ Still Having Issues?

### Error persists after running SQL?

1. **Refresh Supabase Schema Cache:**
   - In Supabase dashboard
   - Go to **Settings** → **API**
   - Scroll down and click **Refresh schema cache**

2. **Check if column exists:**
   ```sql
   SELECT * FROM information_schema.columns 
   WHERE table_name = 'products';
   ```
   Look for `inclusions` in the results

3. **Restart your dev server:**
   ```bash
   # Stop the server (Ctrl+C)
   npm run dev
   ```

### Still not working?

Run the complete migration:
```sql
-- Check current table structure
\d products

-- If inclusions doesn't exist, add it
ALTER TABLE products ADD COLUMN inclusions TEXT[];
```

---

## ✨ After Fixing

Once fixed, you can:

1. **Add inclusions to products** via Admin Panel
2. **Edit inclusions** - Go to product edit page
3. **View on frontend** - Complete sets will show beautiful inclusion lists
4. **Leave empty** - For single items without kits

---

## 🚀 Quick Commands

```bash
# If you need to rebuild/restart anything:
npm install
npm run dev
```

That's it! The error should be completely fixed now. 🎉

