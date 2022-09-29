/* global module */

'use strict';

module.exports =
{
   'extends': ['./eslintrc.overrides.js'],
   'parserOptions': { 'ecmaFeatures': { 'globalReturn': true } },
   'globals': { 'msg': 'writeable' }
};
