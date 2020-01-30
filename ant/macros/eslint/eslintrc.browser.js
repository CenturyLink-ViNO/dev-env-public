/* global module */

'use strict';

module.exports =
{
   'extends': ['./eslintrc.overrides.js'],
   'env': {
      'browser': true,
      'jquery': true
   },
   'rules': {
      'no-console': 'error',
      'new-cap': 'off',
      'max-lines-per-function': ['error', { 'max': 1000, 'skipBlankLines': true, 'skipComments': true }],
      'max-lines': ['error', 1000],
      'max-depth': ['error', 10],
      'complexity': ['error', 15],
      'consistent-this': ['error', 'outer', 'jqElement'],
      'no-debugger': 'error'
   }
};
