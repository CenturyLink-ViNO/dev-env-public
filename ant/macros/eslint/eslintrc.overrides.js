/* global module */

'use strict';

module.exports =
{
   'extends': ['./eslintrc.all.js'],
   'rules': {
      'accessor-pairs': 'off',                     // enforce getter and setter pairs in objects
      'consistent-return': 'off',                  // require return statements to either always or never specify values
      'no-magic-numbers': 'off',                   // disallow magic numbers
      'no-multi-spaces': 'off',                    // disallow multiple spaces
      'no-restricted-properties': 'off',           // disallow certain properties on certain objects
      'no-warning-comments': 'off',                // disallow specified warning terms in comments
      'require-unicode-regexp': 'off',             // enforce the use of u flag on RegExp
      'wrap-iife': 'off',                          // require parentheses around immediate function invocations
      'init-declarations': 'off',                  // require or disallow initialization in variable declarations
      'no-restricted-globals': 'off',              // disallow specified global variables
      'no-process-env': 'off',                     // disallow the use of process.env
      'no-process-exit': 'off',                    // disallow the use of process.exit()
      'no-restricted-modules': 'off',              // disallow specified modules when loaded by require
      'no-sync': 'off',                            // disallow synchronous methods
      'array-bracket-newline': 'off',              // enforce linebreaks after opening and before closing array brackets
      'capitalized-comments': 'off',               // enforce or disallow capitalization of the first letter of a comment
      'computed-property-spacing': 'off',          // enforce consistent spacing inside computed property brackets
      'eol-last': 'off',                           // require or disallow newline at the end of files
      'func-name-matching': 'off',                 // require function names to match the name of the variable or property to which they are assigned
      'func-names': 'off',                         // require or disallow named function expressions
      'func-style': 'off',                         // enforce the consistent use of either function declarations or expressions
      'id-blacklist': 'off',                       // disallow specified identifiers
      'id-match': 'off',                           // require identifiers to match a specified regular expression
      'implicit-arrow-linebreak': 'off',           // enforce the location of arrow function bodies
      'line-comment-position': 'off',              // enforce position of line comments
      'linebreak-style': 'off',                    // enforce consistent linebreak style
      'lines-around-comment': 'off',               // require empty lines around comments
      'lines-between-class-members': 'off',        // require or disallow an empty line between class members
      'no-mixed-operators': 'off',                 // disallow mixed binary operators
      'multiline-ternary': 'off',                  // enforce newlines between operands of ternary expressions
      'newline-per-chained-call': 'off',           // require a newline after each call in a method chain
      'no-array-constructor': 'off',               // disallow Array constructors
      'no-inline-comments': 'off',                 // disallow inline comments after code
      'no-lonely-if': 'off',                       // disallow if statements as the only statement in else blocks
      'no-restricted-syntax': 'off',               // disallow specified syntax
      'no-ternary': 'off',                         // disallow ternary operators
      'object-property-newline': 'off',             // enforce placing object properties on separate lines
      'operator-assignment': 'off',                // require or disallow assignment operator shorthand where possible
      'padding-line-between-statements': 'off',    // require or disallow padding lines between statements
      // disallow using Object.assign with an object literal as the first argument and prefer the use of object spread instead.
      'prefer-object-spread': 'off',
      'sort-keys': 'off',                          // require object keys to be sorted
      'sort-vars': 'off',                          // require variables within the same declaration block to be sorted
      'unicode-bom': 'off',                        // require or disallow Unicode byte order mark (BOM)
      'no-restricted-imports': 'off',              // disallow specified modules when loaded by import
      'no-useless-constructor': 'off',             // disallow unnecessary constructors
      'prefer-arrow-callback': 'off',              // require using arrow functions for callbacks
      'prefer-destructuring': 'off',               // require destructuring from arrays and/or objects
      'prefer-numeric-literals': 'off',            // disallow parseInt() and Number.parseInt() in favor of binary, octal, and hexadecimal literals
      'prefer-spread': 'off',                      // require spread operators instead of .apply()
      'prefer-template': 'off',                    // require template literals instead of string concatenation
      'sort-imports': 'off',                       // enforce sorted import declarations within modules
      'yield-star-spacing': 'off'                  // require or disallow spacing around the * in yield* expressions */
   }
};
