const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'sorange': '#F08A5D',
        'syellow': '#F9ED69',
        'sred': '#B83B5E',
        'sdred': '#871550',
        'spurple': '#6A2C70',
        'sblack': '#222831',
        'slogoblack': '#0B0B0B',
        'sgray': '#393E46',
        'swaterblue': '#00ADB5',
        'slgray': '#F9F7F7',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    ({ addVariant }) => {
      addVariant("turbo-native", "html[data-turbo-native] &"),
        addVariant('non-turbo-native', "html:not([data-turbo-native]) &")
    }
  ]
}
