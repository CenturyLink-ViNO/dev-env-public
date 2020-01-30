/* global module */

module.exports =
{
   'extends': ['plugin:@typescript-eslint/recommended', './eslintrc.overrides.js', './eslintrc.node.js'],
   'parser' : '@typescript-eslint/parser',
   'plugins' : ['@typescript-eslint'],
   'rules': {
       // note you must disable the base indent rule as it can report incorrect errors for TypeScript
       "indent": "off",
       "@typescript-eslint/indent": ["error", 3],
       "new-cap": "off",
       "arrow-body-style": "off",
       "no-unused-vars": ["error", { "args": "after-used" }],
       "@typescript-eslint/explicit-function-return-type": ["error", { "allowExpressions": true }]
   }
};
