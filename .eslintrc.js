module.exports = {
  root: true,
  env: {
    node: true
  },
  extends: [
    '@nuxtjs/eslint-config-typescript'
  ],
  rules: {
    camelcase: 'off',
    'no-case-declarations': 'off',

    // Allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
    'no-console': process.env.NODE_ENV === 'production' ? 2 : 0,
    'no-async-promise-executor': 0
  }
}
