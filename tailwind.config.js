/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        // Soft Glam Theme - Rose Gold, Dusty Rose, Muted Brown, Cream
        primary: {
          50: '#fdf8f6',
          100: '#f8ede8',
          200: '#f2dcd4',
          300: '#e8c4b7',
          400: '#dda592',
          500: '#d08b72',
          600: '#b87865',
          700: '#9a6254',
          800: '#7f5249',
          900: '#69453f',
        },
        rosegold: {
          50: '#fef6f4',
          100: '#fdeae6',
          200: '#fcd4cc',
          300: '#f9b5a8',
          400: '#f48d7a',
          500: '#ea6d54',
          600: '#d65641',
          700: '#b34435',
          800: '#943d31',
          900: '#7b372e',
        },
        dustyrose: {
          50: '#fdf4f5',
          100: '#fbe8eb',
          200: '#f7d5d9',
          300: '#f0b3bb',
          400: '#e68696',
          500: '#d75e73',
          600: '#c23e5d',
          700: '#a3304d',
          800: '#882c45',
          900: '#742940',
        },
        cream: {
          50: '#fdfcfb',
          100: '#faf8f5',
          200: '#f5f0ea',
          300: '#ede5d9',
          400: '#e0d3c1',
          500: '#d1bea5',
          600: '#bfa88a',
          700: '#a88f72',
          800: '#8b765f',
          900: '#72614f',
        },
        brown: {
          50: '#f8f6f4',
          100: '#ebe6e1',
          200: '#d7ccc2',
          300: '#bba99a',
          400: '#a08a79',
          500: '#8b7465',
          600: '#766159',
          700: '#62504b',
          800: '#524541',
          900: '#463c38',
        },
      },
      fontFamily: {
        inter: ['Inter', 'sans-serif'],
      },
      boxShadow: {
        'soft': '0 2px 8px rgba(208, 139, 114, 0.12)',
        'medium': '0 4px 16px rgba(208, 139, 114, 0.16)',
        'large': '0 8px 24px rgba(208, 139, 114, 0.20)',
        'glow': '0 0 20px rgba(234, 109, 84, 0.15)',
      },
      animation: {
        'fadeIn': 'fadeIn 0.4s ease-out',
        'slideIn': 'slideIn 0.3s ease-out',
        'pulse-slow': 'pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0', transform: 'translateY(10px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        slideIn: {
          '0%': { opacity: '0', transform: 'translateX(-20px)' },
          '100%': { opacity: '1', transform: 'translateX(0)' },
        },
      },
    },
  },
  plugins: [],
}
