/* global module */

// https://github.com/yannickcr/eslint-plugin-react#list-of-supported-rules

module.exports =
{
   'extends':
   [
      './eslintrc.overrides.js',
      'plugin:react/all'
   ],
   'plugins': ['react'],
   'parser': 'babel-eslint',
   'parserOptions':
   {
      'ecmaVersion': 2018,
      'sourceType': 'module',
      'jsx': true,
      'ecmaFeatures': {
         'ecmaVersion': 2018,
         'sourceType': 'module',
         'jsx': true
      }
   },
   'env':
   {
      'es6': true,
      'amd': true,
      'jquery': true,
      'browser': true
    },
   'rules':
   {
      'no-invalid-this': 'off',                                         // CLS -- why is this off ????
      'react/jsx-indent': 'off',                                        // CLS -- why is this off ????
      'react/jsx-indent-props': 'off',                                  // CLS -- why is this off ????
      'react/jsx-space-before-closing': 'off',                          // CLS -- why is this off ????
      'react/jsx-tag-spacing': ['off'],                                 // CLS -- why is this off ????
      // CLS -- why is function-component-definition off ????
      'react/function-component-definition': ['off', { 'namedComponents': 'arrow-function', 'unnamedComponents': 'arrow-function' }],
      'react/jsx-max-depth': 'off',                                     // CLS: what can we set this to?

      'react/require-optimization': ['off', { allowDecorators: [] }],   // CLS: do we want this on?
      'react/no-set-state': 'off',                                      // CLS: do we want this on?
      'react/jsx-no-literals': ['off', { noStrings: true }],            // CLS: do we want this on?

      'no-console': 'error',
      'no-debugger': 'error',
      'array-element-newline': ['error', 'consistent'],
      'no-duplicate-imports': 'off',
      'new-cap': ['error', { 'newIsCap': true, 'capIsNewExceptions': ['OKAction', 'CancelAction', 'DefaultAction', 'CtlAppHOC'] }],
      'no-extra-parens': 'off',
      'class-methods-use-this': ['error', {
         exceptMethods: [
            'render',
            'getInitialState',
            'getDefaultProps',
            'getChildContext',
            'componentWillMount',
            'UNSAFE_componentWillMount',
            'componentDidMount',
            'componentWillReceiveProps',
            'UNSAFE_componentWillReceiveProps',
            'shouldComponentUpdate',
            'componentWillUpdate',
            'UNSAFE_componentWillUpdate',
            'componentDidUpdate',
            'componentWillUnmount',
            'componentDidCatch',
            'getSnapshotBeforeUpdate'
         ]
      }],
      'react/jsx-first-prop-new-line': 'off',
      'react/jsx-max-props-per-line': ['error', { maximum: 1, when: 'multiline' }],
      'react/jsx-props-no-spreading': ['off'],
      'react/forbid-component-props': ['off', { forbid: [] }],
      'react/static-property-placement': ['error', 'property assignment'],
      'react/no-multi-comp': ['error', { 'ignoreStateless': true }],    // CDP: Is confused by creating JSX in callbacks, fixed in v7? Cory approved
      'react/sort-prop-types': 'off',                                   // CDP: Group related properties, eg width with height, see no-dupe-keys
      'react/jsx-sort-props': 'off',                                    // CDP: Raised when sort-prop-types is off
      'react/jsx-sort-default-props': 'off',                            // CDP: Raised when sort-prop-types is off
      'react/destructuring-assignment': 'off',                          // CDP: Cory approved style
      'react/jsx-no-bind':
      [
         'error',
         {
            ignoreRefs: true,
            allowArrowFunctions: true,
            allowFunctions: false,
            allowBind: false,
            ignoreDOMComponents: true
         }
      ],
      'react/jsx-wrap-multilines':
      [
         'error',
         {
            declaration: 'parens-new-line',
            assignment: 'parens-new-line',
            return: 'parens-new-line',
            arrow: 'parens-new-line',
            condition: 'parens-new-line',
            logical: 'parens-new-line',
            prop: 'parens-new-line'
         }
      ]
   }
};
