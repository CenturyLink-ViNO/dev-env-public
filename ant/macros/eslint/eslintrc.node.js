/* global module */

'use strict';

module.exports =
{
   'extends': ['./eslintrc.overrides.js'],

   'parserOptions': { 'sourceType': 'module' },

   'env': { 'node': true },
   'rules': {
      'no-console': 'off',
      'complexity': ['error', 22],
      'max-lines-per-function': ['error', { 'max': 600, 'skipBlankLines': true, 'skipComments': true }],
      'max-depth': ['error', 8],
      'no-bitwise': 'off',
      'max-statements': ['error', { 'max': 80 }],
      'no-negated-condition': 'off',
      'prefer-rest-params': 'off',
      'class-methods-use-this': 'off'
   },
   'overrides': [
      {
         'files': ['configure.js', 'ansible_inventory_tool.js'],
         'rules': { 'camelcase': 'off' }
      }
   ]
};
