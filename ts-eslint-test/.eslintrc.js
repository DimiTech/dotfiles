module.exports =  {
  parser:  '@typescript-eslint/parser', // Specifies the ESLint parser
  extends:  [
    'plugin:@typescript-eslint/recommended', // Uses the recommended rules from the @typescript-eslint/eslint-plugin
  ],
  parserOptions: {
    ecmaVersion :  2018,
    sourceType  : 'module',
  },
  rules:  {
    'semi': ["error", "never"],
    '@typescript-eslint/member-delimiter-style': 0,
  },
}
