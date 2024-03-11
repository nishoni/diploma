/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [ "./app/**/*.{vue,js,ts,jsx,tsx,html,erb,rb}", ],
  theme: {
    extend: {},
  },
  plugins: [require("@tailwindcss/typography"), require("daisyui")],
}

