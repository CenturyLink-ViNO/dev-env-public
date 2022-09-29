/* global module */


module.exports =
{
   'extends': 'eslint:all',
   'parserOptions': {
      'ecmaVersion': 2017,
      'ecmaFeatures': { 'ecmaFeatures.globalReturn': false }
   },
   'env': { 'es6': true },
   'rules': {
      'no-async-promise-executor': 'error',        // disallow using an async function as a Promise executor
      'no-await-in-loop': 'error',                 // disallow await inside of loops
      'no-extra-parens': 'error',                  // disallow unnecessary parentheses
      'no-misleading-character-class': 'error',    // disallow characters which are made with multiple code points in character class syntax
      'no-prototype-builtins': ['off', 'always'],  // disallow calling some Object.prototype methods directly on objects
      'no-template-curly-in-string': 'error',      // disallow template literal placeholder syntax in regular strings
      'require-atomic-updates': 'error',           // disallow assignments that can lead to race conditions due to usage of await or yield
      'accessor-pairs': 'error',                   // enforce getter and setter pairs in objects
      'array-callback-return': 'error',            // enforce return statements in callbacks of array methods
      'block-scoped-var': 'error',                 // enforce the use of variables within the scope they are defined
      'class-methods-use-this': 'error',           // enforce that class methods utilize this
      'complexity': ['error', 10],                 // enforce a maximum cyclomatic complexity allowed in a program
      'consistent-return': 'error',                // require return statements to either always or never specify values
      'curly': ['error', 'all'],                   // 'all' enforce consistent brace style for all control statements
      'default-case': 'error',                     // require default cases in switch statements
      'dot-location': ['error', 'object'],         // enforce consistent newlines before and after dots
      'dot-notation': 'error',                     // enforce dot notation whenever possible
      'eqeqeq': 'error',                           // require the use of === and !==
      'guard-for-in': 'error',                     // require for-in loops to include an if statement
      'max-classes-per-file': ['error', 1],        // enforce a maximum number of classes per file
      'no-alert': 'error',                         // disallow the use of alert, confirm, and prompt
      'no-caller': 'error',                        // disallow the use of arguments.caller or arguments.callee
      'no-case-declarations': 'error',             // disallow lexical declarations in case clauses
      'no-div-regex': 'error',                     // disallow division operators explicitly at the beginning of regular expressions
      'no-else-return': 'error',                   // disallow else blocks after return statements in if statements
      'no-empty-function': 'error',                // disallow empty functions
      'no-empty-pattern': 'error',                 // disallow empty destructuring patterns
      'no-eq-null': 'error',                       // disallow null comparisons without type-checking operators
      'no-eval': 'error',                          // disallow the use of eval()
      'no-extend-native': 'error',                 // disallow extending native types
      'no-extra-bind': 'error',                    // disallow unnecessary calls to .bind()
      'no-extra-label': 'error',                   // disallow unnecessary labels
      'no-fallthrough': 'error',                   // disallow fallthrough of case statements
      'no-floating-decimal': 'error',              // disallow leading or trailing decimal points in numeric literals
      'no-global-assign': 'error',                 // disallow assignments to native objects or read-only global variables
      'no-implicit-coercion': 'error',             // disallow shorthand type conversions
      'no-implicit-globals': 'error',              // disallow variable and function declarations in the global scope
      'no-implied-eval': 'error',                  // disallow the use of eval()-like methods
      'no-invalid-this': 'error',                  // disallow this keywords outside of classes or class-like objects
      'no-iterator': 'error',                      // disallow the use of the __iterator__ property
      'no-labels': 'error',                        // disallow labeled statements
      'no-lone-blocks': 'error',                   // disallow unnecessary nested blocks
      'no-loop-func': 'error',                     // disallow function declarations and expressions inside loop statements
      'no-magic-numbers': 'error',                 // disallow magic numbers
      'no-multi-spaces': 'error',                  // disallow multiple spaces
      'no-multi-str': 'error',                     // disallow multiline strings
      'no-new': 'error',                           // disallow new operators outside of assignments or comparisons
      'no-new-func': 'error',                      // disallow new operators with the Function object
      'no-new-wrappers': 'error',                  // disallow new operators with the String, Number, and Boolean objects
      'no-octal': 'error',                         // disallow octal literals
      'no-octal-escape': 'error',                  // disallow octal escape sequences in string literals
      'no-param-reassign': 'error',                // disallow reassigning function parameters
      'no-proto': 'error',                         // disallow the use of the __proto__ property
      'no-redeclare': 'error',                     // disallow variable redeclaration
      'no-restricted-properties': 'error',         // disallow certain properties on certain objects
      'no-return-assign': 'error',                 // disallow assignment operators in return statements
      'no-return-await': 'error',                  // disallow unnecessary return await
      'no-script-url': 'error',                    // disallow javascript: urls
      'no-self-assign': 'error',                   // disallow assignments where both sides are exactly the same
      'no-self-compare': 'error',                  // disallow comparisons where both sides are exactly the same
      'no-sequences': 'error',                     // disallow comma operators
      'no-throw-literal': 'error',                 // disallow throwing literals as exceptions
      'no-unmodified-loop-condition': 'error',     // disallow unmodified loop conditions
      'no-unused-expressions': 'error',            // disallow unused expressions
      'no-unused-labels': 'error',                 // disallow unused labels
      'no-useless-call': 'error',                  // disallow unnecessary calls to .call() and .apply()
      'no-useless-catch': 'error',                 // disallow unnecessary catch clauses
      'no-useless-concat': 'error',                // disallow unnecessary concatenation of literals or template literals
      'no-useless-escape': 'error',                // disallow unnecessary escape characters
      'no-useless-return': 'error',                // disallow redundant return statements
      'no-void': 'error',                          // disallow void operators
      'no-warning-comments': 'error',              // disallow specified warning terms in comments
      'no-with': 'error',                          // disallow with statements
      'prefer-promise-reject-errors': 'error',     // require using Error objects as Promise rejection reasons
      'radix': 'error',                            // enforce the consistent use of the radix argument when using parseInt()
      'require-await': 'error',                    // disallow async functions which have no await expression
      'require-unicode-regexp': 'error',           // enforce the use of u flag on RegExp
      'vars-on-top': 'error',                      // require var declarations be placed at the top of their containing scope
      'wrap-iife': 'error',                        // require parentheses around immediate function invocations
      'yoda': ['error', 'never'],                  // require or disallow “Yoda” conditions
      'strict': ['error', 'global'],               // require or disallow strict mode directives
      'init-declarations': 'error',                // require or disallow initialization in variable declarations
      'no-delete-var': 'error',                    // disallow deleting variables
      'no-label-var': 'error',                     // disallow labels that share a name with a variable
      'no-restricted-globals': 'error',            // disallow specified global variables
      'no-shadow': 'error',                        // disallow variable declarations from shadowing variables declared in the outer scope
      'no-shadow-restricted-names': 'error',       // disallow identifiers from shadowing restricted names
      'no-undef': 'error',                         // disallow the use of undeclared variables unless mentioned in /*global */ comments
      'no-undef-init': 'error',                    // disallow initializing variables to undefined
      'no-undefined': ['off', 'always'],           // disallow the use of undefined as an identifier
      'no-unused-vars': 'error',                   // disallow unused variables
      'no-use-before-define': 'error',             // disallow the use of variables before they are defined
      'callback-return': ['error', ['callback', 'cb', 'next']], // require return statements after callbacks
      'global-require': 'error',                   // require require() calls to be placed at top-level module scope
      'handle-callback-err': ['error', 'error'],   // require error handling in callbacks
      'no-buffer-constructor': 'error',            // disallow use of the Buffer() constructor
      'no-mixed-requires': 'error',                // disallow require calls to be mixed with regular variable declarations
      'no-new-require': 'error',                   // disallow new operators with calls to require
      'no-path-concat': 'error',                   // disallow string concatenation with __dirname and __filename
      'no-process-env': 'error',                   // disallow the use of process.env
      'no-process-exit': 'error',                  // disallow the use of process.exit()
      'no-restricted-modules': 'error',            // disallow specified modules when loaded by require
      'no-sync': 'error',                          // disallow synchronous methods
      'array-bracket-newline': 'error',            // enforce linebreaks after opening and before closing array brackets
      'array-bracket-spacing': ['error', 'never'], // enforce consistent spacing inside array brackets
      'array-element-newline': ['error', 'consistent'], // enforce line breaks after each array element
      'block-spacing': ['error', 'always'],        // disallow or enforce spaces inside of blocks after opening block and before closing block
      'brace-style': ['error', 'allman'],          // enforce consistent brace style for blocks
      'camelcase': ['error', { 'properties': 'always', 'ignoreDestructuring': false }],  // enforce camelcase naming convention
      'capitalized-comments': 'error',             // enforce or disallow capitalization of the first letter of a comment
      'comma-dangle': ['error', 'never'],          // require or disallow trailing commas
      'comma-spacing': ['error', { 'before': false, 'after': true }], // enforce consistent spacing before and after commas
      'comma-style': ['error', 'last'],            // enforce consistent comma style
      'computed-property-spacing': 'error',        // enforce consistent spacing inside computed property brackets
      'consistent-this': ['error', 'outer'],       // enforce consistent naming when capturing the current execution context
      'eol-last': 'error',                         // require or disallow newline at the end of files
      'func-call-spacing': ['error', 'never'],     // require or disallow spacing between function identifiers and their invocations
      'func-name-matching': 'error',               // require function names to match the name of the variable or property to which they are assigned
      'func-names': 'error',                       // require or disallow named function expressions
      'func-style': 'error',                       // enforce the consistent use of either function declarations or expressions
      'function-paren-newline': ['error', 'multiline'], // enforce consistent line breaks inside function parentheses
      'id-blacklist': 'error',                     // disallow specified identifiers
      'id-length': ['error', { 'min': 3, 'exceptions': ['id'] }],        // enforce minimum and maximum identifier lengths
      'id-match': 'error',                         // require identifiers to match a specified regular expression
      'implicit-arrow-linebreak': 'error',         // enforce the location of arrow function bodies
      // 'indent': ['error', 3],                   // enforce consistent indentation
      'indent': ['error', 3, { 'SwitchCase': 1 }],
      'jsx-quotes': ['error', 'prefer-double'],    // enforce the consistent use of either double or single quotes in JSX attributes
      // enforce consistent spacing between keys and values in object literal properties
      'key-spacing': ['error', { 'beforeColon': false, 'afterColon': true, 'mode': 'strict' }],
      'keyword-spacing': ['error', { 'before': true, 'after': true }], // enforce consistent spacing before and after keywords
      'line-comment-position': 'error',            // enforce position of line comments
      'linebreak-style': 'error',                  // enforce consistent linebreak style
      'lines-around-comment': 'error',             // require empty lines around comments
      'lines-between-class-members': 'error',      // require or disallow an empty line between class members
      'max-depth': ['error', 4],                   // enforce a maximum depth that blocks can be nested
      'max-len': ['error', { 'code': 150, 'tabWidth': 3, 'ignoreUrls': true }], // enforce a maximum line length
      'max-lines': ['error', 500],                 // enforce a maximum number of lines per file
      // enforce a maximum number of line of code in a function
      'max-lines-per-function': ['error', { 'max': 100, 'skipBlankLines': true, 'skipComments': true }],
      'max-nested-callbacks': ['error', 10],       // enforce a maximum depth that callbacks can be nested
      'max-params': ['error', 8],                  // enforce a maximum number of parameters in function definitions
      'max-statements': ['error', { 'max': 60 }],  // enforce a maximum number of statements allowed in function blocks
      'max-statements-per-line': ['error', { 'max': 1 }], // enforce a maximum number of statements allowed per line
      'multiline-comment-style': ['error', 'separate-lines'], // enforce a particular style for multiline comments
      'multiline-ternary': 'error',                // enforce newlines between operands of ternary expressions
      'new-cap': ['error', { 'newIsCap': true }],  // require constructor names to begin with a capital letter
      'new-parens': 'error',                       // require parentheses when invoking a constructor with no arguments
      'newline-per-chained-call': 'error',         // require a newline after each call in a method chain
      'no-array-constructor': 'error',             // disallow Array constructors
      'no-bitwise': 'error',                       // disallow bitwise operators
      'no-continue': 'error',                      // disallow continue statements
      'no-dupe-keys': 'error',                     // disallows duplicate keys in object literals - CDP
      'no-inline-comments': 'error',               // disallow inline comments after code
      'no-lonely-if': 'error',                     // disallow if statements as the only statement in else blocks
      'no-mixed-operators': 'error',               // disallow mixed binary operators
      'no-mixed-spaces-and-tabs': 'error',         // disallow mixed spaces and tabs for indentation
      'no-multi-assign': 'error',                  // disallow use of chained assignment expressions
      'no-multiple-empty-lines': ['error', { 'max': 2 }], // disallow multiple empty lines
      'no-negated-condition': 'error',             // disallow negated conditions
      'no-nested-ternary': 'error',                // disallow nested ternary expressions
      'no-new-object': 'error',                    // disallow Object constructors
      'no-plusplus': 'error',                      // disallow the unary operators ++ and - -
      'no-restricted-syntax': 'error',             // disallow specified syntax
      'no-tabs': 'error',                          // disallow all tabs
      'no-ternary': 'error',                       // disallow ternary operators
      'no-trailing-spaces': 'error',               // disallow trailing whitespace at the end of lines
      'no-underscore-dangle': 'error',             // disallow dangling underscores in identifiers
      'no-unneeded-ternary': 'error',              // disallow ternary operators when simpler alternatives exist
      'no-whitespace-before-property': 'error',    // disallow whitespace before properties
      'nonblock-statement-body-position': ['error', 'beside'], // enforce the location of single-line statements
      'object-curly-newline': ['error', { 'multiline': true }], // enforce consistent line breaks inside braces
      'object-curly-spacing': ['error', 'always'], // enforce consistent spacing inside braces
      'object-property-newline': 'error',          // enforce placing object properties on separate lines
      'one-var': ['error', 'never'],               // enforce variables to be declared either together or separately in functions
      'one-var-declaration-per-line': ['error', 'always'], // require or disallow newlines around variable declarations
      'operator-assignment': 'error',              // require or disallow assignment operator shorthand where possible
      'operator-linebreak': ['error', 'after'],    // enforce consistent linebreak style for operators
      'padded-blocks': ['error', 'never'],         // require or disallow padding within blocks
      'padding-line-between-statements': 'error',  // require or disallow padding lines between statements
      // disallow using Object.assign with an object literal as the first argument and prefer the use of object spread instead.
      'prefer-object-spread': 'error',
      'quote-props': ['off', 'always'],            // require quotes around object literal property names
      'quotes': ['error', 'single'],               // enforce the consistent use of either backticks, double, or single quotes
      'semi': ['error', 'always'],                 // require or disallow semicolons instead of ASI
      'semi-spacing': ['error', { 'before': false, 'after': true }], // enforce consistent spacing before and after semicolons
      'semi-style': ['error', 'last'],             // enforce location of semicolons
      'sort-keys': 'error',                        // require object keys to be sorted
      'sort-vars': 'error',                        // require variables within the same declaration block to be sorted
      'space-before-blocks': 'error',              // enforce consistent spacing before blocks
      'space-before-function-paren': ['error', 'never'], // enforce consistent spacing before function definition opening parenthesis
      'space-in-parens': ['error', 'never'],       // enforce consistent spacing inside parentheses
      'space-infix-ops': 'error',                  // require spacing around infix operators
      'space-unary-ops': ['error', { 'words': true, 'nonwords': false }], // enforce consistent spacing before or after unary operators
      'spaced-comment': ['error', 'always'],       // enforce consistent spacing after the // 'or /* in a comment
      'switch-colon-spacing': ['error', { 'after': true, 'before': false }], // enforce spacing around colons of switch statements
      'template-tag-spacing': ['error', 'always'], // require or disallow spacing between template tags and their literals
      'unicode-bom': 'error',                      // require or disallow Unicode byte order mark (BOM)
      'wrap-regex': 'error',                       // require parenthesis around regex literals
      'arrow-body-style': ['error', 'always'],     // require braces around arrow function bodies
      'arrow-parens': ['error', 'always'],         // require parentheses around arrow function arguments
      'arrow-spacing': ['error', { 'before': true, 'after': true }], // enforce consistent spacing before and after the arrow in arrow functions
      'constructor-super': 'error',                // require super() calls in constructors
      // enforce consistent spacing around * operators in generator functions
      'generator-star-spacing': ['error', { 'before': false, 'after': true }],
      'no-class-assign': 'error',                  // disallow reassigning class members
      'no-confusing-arrow': ['error', { 'allowParens': true }], // disallow arrow functions where they could be confused with comparisons
      'no-const-assign': 'error',                  // disallow reassigning const variables
      'no-dupe-class-members': 'error',            // disallow duplicate class members
      'no-duplicate-imports': 'error',             // disallow duplicate module imports
      'no-new-symbol': 'error',                    // disallow new operators with the Symbol object
      'no-restricted-imports': 'error',            // disallow specified modules when loaded by import
      'no-this-before-super': 'error',             // disallow this/super before calling super() in constructors
      'no-useless-computed-key': 'error',          // disallow unnecessary computed property keys in object literals
      'no-useless-constructor': 'error',           // disallow unnecessary constructors
      'no-useless-rename': 'error',                // disallow renaming import, export, and destructured assignments to the same name
      'no-var': 'error',                           // require let or const instead of var
      'object-shorthand': ['error', 'never'],      // require or disallow method and property shorthand syntax for object literals
      'prefer-arrow-callback': 'error',            // require using arrow functions for callbacks
      'prefer-const': 'error',                     // require const declarations for variables that are never reassigned after declared
      'prefer-destructuring': 'error',             // require destructuring from arrays and/or objects
      'prefer-numeric-literals': 'error',          // disallow parseInt() and Number.parseInt() in favor of binary, octal, and hexadecimal literals
      'prefer-rest-params': 'error',               // require rest parameters instead of arguments
      'prefer-spread': 'error',                    // require spread operators instead of .apply()
      'prefer-template': 'error',                  // require template literals instead of string concatenation
      'require-yield': 'error',                    // require generator functions to contain yield
      'rest-spread-spacing': ['error', 'always'],  // enforce spacing between rest and spread operators and their expressions
      'sort-imports': 'error',                     // enforce sorted import declarations within modules
      'symbol-description': 'error',               // require symbol descriptions
      'template-curly-spacing': ['error', 'never'], // require or disallow spacing around embedded expressions of template strings
      'yield-star-spacing': 'error',                // require or disallow spacing around the * in yield* expressions */
      'function-call-argument-newline': ['error', 'consistent']
   },
   'overrides':
   [
      {
         'files': ['settings.js', 'settings.*.js'],
         'rules': { 'global-require': 'off' }
      },
      {
         'files': ['productDefinition.js'],
         'rules': { 'no-unused-vars': 'off' }
      },
      {
         'files': ['keycloak.js'],
         'rules': { 'no-lone-blocks': 'off', 'no-empty': 'off' }
      }
   ]
};
