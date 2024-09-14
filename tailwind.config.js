const plugin = require('tailwindcss/plugin')

/** @type {import('tailwindcss').Config} */

const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: ["./site/**/*.html"],
  theme: {
    extend: {
      colors: {
        'sidecar-gray': '#262625',
      },
      boxShadow: {
        'puck': '0 0 4px 0 #0003,0 2px 0 0 #0000001a'
      },
      fontFamily: {
        sans: [].concat(['Inter var'], defaultTheme.fontFamily.sans),
      },
    },
    container: {
      center: true
    },
    screens: {
      'sm': '375px',
      'md': '900px',
    }
  }
}
