# Peptology by Issa - Setup Guide

## 🎨 Theme & Branding

Your e-commerce platform has been customized with:

- **Business Name:** Peptology by Issa
- **Tagline:** Premium Peptide Solutions
- **Theme:** Soft Glam
- **Colors:**
  - **Rose Gold:** Primary accent (#ea6d54)
  - **Dusty Rose:** Secondary accent (#d75e73)
  - **Muted Brown:** Text and borders (#8b7465)
  - **Cream:** Backgrounds (#d1bea5, #f5f0ea)
  - **Primary:** Base color (#d08b72)

## 📦 Products Included

Your catalog now features 14 premium peptide products:

### Individual Products
1. **BA3** - ₱120.00
2. **BA10** - ₱150.00
3. **5AD (AOD)** - ₱1,600.00
4. **SK5 (Selank)** - ₱900.00
5. **XA5 (Semax)** - ₱800.00
6. **CU50 (GHK-Cu)** - ₱800.00
7. **MS10 (MOTS-C)** - ₱1,300.00
8. **GTT (Glutathione)** - ₱1,400.00
9. **NJ500 (NAD+)** - ₱1,500.00
10. **CGL5 (Cagrilintide)** - ₱2,100.00
11. **KPV10** - ₱1,300.00
12. **LC216 (Lipo-C)** - ₱1,500.00

### Complete Sets
13. **TR15 Complete Set** - ₱2,500.00
14. **TR30 Complete Set** - ₱3,000.00

## 🚀 Setup Instructions

### Step 1: Environment Configuration

Create a `.env` file in the project root:

```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

**To get your Supabase credentials:**
1. Go to [supabase.com](https://supabase.com)
2. Create a new project or select existing one
3. Go to Settings > API
4. Copy the URL and anon/public key

### Step 2: Database Setup

Apply the migrations to your Supabase database:

1. Go to your Supabase Dashboard
2. Navigate to SQL Editor
3. Run the migrations in order:
   - First: `20250829160942_green_stream.sql`
   - Last: `20250112000004_peptology_by_issa_products.sql`

Or use Supabase CLI:
```bash
# Install Supabase CLI if you haven't
npm install -g supabase

# Link your project
supabase link --project-ref your-project-ref

# Push migrations
supabase db push
```

### Step 3: Start Development Server

```bash
# Install dependencies (already done)
npm install

# Start the dev server
npm run dev
```

The application will be available at: `http://localhost:5173`

### Step 4: Admin Access

- URL: `http://localhost:5173/admin`
- Default Password: `Peptide@Admin!2025`
- Change this in `src/components/AdminDashboard.tsx` (line ~235)

## 🎯 Key Features

### Customer Features
- ✨ Beautiful soft glam design
- 🛍️ Product browsing with categories
- 🛒 Shopping cart functionality
- 💬 Facebook Messenger integration
- 📱 Fully responsive design
- 🔍 Search and filter products

### Admin Features
- 📊 Product management (CRUD operations)
- 🏷️ Category management
- 💳 Payment method configuration
- ⚙️ Site settings customization
- 🖼️ Image upload for products
- 📈 Basic analytics

## 🎨 Color Customization

If you want to adjust colors, edit:

**Tailwind Config:** `tailwind.config.js`
```javascript
colors: {
  primary: { ... },      // Muted Brown
  rosegold: { ... },     // Rose Gold
  dustyrose: { ... },    // Dusty Rose
  cream: { ... },        // Cream
  brown: { ... },        // Dark Brown
}
```

**CSS Variables:** `src/index.css`
```css
:root {
  --primary: #d08b72;
  --rosegold: #ea6d54;
  --dustyrose: #d75e73;
  --cream: #d1bea5;
  --brown: #8b7465;
}
```

## 📱 Facebook Messenger Setup

Update your Facebook Page ID in `src/components/Header.tsx`:

```typescript
const facebookPageId = '61573812453289'; // Replace with your page ID
```

**To get your Page ID:**
1. Go to your Facebook Page
2. Click "About"
3. Scroll down to find Page ID
4. Copy and paste in the code

## 🚢 Deployment

### Deploy to Vercel (Recommended)

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel

# Follow the prompts
```

Or use the Vercel Dashboard:
1. Connect your GitHub repository
2. Add environment variables (VITE_SUPABASE_URL, VITE_SUPABASE_ANON_KEY)
3. Deploy!

### Build for Production

```bash
npm run build
```

The production files will be in the `dist/` folder.

## 📝 Product Categories

Your site includes these categories:
- **Research Peptides** - Core peptides for research
- **Performance Enhancement** - Athletic and metabolic support
- **Cognitive Enhancement** - Brain health and nootropics
- **Cosmetic Peptides** - Beauty and anti-aging
- **Healing & Recovery** - Wound healing and regeneration
- **Complete Sets** - Ready-to-use kits

## 🔐 Security Reminders

1. **Never commit `.env` file** to version control
2. **Change admin password** immediately
3. **Enable Row Level Security** in Supabase:
   ```sql
   ALTER TABLE products ENABLE ROW LEVEL SECURITY;
   ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
   ALTER TABLE payment_methods ENABLE ROW LEVEL SECURITY;
   
   -- Allow public read access
   CREATE POLICY "Allow public read" ON products FOR SELECT USING (true);
   CREATE POLICY "Allow public read" ON categories FOR SELECT USING (true);
   CREATE POLICY "Allow public read" ON payment_methods FOR SELECT USING (true);
   ```

## 🎯 Next Steps

1. ✅ Set up environment variables
2. ✅ Apply database migrations
3. ✅ Start development server
4. ✅ Test the site locally
5. ⬜ Upload product images
6. ⬜ Configure payment methods in admin
7. ⬜ Update contact information
8. ⬜ Test checkout flow
9. ⬜ Deploy to production
10. ⬜ Set up custom domain

## 💡 Tips

- **Product Images:** Upload high-quality images (1:1 ratio recommended)
- **Categories:** Use the admin panel to customize category order
- **Pricing:** Update prices anytime in the admin panel
- **Stock:** Keep inventory updated to avoid overselling
- **Legal:** Ensure compliance with local regulations for peptide sales

## 🆘 Support

If you encounter issues:

1. Check browser console for errors
2. Verify Supabase connection
3. Ensure all migrations are applied
4. Clear browser cache
5. Check Node.js version (18+ required)

## 📞 Contact

For customizations or support, reach out to your developer.

---

**Version:** 1.0.0 - Peptology by Issa Edition  
**Last Updated:** January 12, 2025  
**Theme:** Soft Glam (Rose Gold, Dusty Rose, Muted Brown, Cream)

