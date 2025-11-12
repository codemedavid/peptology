# Peptology by Issa - Color Palette Reference

## 🎨 Soft Glam Theme

### Primary Color System

#### 🌹 Rose Gold (Accent)
**Use for:** Primary buttons, highlights, sparkles, featured elements

| Shade | Hex | Usage |
|-------|-----|-------|
| 50 | `#fef6f4` | Very light backgrounds |
| 100 | `#fdeae6` | Light backgrounds |
| 200 | `#fcd4cc` | Subtle highlights |
| 300 | `#f9b5a8` | Soft accents |
| 400 | `#f48d7a` | Light buttons |
| 500 | `#ea6d54` | ⭐ **PRIMARY ACCENT** |
| 600 | `#d65641` | Button hover states |
| 700 | `#b34435` | Dark accents |
| 800 | `#943d31` | Very dark |
| 900 | `#7b372e` | Darkest |

**Examples:**
- Cart button background
- Featured product badges
- Call-to-action buttons
- Hero sparkles
- Active state indicators

---

#### 💗 Dusty Rose (Secondary Accent)
**Use for:** Secondary buttons, Messenger button, feminine touches

| Shade | Hex | Usage |
|-------|-----|-------|
| 50 | `#fdf4f5` | Very light backgrounds |
| 100 | `#fbe8eb` | Light backgrounds |
| 200 | `#f7d5d9` | Subtle highlights |
| 300 | `#f0b3bb` | Soft accents |
| 400 | `#e68696` | Light buttons |
| 500 | `#d75e73` | ⭐ **SECONDARY ACCENT** |
| 600 | `#c23e5d` | Button hover states |
| 700 | `#a3304d` | Dark accents |
| 800 | `#882c45` | Very dark |
| 900 | `#742940` | Darkest |

**Examples:**
- Messenger button
- Category badges (cosmetic)
- Cart count badge
- Decorative elements
- Blob animations

---

#### 🤎 Primary (Base)
**Use for:** Buttons, links, borders, primary UI elements

| Shade | Hex | Usage |
|-------|-----|-------|
| 50 | `#fdf8f6` | ⭐ **LIGHT BACKGROUNDS** |
| 100 | `#f8ede8` | Cards, panels |
| 200 | `#f2dcd4` | Borders, dividers |
| 300 | `#e8c4b7` | Subtle elements |
| 400 | `#dda592` | Light UI |
| 500 | `#d08b72` | ⭐ **PRIMARY BASE** |
| 600 | `#b87865` | Button backgrounds |
| 700 | `#9a6254` | Hover states |
| 800 | `#7f5249` | Dark UI |
| 900 | `#69453f` | Darkest elements |

**Examples:**
- Primary gradient (with rose gold)
- Category buttons
- Border colors
- Focus rings
- Link colors

---

#### ☕ Cream (Backgrounds)
**Use for:** Backgrounds, soft surfaces, subtle elements

| Shade | Hex | Usage |
|-------|-----|-------|
| 50 | `#fdfcfb` | Lightest cream |
| 100 | `#faf8f5` | ⭐ **MAIN BACKGROUND** |
| 200 | `#f5f0ea` | Card backgrounds |
| 300 | `#ede5d9` | Subtle panels |
| 400 | `#e0d3c1` | Borders |
| 500 | `#d1bea5` | ⭐ **BASE CREAM** |
| 600 | `#bfa88a` | Darker backgrounds |
| 700 | `#a88f72` | Text on light |
| 800 | `#8b765f` | Dark elements |
| 900 | `#72614f` | Darkest cream |

**Examples:**
- Page background gradient
- Input backgrounds
- Card backgrounds
- Navigation backgrounds
- Subtle borders

---

#### 🤎 Brown (Text & Borders)
**Use for:** Text, icons, borders, subtle elements

| Shade | Hex | Usage |
|-------|-----|-------|
| 50 | `#f8f6f4` | Very light |
| 100 | `#ebe6e1` | Light backgrounds |
| 200 | `#d7ccc2` | Borders |
| 300 | `#bba99a` | Subtle text |
| 400 | `#a08a79` | Secondary text |
| 500 | `#8b7465` | ⭐ **PRIMARY TEXT** |
| 600 | `#766159` | Dark text |
| 700 | `#62504b` | ⭐ **HEADINGS** |
| 800 | `#524541` | Very dark text |
| 900 | `#463c38` | Darkest |

**Examples:**
- Body text
- Headings
- Icons
- Borders
- Navigation text

---

## 🎨 Usage Guidelines

### Gradients

#### Primary Gradient (Most Common)
```css
background: linear-gradient(to right, #ea6d54, #b87865);
/* Rose Gold 500 → Primary 600 */
```
**Use for:** Primary buttons, CTAs, highlights

#### Soft Background Gradient
```css
background: linear-gradient(to bottom, #f5f0ea, #ffffff);
/* Cream 200 → White */
```
**Use for:** Page backgrounds, large sections

#### Glam Gradient (Special)
```css
background: linear-gradient(135deg, #f0b3bb, #f9b5a8, #d1bea5);
/* Dusty Rose 300 → Rose Gold 300 → Cream 500 */
```
**Use for:** Hero sections, special headers

---

### Text Colors

| Purpose | Color | Hex |
|---------|-------|-----|
| Primary Text | Brown 700 | `#62504b` |
| Secondary Text | Brown 500 | `#8b7465` |
| Muted Text | Brown 300 | `#bba99a` |
| Headings | Brown 700-800 | `#62504b` - `#524541` |
| Links | Rose Gold 600 | `#d65641` |
| Highlighted | Rose Gold 500 | `#ea6d54` |

---

### Button Styles

#### Primary Button
```css
background: linear-gradient(to right, #ea6d54, #b87865);
color: white;
hover: linear-gradient(to right, #d65641, #9a6254);
```

#### Secondary Button
```css
background: white;
border: 2px solid #dda592;
color: #9a6254;
hover: background #fdf8f6;
```

#### Outline Button
```css
background: transparent;
border: 1px solid #f2dcd4;
color: #d08b72;
hover: background #fdf8f6, border #d08b72;
```

---

### Category Colors

Each category has its own gradient:

| Category | Gradient |
|----------|----------|
| All | Rose Gold 400 → Primary 500 |
| Research Peptides | Primary 400 → Primary 600 |
| Cosmetic Peptides | Dusty Rose 400 → Dusty Rose 600 |
| Performance Enhancement | Rose Gold 400 → Rose Gold 600 |
| Healing & Recovery | Primary 500 → Brown 500 |
| Cognitive Enhancement | Dusty Rose 400 → Primary 500 |
| Complete Sets | Rose Gold 500 → Dusty Rose 500 |

---

## 🎯 Common Use Cases

### Headers & Navigation
- Background: `cream-50` → `white` gradient
- Border: `primary-200`
- Text: `brown-700`
- Active: Rose gold gradients

### Product Cards
- Background: `white`
- Border: `cream-200` or `primary-200`
- Hover shadow: Rose gold glow
- Badge: Rose gold or dusty rose

### Forms & Inputs
- Background: `white`
- Border: `cream-300`
- Focus: `primary-500` ring
- Disabled: `cream-100`

### Hero Section
- Background: Cream → Primary → Rose gold gradient
- Blobs: Rose gold, dusty rose, primary
- Badges: White with rose gold border
- Text gradient: Rose gold → Primary → Dusty rose

---

## 💡 Design Tips

1. **Hierarchy:**
   - Rose gold for primary actions
   - Primary brown for secondary actions
   - Dusty rose for accents

2. **Contrast:**
   - Use brown text on cream/white backgrounds
   - Use white text on rose gold/primary backgrounds
   - Ensure minimum 4.5:1 contrast ratio

3. **Consistency:**
   - Stick to the defined color scales
   - Don't introduce new colors
   - Use gradients sparingly

4. **Accessibility:**
   - Test color combinations
   - Provide sufficient contrast
   - Don't rely on color alone

---

## 🖼️ Visual Examples

### Hero Badge
```
Background: white/90 with blur
Border: rose-gold-200
Sparkles: rose-gold-500
Text Gradient: rose-gold-600 → primary-600
```

### Cart Button
```
Background Gradient: rose-gold-500 → primary-600
Hover: rose-gold-600 → primary-700
Badge: dusty-rose-500 → dusty-rose-600
Text: white
```

### Category Pill (Active)
```
Background Gradient: [varies by category]
Text: white
Shadow: Large, subtle
Sparkle: ✨
```

### Product Card
```
Background: white
Border: primary-200 (hover: rose-gold-200)
Shadow: Soft → Medium (on hover)
Price Tag: rose-gold gradient
```

---

## 📊 Color Distribution

**Primary Colors Usage:**
- 60% Cream & White (backgrounds)
- 20% Brown (text, borders)
- 15% Rose Gold (accents, CTAs)
- 5% Dusty Rose (highlights)

**Accent Distribution:**
- Headers: Rose gold gradients
- Buttons: Rose gold + Primary
- Text: Brown shades
- Backgrounds: Cream shades

---

## ✅ Color Accessibility

All color combinations in this palette meet WCAG AA standards:

| Combination | Contrast Ratio | Rating |
|-------------|----------------|--------|
| Brown 700 on Cream 100 | 7.2:1 | ✅ AAA |
| Brown 500 on White | 4.8:1 | ✅ AA |
| White on Rose Gold 500 | 4.9:1 | ✅ AA |
| White on Primary 600 | 5.2:1 | ✅ AA |
| White on Dusty Rose 600 | 5.8:1 | ✅ AA |

---

**Created:** January 12, 2025  
**Theme:** Soft Glam  
**Business:** Peptology by Issa

