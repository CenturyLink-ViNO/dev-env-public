<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE stylesheet [
<!ENTITY cr "<xsl:text>
</xsl:text>">
<!ENTITY sp "<xsl:text>      </xsl:text>">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <!--
      To search for all error types present:
         cat ant.log | grep "ESLint ERROR" | sed "s/.*(\(.*\))/\1/" | grep -v "Parsing error" | sort | uniq
   -->

   <xsl:strip-space elements="*"/>
   <!-- <xsl:strip-space elements="checkstyle"/> -->
   <!-- <xsl:preserve-space elements="file"/> -->
   <xsl:output method="text"/>
   <xsl:param name="projectName"/>
   <xsl:param name="precision"/>

   <xsl:template name="output">
      <xsl:param name='value'/>
      <xsl:param name='errorType'/>
      <xsl:if test="$value > 0">
         <xsl:if test="$precision = 'summary' or $precision = 'detail'">
            <xsl:value-of select="$projectName"/>, <xsl:value-of select="$errorType"/>, <xsl:value-of select="$value"/>&cr;
         </xsl:if>
         <xsl:if test="$precision = 'counts'">
            <xsl:value-of select="$projectName"/>.eslint.checkstyle.<xsl:value-of select="$errorType"/> = <xsl:value-of select="$value"/>&cr;
         </xsl:if>
      </xsl:if>
   </xsl:template>

   <xsl:template match="/checkstyle">

      <xsl:variable name="totalErrorCount">
         <xsl:number level="any" value="count(descendant::error[@severity='error'])"/>
      </xsl:variable>

      <xsl:variable name="totalWarningCount">
         <xsl:number level="any" value="count(descendant::error[@severity='warning'])"/>
      </xsl:variable>

      <xsl:variable name="totalIssueCount">
         <xsl:number value="$totalWarningCount + $totalErrorCount"/>
      </xsl:variable>

      <xsl:variable name="totalWarning_unusedVars"               select="count(//file/error[contains(@message, '(no-unused-vars)')])"/>
      <xsl:variable name="totalWarning_redeclare"                select="count(//file/error[contains(@message, '(no-redeclare)')])"/>
      <xsl:variable name="totalWarning_uselessEscape"            select="count(//file/error[contains(@message, '(no-useless-escape)')])"/>
      <xsl:variable name="totalWarning_validTypeOf"              select="count(//file/error[contains(@message, '(valid-typeof)')])"/>
      <xsl:variable name="totalWarning_notDefined"               select="count(//file/error[contains(@message, '(no-undef)')])"/>
      <xsl:variable name="totalWarning_extraSemicolon"           select="count(//file/error[contains(@message, '(no-extra-semi)')])"/>
      <xsl:variable name="totalWarning_missingSemicolon"         select="count(//file/error[contains(@message, '(semi)')])"/>
      <xsl:variable name="totalWarning_singleQuote"              select="count(//file/error[contains(@message, '(quotes)')])"/>
      <xsl:variable name="totalWarning_caseDeclarations"         select="count(//file/error[contains(@message, '(no-case-declarations)')])"/>
      <xsl:variable name="totalWarning_dupeKeys"                 select="count(//file/error[contains(@message, '(no-dupe-keys)')])"/>
      <xsl:variable name="totalWarning_fallthrough"              select="count(//file/error[contains(@message, '(no-fallthrough)')])"/>
      <xsl:variable name="totalWarning_unreachable"              select="count(//file/error[contains(@message, '(no-unreachable)')])"/>
      <xsl:variable name="totalWarning_noEmpty"                  select="count(//file/error[contains(@message, '(no-empty)')])"/>
      <xsl:variable name="totalWarning_unexpectedToken"          select="count(//file/error[contains(@message, 'Unexpected token')])"/>
      <xsl:variable name="totalWarning_alreadyDeclared"          select="count(//file/error[contains(@message, 'has already been declared')])"/>
      <xsl:variable name="totalWarning_returnOutsideFunction"    select="count(//file/error[contains(@message, 'outside of function')])"/>
      <xsl:variable name="totalWarning_noVar"                    select="count(//file/error[contains(@message, '(no-var)')])"/>
      <xsl:variable name="totalWarning_varsOnTop"                select="count(//file/error[contains(@message, 'vars-on-top')])"/>
      <xsl:variable name="totalWarning_noExtraParens"            select="count(//file/error[contains(@message, 'no-extra-parens')])"/>
      <xsl:variable name="totalWarning_spaceUnaryOps"            select="count(//file/error[contains(@message, 'space-unary-ops')])"/>
      <xsl:variable name="totalWarning_maxDepth"                 select="count(//file/error[contains(@message, 'max-depth')])"/>
      <xsl:variable name="totalWarning_spacedComment"            select="count(//file/error[contains(@message, 'spaced-comment')])"/>
      <xsl:variable name="totalWarning_idLength"                 select="count(//file/error[contains(@message, 'id-length')])"/>
      <xsl:variable name="totalWarning_underscoreDangle"         select="count(//file/error[contains(@message, 'no-underscore-dangle')])"/>
      <xsl:variable name="totalWarning_quoteProps"               select="count(//file/error[contains(@message, 'quote-props')])"/>

      <xsl:variable name="totalWarning_complexity"               select="count(//file/error[contains(@message, '(complexity)')])"/>
      <xsl:variable name="totalWarning_useBeforeDefine"          select="count(//file/error[contains(@message, '(no-use-before-define)')])"/>
      <xsl:variable name="totalWarning_prototypeBuiltins"        select="count(//file/error[contains(@message, '(no-prototype-builtins)')])"/>
      <xsl:variable name="totalWarning_no-plusplus"              select="count(//file/error[contains(@message, '(no-plusplus)')])"/>
      <xsl:variable name="totalWarning_prefer-const"             select="count(//file/error[contains(@message, '(prefer-const)')])"/>
      <xsl:variable name="totalWarning_function-call-argument-newline"     select="count(//file/error[contains(@message, '(function-call-argument-newline)')])"/>

      <xsl:variable name="totalWarning_globalRequire"            select="count(//file/error[contains(@message, '(global-require)')])"/>
      <xsl:variable name="totalWarning_noBitwise"                select="count(//file/error[contains(@message, '(no-bitwise)')])"/>
      <xsl:variable name="totalWarning_indent"                   select="count(//file/error[contains(@message, '(indent)')])"/>
      <xsl:variable name="totalWarning_arrayElementNewline"      select="count(//file/error[contains(@message, '(array-element-newline)')])"/>
      <xsl:variable name="totalWarning_maxLinesPerFunction"      select="count(//file/error[contains(@message, '(max-lines-per-function)')])"/>
      <xsl:variable name="totalWarning_guardForIn"               select="count(//file/error[contains(@message, '(guard-for-in)')])"/>
      <xsl:variable name="totalWarning_noShadow"                 select="count(//file/error[contains(@message, '(no-shadow)')])"/>
      <xsl:variable name="totalWarning_braceStyle"               select="count(//file/error[contains(@message, '(brace-style)')])"/>
      <xsl:variable name="totalWarning_noUselessConcat"          select="count(//file/error[contains(@message, '(no-useless-concat)')])"/>
      <xsl:variable name="totalWarning_blockScopedVar"           select="count(//file/error[contains(@message, '(block-scoped-var)')])"/>
      <xsl:variable name="totalWarning_newCap"                   select="count(//file/error[contains(@message, '(new-cap)')])"/>
      <xsl:variable name="totalWarning_functionParenNewline"     select="count(//file/error[contains(@message, '(function-paren-newline)')])"/>
      <xsl:variable name="totalWarning_noUndefined"              select="count(//file/error[contains(@message, '(no-undefined)')])"/>
      <xsl:variable name="totalWarning_noParamReassign"          select="count(//file/error[contains(@message, '(no-param-reassign)')])"/>
      <xsl:variable name="totalWarning_commaDangle"              select="count(//file/error[contains(@message, '(comma-dangle)')])"/>
      <xsl:variable name="totalWarning_maxStatements"            select="count(//file/error[contains(@message, '(max-statements)')])"/>
      <xsl:variable name="totalWarning_negatedCondition"         select="count(//file/error[contains(@message, '(no-negated-condition)')])"/>
      <xsl:variable name="totalWarning_noConstAssign"            select="count(//file/error[contains(@message, '(no-const-assign)')])"/>
      <xsl:variable name="totalWarning_objectCurlySpacing"       select="count(//file/error[contains(@message, '(object-curly-spacing)')])"/>
      <xsl:variable name="totalWarning_noInvalidThis"            select="count(//file/error[contains(@message, '(no-invalid-this)')])"/>
      <xsl:variable name="totalWarning_paddedBlocks"             select="count(//file/error[contains(@message, '(padded-blocks)')])"/>
      <xsl:variable name="totalWarning_oneVar"                   select="count(//file/error[contains(@message, '(one-var)')])"/>
      <xsl:variable name="totalWarning_noUnneededTernary"        select="count(//file/error[contains(@message, '(no-unneeded-ternary)')])"/>
      <xsl:variable name="totalWarning_noExtendNative"           select="count(//file/error[contains(@message, '(no-extend-native)')])"/>
      <xsl:variable name="totalWarning_noElseReturn"             select="count(//file/error[contains(@message, '(no-else-return)')])"/>
      <xsl:variable name="totalWarning_noUselessCall"            select="count(//file/error[contains(@message, '(no-useless-call)')])"/>
      <xsl:variable name="totalWarning_objectCurlyNewline"       select="count(//file/error[contains(@message, '(object-curly-newline)')])"/>
      <xsl:variable name="totalWarning_noEval"                   select="count(//file/error[contains(@message, '(no-eval)')])"/>
      <xsl:variable name="totalWarning_noEmptyFunction"          select="count(//file/error[contains(@message, '(no-empty-function)')])"/>
      <xsl:variable name="totalWarning_camelcase"                select="count(//file/error[contains(@message, '(camelcase)')])"/>
      <xsl:variable name="totalWarning_oneVarDeclarationPerLine" select="count(//file/error[contains(@message, '(one-var-declaration-per-line)')])"/>
      <xsl:variable name="totalWarning_strict"                   select="count(//file/error[contains(@message, '(strict)')])"/>
      <xsl:variable name="totalWarning_noUselessReturn"          select="count(//file/error[contains(@message, '(no-useless-return)')])"/>
      <xsl:variable name="totalWarning_noImplicitGlobals"        select="count(//file/error[contains(@message, '(no-implicit-globals)')])"/>
      <xsl:variable name="totalWarning_noNewFunc"                select="count(//file/error[contains(@message, '(no-new-func)')])"/>
      <xsl:variable name="totalWarning_preferRestParams"         select="count(//file/error[contains(@message, '(prefer-rest-params)')])"/>
      <xsl:variable name="totalWarning_noConsole"                select="count(//file/error[contains(@message, '(no-console)')])"/>
      <xsl:variable name="totalWarning_consistentThis"           select="count(//file/error[contains(@message, '(consistent-this)')])"/>
      <xsl:variable name="totalWarning_noAlert"                  select="count(//file/error[contains(@message, '(no-alert)')])"/>
      <xsl:variable name="totalWarning_noTrailingSpaces"         select="count(//file/error[contains(@message, '(no-trailing-spaces)')])"/>
      <xsl:variable name="totalWarning_multilineCommentStyle"    select="count(//file/error[contains(@message, '(multiline-comment-style)')])"/>
      <xsl:variable name="totalWarning_maxStatementsPerLine"     select="count(//file/error[contains(@message, '(max-statements-per-line)')])"/>
      <xsl:variable name="totalWarning_dotLocation"              select="count(//file/error[contains(@message, '(dot-location)')])"/>
      <xsl:variable name="totalWarning_keySpacing"               select="count(//file/error[contains(@message, '(key-spacing)')])"/>
      <xsl:variable name="totalWarning_noImplicitCoercion"       select="count(//file/error[contains(@message, '(no-implicit-coercion)')])"/>
      <xsl:variable name="totalWarning_maxLines"                 select="count(//file/error[contains(@message, '(max-lines)')])"/>
      <xsl:variable name="totalWarning_spaceBeforeFctParen"      select="count(//file/error[contains(@message, '(space-before-function-paren)')])"/>
      <xsl:variable name="totalWarning_requireAwait"             select="count(//file/error[contains(@message, '(require-await)')])"/>
      <xsl:variable name="totalWarning_maxLen"                   select="count(//file/error[contains(@message, '(max-len)')])"/>
      <xsl:variable name="totalWarning_defaultCase"              select="count(//file/error[contains(@message, '(default-case)')])"/>
      <xsl:variable name="totalWarning_arrayBracketSpacing"      select="count(//file/error[contains(@message, '(array-bracket-spacing)')])"/>
      <xsl:variable name="totalWarning_noUnusedExpressions"      select="count(//file/error[contains(@message, '(no-unused-expressions)')])"/>
      <xsl:variable name="totalWarning_noThrowLiteral"           select="count(//file/error[contains(@message, '(no-throw-literal)')])"/>
      <xsl:variable name="totalWarning_keywordSpacing"           select="count(//file/error[contains(@message, '(keyword-spacing)')])"/>
      <xsl:variable name="totalWarning_eqeqeq"                   select="count(//file/error[contains(@message, '(eqeqeq)')])"/>
      <xsl:variable name="totalWarning_noContinue"               select="count(//file/error[contains(@message, '(no-continue)')])"/>
      <xsl:variable name="totalWarning_noAwaitInLoop"            select="count(//file/error[contains(@message, '(no-await-in-loop)')])"/>
      <xsl:variable name="totalWarning_newParens"                select="count(//file/error[contains(@message, '(new-parens)')])"/>
      <xsl:variable name="totalWarning_spaceBeforeBlocks"        select="count(//file/error[contains(@message, '(space-before-blocks)')])"/>
      <xsl:variable name="totalWarning_spaceInfixOps"            select="count(//file/error[contains(@message, '(space-infix-ops)')])"/>
      <xsl:variable name="totalWarning_noMultipleEmptyLines"     select="count(//file/error[contains(@message, '(no-multiple-empty-lines)')])"/>
      <xsl:variable name="totalWarning_noLoopFunc"               select="count(//file/error[contains(@message, '(no-loop-func)')])"/>
      <xsl:variable name="totalWarning_noLoneBlocks"             select="count(//file/error[contains(@message, '(no-lone-blocks)')])"/>
      <xsl:variable name="totalWarning_commaSpacing"             select="count(//file/error[contains(@message, '(comma-spacing)')])"/>
      <xsl:variable name="totalWarning_noTabs"                   select="count(//file/error[contains(@message, '(no-tabs)')])"/>
      <xsl:variable name="totalWarning_noUselessCatch"           select="count(//file/error[contains(@message, '(no-useless-catch)')])"/>
      <xsl:variable name="totalWarning_curly"                    select="count(//file/error[contains(@message, '(curly)')])"/>
      <xsl:variable name="totalWarning_noReturnAwait"            select="count(//file/error[contains(@message, '(no-return-await)')])"/>
      <xsl:variable name="totalWarning_spaceInParens"            select="count(//file/error[contains(@message, '(space-in-parens)')])"/>
      <xsl:variable name="totalWarning_preferPromiseRejectErr"   select="count(//file/error[contains(@message, '(prefer-promise-reject-errors)')])"/>
      <xsl:variable name="totalWarning_classMethodsUseThis"      select="count(//file/error[contains(@message, '(class-methods-use-this)')])"/>
      <xsl:variable name="totalWarning_callbackReturn"           select="count(//file/error[contains(@message, '(callback-return)')])"/>
      <xsl:variable name="totalWarning_noSparseArrays"           select="count(//file/error[contains(@message, '(no-sparse-arrays)')])"/>
      <xsl:variable name="totalWarning_commaStyle"               select="count(//file/error[contains(@message, '(comma-style)')])"/>
      <xsl:variable name="totalWarning_requireAtomicUpdates"     select="count(//file/error[contains(@message, '(require-atomic-updates)')])"/>
      <xsl:variable name="totalWarning_objectShorthand"          select="count(//file/error[contains(@message, '(object-shorthand)')])"/>
      <xsl:variable name="totalWarning_noDuplicateImports"       select="count(//file/error[contains(@message, '(no-duplicate-imports)')])"/>
      <xsl:variable name="totalWarning_noPathConcat"             select="count(//file/error[contains(@message, '(no-path-concat)')])"/>
      <xsl:variable name="totalWarning_noEqNull"                 select="count(//file/error[contains(@message, '(no-eq-null)')])"/>
      <xsl:variable name="totalWarning_arrowBodyStyle"           select="count(//file/error[contains(@message, '(arrow-body-style)')])"/>
      <xsl:variable name="totalWarning_arrowParens"              select="count(//file/error[contains(@message, '(arrow-parens)')])"/>
      <xsl:variable name="totalWarning_typescript_noVarRequires" select="count(//file/error[contains(@message, '(@typescript-eslint/no-var-requires)')])"/>
      <xsl:variable name="totalWarning_typescript_noInferrable"  select="count(//file/error[contains(@message, '(@typescript-eslint/no-inferrable-types)')])"/>
      <xsl:variable name="totalWarning_typescript_explictAccess" select="count(//file/error[contains(@message, '(@typescript-eslint/explicit-member-accessibility)')])"/>
      <xsl:variable name="totalWarning_typescript_camelcase"     select="count(//file/error[contains(@message, '(@typescript-eslint/camelcase)')])"/>
      <xsl:variable name="totalWarning_typescript_indent"        select="count(//file/error[contains(@message, '(@typescript-eslint/indent)')])"/>
      <xsl:variable name="totalWarning_typescript_noUnusedVars"  select="count(//file/error[contains(@message, '(@typescript-eslint/no-unused-vars')])"/>
      <xsl:variable name="totalWarning_typescript_noExplicitAny" select="count(//file/error[contains(@message, '(@typescript-eslint/no-explicit-any')])"/>
      <xsl:variable name="totalWarning_typescript_explicitFunct" select="count(//file/error[contains(@message, '(@typescript-eslint/explicit-function-return-type')])"/>
      <xsl:variable name="totalWarning_typescript_banTypes"      select="count(//file/error[contains(@message, '(@typescript-eslint/ban-types')])"/>
      <xsl:variable name="totalWarning_typescript_annotationSpc" select="count(//file/error[contains(@message, '(@typescript-eslint/type-annotation-spacing')])"/>

      <xsl:variable name="totalWarning_spaced-comment"    select="count(//file/error[contains(@message, '(spaced-comment)')])"/>
      <xsl:variable name="totalWarning_vars-on-top"    select="count(//file/error[contains(@message, '(vars-on-top)')])"/>
      <xsl:variable name="totalWarning_id-length"    select="count(//file/error[contains(@message, '(id-length)')])"/>
      <xsl:variable name="totalWarning_prefer-named-capture-group"    select="count(//file/error[contains(@message, '(prefer-named-capture-group)')])"/>

      <xsl:variable name="totalWarning_dot-notation"    select="count(//file/error[contains(@message, '(dot-notation)')])"/>

      <xsl:variable name="totalWarning_no-underscore-dangle"    select="count(//file/error[contains(@message, '(no-underscore-dangle)')])"/>
      <xsl:variable name="totalWarning_default-param-last"    select="count(//file/error[contains(@message, '(default-param-last)')])"/>

      <xsl:variable name="totalWarning_"                         select="count(//file/error[contains(@message, '')])"/>

      <xsl:variable name="knownIssues"
                    select="$totalWarning_unusedVars +
                            $totalWarning_redeclare +
                            $totalWarning_unreachable +
                            $totalWarning_uselessEscape +
                            $totalWarning_fallthrough +
                            $totalWarning_dupeKeys +
                            $totalWarning_caseDeclarations +
                            $totalWarning_singleQuote +
                            $totalWarning_missingSemicolon +
                            $totalWarning_extraSemicolon +
                            $totalWarning_notDefined +
                            $totalWarning_unexpectedToken +
                            $totalWarning_noEmpty +
                            $totalWarning_alreadyDeclared +
                            $totalWarning_returnOutsideFunction +
                            $totalWarning_validTypeOf +
                            $totalWarning_varsOnTop +
                            $totalWarning_noVar +
                            $totalWarning_noExtraParens +
                            $totalWarning_spaceUnaryOps +
                            $totalWarning_maxDepth +
                            $totalWarning_spacedComment +
                            $totalWarning_idLength +
                            $totalWarning_underscoreDangle +
                            $totalWarning_quoteProps +
                            $totalWarning_complexity +
                            $totalWarning_useBeforeDefine +
                            $totalWarning_prototypeBuiltins +
                            $totalWarning_no-plusplus +
                            $totalWarning_prefer-const +
                            $totalWarning_globalRequire +
                            $totalWarning_noBitwise +
                            $totalWarning_indent +
                            $totalWarning_arrayElementNewline +
                            $totalWarning_maxLinesPerFunction +
                            $totalWarning_guardForIn +
                            $totalWarning_noShadow +
                            $totalWarning_braceStyle +
                            $totalWarning_noUselessConcat +
                            $totalWarning_blockScopedVar +
                            $totalWarning_newCap +
                            $totalWarning_functionParenNewline +
                            $totalWarning_commaDangle +
                            $totalWarning_noUndefined +
                            $totalWarning_noParamReassign +
                            $totalWarning_maxStatements +
                            $totalWarning_negatedCondition +
                            $totalWarning_noConstAssign +
                            $totalWarning_objectCurlySpacing +
                            $totalWarning_noInvalidThis +
                            $totalWarning_paddedBlocks +
                            $totalWarning_oneVar +
                            $totalWarning_noUnneededTernary +
                            $totalWarning_noExtendNative +
                            $totalWarning_noElseReturn +
                            $totalWarning_noUselessCall +
                            $totalWarning_objectCurlyNewline +
                            $totalWarning_noEval +
                            $totalWarning_noEmptyFunction +
                            $totalWarning_camelcase +
                            $totalWarning_oneVarDeclarationPerLine +
                            $totalWarning_strict +
                            $totalWarning_noUselessReturn +
                            $totalWarning_noImplicitGlobals +
                            $totalWarning_noNewFunc +
                            $totalWarning_preferRestParams +
                            $totalWarning_noConsole +
                            $totalWarning_consistentThis +
                            $totalWarning_noAlert +
                            $totalWarning_noTrailingSpaces +
                            $totalWarning_multilineCommentStyle +
                            $totalWarning_maxStatementsPerLine +
                            $totalWarning_dotLocation +
                            $totalWarning_keySpacing +
                            $totalWarning_noImplicitCoercion +
                            $totalWarning_maxLines +
                            $totalWarning_spaceBeforeFctParen +
                            $totalWarning_requireAwait +
                            $totalWarning_maxLen +
                            $totalWarning_defaultCase +
                            $totalWarning_arrayBracketSpacing +
                            $totalWarning_noUnusedExpressions +
                            $totalWarning_noThrowLiteral +
                            $totalWarning_keywordSpacing +
                            $totalWarning_eqeqeq +
                            $totalWarning_noContinue +
                            $totalWarning_noAwaitInLoop +
                            $totalWarning_newParens +
                            $totalWarning_spaceBeforeBlocks +
                            $totalWarning_spaceInfixOps +
                            $totalWarning_noMultipleEmptyLines +
                            $totalWarning_noLoopFunc +
                            $totalWarning_commaSpacing +
                            $totalWarning_noTabs +
                            $totalWarning_noUselessCatch +
                            $totalWarning_curly +
                            $totalWarning_noReturnAwait +
                            $totalWarning_spaceInParens +
                            $totalWarning_preferPromiseRejectErr +
                            $totalWarning_classMethodsUseThis +
                            $totalWarning_callbackReturn +
                            $totalWarning_noSparseArrays +
                            $totalWarning_commaStyle +
                            $totalWarning_requireAtomicUpdates +
                            $totalWarning_objectShorthand +
                            $totalWarning_noDuplicateImports +
                            $totalWarning_noPathConcat +
                            $totalWarning_noEqNull +
                            $totalWarning_arrowBodyStyle +
                            $totalWarning_arrowParens +
                            $totalWarning_typescript_noVarRequires +
                            $totalWarning_typescript_noInferrable +
                            $totalWarning_typescript_explictAccess +
                            $totalWarning_typescript_camelcase +
                            $totalWarning_typescript_indent +
                            $totalWarning_typescript_noUnusedVars +
                            $totalWarning_typescript_noExplicitAny +
                            $totalWarning_typescript_explicitFunct +
                            $totalWarning_typescript_banTypes +
                            $totalWarning_spaced-comment +
                            $totalWarning_vars-on-top +
                            $totalWarning_id-length +
                            $totalWarning_prefer-named-capture-group +
                            $totalWarning_dot-notation +
                            $totalWarning_function-call-argument-newline +
                            $totalWarning_no-underscore-dangle +
                            $totalWarning_default-param-last +
                            $totalWarning_typescript_annotationSpc"/>

      <xsl:if test="$precision = 'terse'">

         <xsl:if test="$totalErrorCount > 0 or $totalWarningCount > 0"> &cr; </xsl:if>
         <xsl:if test="$totalErrorCount > 0">
            <xsl:value-of select="$projectName"/> has<xsl:text>&#09;</xsl:text><xsl:value-of select="$totalErrorCount"/><xsl:text>&#09;</xsl:text>ESLint Errors
         </xsl:if>
         <xsl:if test="$totalErrorCount > 0 and $totalWarningCount > 0"> &cr; </xsl:if>
         <xsl:if test="$totalWarningCount > 0">
            <xsl:value-of select="$projectName"/> has<xsl:text>&#09;</xsl:text><xsl:value-of select="$totalWarningCount"/><xsl:text>&#09;</xsl:text>ESLint Warnings
         </xsl:if>
      </xsl:if>

      <xsl:if test="$precision = 'summary'">
         <xsl:apply-templates select="file" mode="warning"/>
         <xsl:apply-templates select="file" mode="error"/>
      </xsl:if>

      <xsl:if test="$precision = 'summary' or $precision = 'detail' or $precision = 'counts'">
         <xsl:if test="$totalErrorCount > 0 or $totalWarningCount > 0"> &cr; &cr; </xsl:if>
         <xsl:if test="$precision = 'summary'">
            <xsl:if test="$totalErrorCount > 0 or $totalWarningCount > 0">ESLint issue Detail for <xsl:value-of select="$projectName"/>:&cr;</xsl:if>
            <xsl:if test="$totalErrorCount > 0">
               <xsl:value-of select="$totalErrorCount"/> &sp;ESLint ERROR(S) &cr;
            </xsl:if>
            <xsl:if test="$totalWarningCount > 0">
               <xsl:value-of select="$totalWarningCount"/> &sp;ESLint WARNING(S) &cr;
            </xsl:if>
         </xsl:if>
         &cr;
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_unusedVars"/>
            <xsl:with-param name='errorType' select="'unusedVars'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_redeclare"/>
            <xsl:with-param name='errorType' select="'redeclare'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_uselessEscape"/>
            <xsl:with-param name='errorType' select="'uselessEscape'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_unreachable"/>
            <xsl:with-param name='errorType' select="'unreachable'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_fallthrough"/>
            <xsl:with-param name='errorType' select="'fallthrough'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_dupeKeys"/>
            <xsl:with-param name='errorType' select="'dupeKeys'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_caseDeclarations"/>
            <xsl:with-param name='errorType' select="'caseDeclarations'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_singleQuote"/>
            <xsl:with-param name='errorType' select="'singleQuote'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_missingSemicolon"/>
            <xsl:with-param name='errorType' select="'missingSemicolon'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_extraSemicolon"/>
            <xsl:with-param name='errorType' select="'extraSemicolon'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_notDefined"/>
            <xsl:with-param name='errorType' select="'notDefined'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noEmpty"/>
            <xsl:with-param name='errorType' select="'noEmpty'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_unexpectedToken"/>
            <xsl:with-param name='errorType' select="'unexpectedToken'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_alreadyDeclared"/>
            <xsl:with-param name='errorType' select="'alreadyDeclared'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_returnOutsideFunction"/>
            <xsl:with-param name='errorType' select="'returnOutsideFunction'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_varsOnTop"/>
            <xsl:with-param name='errorType' select="'varsOnTop'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noVar"/>
            <xsl:with-param name='errorType' select="'noVar'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noExtraParens"/>
            <xsl:with-param name='errorType' select="'noExtraParens'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_spaceUnaryOps"/>
            <xsl:with-param name='errorType' select="'spaceUnaryOps'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_maxDepth"/>
            <xsl:with-param name='errorType' select="'maxDepth'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_spacedComment"/>
            <xsl:with-param name='errorType' select="'spacedComment'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_idLength"/>
            <xsl:with-param name='errorType' select="'idLength'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_underscoreDangle"/>
            <xsl:with-param name='errorType' select="'underscoreDangle'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_quoteProps"/>
            <xsl:with-param name='errorType' select="'quoteProps'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_complexity"/>
            <xsl:with-param name='errorType' select="'complexity'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_useBeforeDefine"/>
            <xsl:with-param name='errorType' select="'useBeforeDefine'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_prototypeBuiltins"/>
            <xsl:with-param name='errorType' select="'prototypeBuiltins'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
             <xsl:with-param name='value'     select="$totalWarning_no-plusplus"/>
             <xsl:with-param name='errorType' select="'noPlusPlus'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_prefer-const"/>
            <xsl:with-param name='errorType' select="'preferConst'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_globalRequire"/>
            <xsl:with-param name='errorType' select="'globalRequire'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
             <xsl:with-param name='value'     select="$totalWarning_noBitwise"/>
             <xsl:with-param name='errorType' select="'noBitwise'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
             <xsl:with-param name='value'     select="$totalWarning_indent"/>
             <xsl:with-param name='errorType' select="'indent'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
             <xsl:with-param name='value'     select="$totalWarning_arrayElementNewline"/>
             <xsl:with-param name='errorType' select="'arrayElementNewline'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
             <xsl:with-param name='value'     select="$totalWarning_commaDangle"/>
             <xsl:with-param name='errorType' select="'commaDangle'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
             <xsl:with-param name='value'     select="$totalWarning_maxLinesPerFunction"/>
             <xsl:with-param name='errorType' select="'maxLinesPerFunction'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
             <xsl:with-param name='value'     select="$totalWarning_guardForIn"/>
             <xsl:with-param name='errorType' select="'guardForIn'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noShadow"/>
            <xsl:with-param name='errorType' select="'noShadow'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_braceStyle"/>
            <xsl:with-param name='errorType' select="'braceStyle'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noUselessConcat"/>
            <xsl:with-param name='errorType' select="'noUselessConcat'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_blockScopedVar"/>
            <xsl:with-param name='errorType' select="'blockScopedVar'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_newCap"/>
            <xsl:with-param name='errorType' select="'newCap'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_functionParenNewline"/>
            <xsl:with-param name='errorType' select="'functionParenNewline'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noUndefined"/>
            <xsl:with-param name='errorType' select="'noUndefined'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noParamReassign"/>
            <xsl:with-param name='errorType' select="'noParamReassign'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_maxStatements"/>
            <xsl:with-param name='errorType' select="'maxStatements'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_negatedCondition"/>
            <xsl:with-param name='errorType' select="'negatedCondition'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noConstAssign"/>
            <xsl:with-param name='errorType' select="'noConstAssign'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_objectCurlySpacing"/>
            <xsl:with-param name='errorType' select="'objectCurlySpacing'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noInvalidThis"/>
            <xsl:with-param name='errorType' select="'noInvalidThis'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_paddedBlocks"/>
            <xsl:with-param name='errorType' select="'paddedBlocks'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_oneVar"/>
            <xsl:with-param name='errorType' select="'oneVar'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noUnneededTernary"/>
            <xsl:with-param name='errorType' select="'noUnneededTernary'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noExtendNative"/>
            <xsl:with-param name='errorType' select="'noExtendNative'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noElseReturn"/>
            <xsl:with-param name='errorType' select="'noElseReturn'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noUselessCall"/>
            <xsl:with-param name='errorType' select="'noUselessCall'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_objectCurlyNewline"/>
            <xsl:with-param name='errorType' select="'objectCurlyNewline'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noEval"/>
            <xsl:with-param name='errorType' select="'noEval'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noEmptyFunction"/>
            <xsl:with-param name='errorType' select="'noEmptyFunction'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_camelcase"/>
            <xsl:with-param name='errorType' select="'camelcase'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_oneVarDeclarationPerLine"/>
            <xsl:with-param name='errorType' select="'oneVarDeclarationPerLine'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_strict"/>
            <xsl:with-param name='errorType' select="'strict'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noUselessReturn"/>
            <xsl:with-param name='errorType' select="'noUselessReturn'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noImplicitGlobals"/>
            <xsl:with-param name='errorType' select="'noImplicitGlobals'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noNewFunc"/>
            <xsl:with-param name='errorType' select="'noNewFunc'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_preferRestParams"/>
            <xsl:with-param name='errorType' select="'preferRestParams'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noConsole"/>
            <xsl:with-param name='errorType' select="'noConsole'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_consistentThis"/>
            <xsl:with-param name='errorType' select="'consistentThis'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noAlert"/>
            <xsl:with-param name='errorType' select="'noAlert'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noTrailingSpaces"/>
            <xsl:with-param name='errorType' select="'noTrailingSpaces'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_multilineCommentStyle"/>
            <xsl:with-param name='errorType' select="'multilineCommentStyle'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_maxStatementsPerLine"/>
            <xsl:with-param name='errorType' select="'maxStatementsPerLine'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_dotLocation"/>
            <xsl:with-param name='errorType' select="'dotLocation'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_keySpacing"/>
            <xsl:with-param name='errorType' select="'keySpacing'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noImplicitCoercion"/>
            <xsl:with-param name='errorType' select="'noImplicitCoercion'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_maxLines"/>
            <xsl:with-param name='errorType' select="'maxLines'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_spaceBeforeFctParen"/>
            <xsl:with-param name='errorType' select="'spaceBeforeFctParen'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_requireAwait"/>
            <xsl:with-param name='errorType' select="'requireAwait'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_maxLen"/>
            <xsl:with-param name='errorType' select="'maxLen'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_defaultCase"/>
            <xsl:with-param name='errorType' select="'defaultCase'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_arrayBracketSpacing"/>
            <xsl:with-param name='errorType' select="'arrayBracketSpacing'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noUnusedExpressions"/>
            <xsl:with-param name='errorType' select="'noUnusedExpressions'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noThrowLiteral"/>
            <xsl:with-param name='errorType' select="'noThrowLiteral'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_keywordSpacing"/>
            <xsl:with-param name='errorType' select="'keywordSpacing'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_eqeqeq"/>
            <xsl:with-param name='errorType' select="'eqeqeq'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noContinue"/>
            <xsl:with-param name='errorType' select="'noContinue'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noAwaitInLoop"/>
            <xsl:with-param name='errorType' select="'noAwaitInLoop'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_newParens"/>
            <xsl:with-param name='errorType' select="'newParens'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_spaceBeforeBlocks"/>
            <xsl:with-param name='errorType' select="'spaceBeforeBlocks'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_spaceInfixOps"/>
            <xsl:with-param name='errorType' select="'spaceInfixOps'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noMultipleEmptyLines"/>
            <xsl:with-param name='errorType' select="'noMultipleEmptyLines'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noLoopFunc"/>
            <xsl:with-param name='errorType' select="'noLoopFunc'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noLoneBlocks"/>
            <xsl:with-param name='errorType' select="'noLoneBlocks'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_commaSpacing"/>
            <xsl:with-param name='errorType' select="'commaSpacing'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noTabs"/>
            <xsl:with-param name='errorType' select="'noTabs'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noUselessCatch"/>
            <xsl:with-param name='errorType' select="'noUselessCatch'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_curly"/>
            <xsl:with-param name='errorType' select="'curly'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noReturnAwait"/>
            <xsl:with-param name='errorType' select="'noReturnAwait'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_spaceInParens"/>
            <xsl:with-param name='errorType' select="'spaceInParens'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_preferPromiseRejectErr"/>
            <xsl:with-param name='errorType' select="'preferPromiseRejectErr'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_classMethodsUseThis"/>
            <xsl:with-param name='errorType' select="'classMethodsUseThis'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_callbackReturn"/>
            <xsl:with-param name='errorType' select="'callbackReturn'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noSparseArrays"/>
            <xsl:with-param name='errorType' select="'noSparseArrays'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_commaStyle"/>
            <xsl:with-param name='errorType' select="'commaStyle'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_requireAtomicUpdates"/>
            <xsl:with-param name='errorType' select="'requireAtomicUpdates'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_objectShorthand"/>
            <xsl:with-param name='errorType' select="'objectShorthand'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noDuplicateImports"/>
            <xsl:with-param name='errorType' select="'noDuplicateImports'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noPathConcat"/>
            <xsl:with-param name='errorType' select="'noPathConcat'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_noEqNull"/>
            <xsl:with-param name='errorType' select="'noEqNull'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_arrowBodyStyle"/>
            <xsl:with-param name='errorType' select="'arrowBodyStyle'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_arrowParens"/>
            <xsl:with-param name='errorType' select="'arrowParens'"/>
         </xsl:call-template>
         <xsl:call-template name="output">^M
            <xsl:with-param name='value'     select="$totalWarning_function-call-argument-newline"/>^M
            <xsl:with-param name='errorType' select="'function-call-argument-newline'"/>^M
         </xsl:call-template>^M
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_noVarRequires"/>
            <xsl:with-param name='errorType' select="'typescript_noVarRequires'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_noInferrable"/>
            <xsl:with-param name='errorType' select="'typescript_noInferrable'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_explictAccess"/>
            <xsl:with-param name='errorType' select="'typescript_explictAccess'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_camelcase"/>
            <xsl:with-param name='errorType' select="'typescript_camelcase'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_indent"/>
            <xsl:with-param name='errorType' select="'typescript_indent'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_noUnusedVars"/>
            <xsl:with-param name='errorType' select="'typescript_noUnusedVars'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_noExplicitAny"/>
            <xsl:with-param name='errorType' select="'typescript_noExplicitAny'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_explicitFunct"/>
            <xsl:with-param name='errorType' select="'typescript_explicitFunct'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_banTypes"/>
            <xsl:with-param name='errorType' select="'typescript_banTypes'"/>
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalWarning_typescript_annotationSpc"/>
            <xsl:with-param name='errorType' select="'typescript_annotationSpc'"/>
         </xsl:call-template>
         <xsl:call-template name="output"> 
            <xsl:with-param name='value'     select="$totalWarning_spaced-comment"/> 
            <xsl:with-param name='errorType' select="'spaced-comment'"/> 
         </xsl:call-template>
         <xsl:call-template name="output"> 
            <xsl:with-param name='value'     select="$totalWarning_vars-on-top"/> 
            <xsl:with-param name='errorType' select="'vars-on-top'"/> 
         </xsl:call-template>
         <xsl:call-template name="output"> 
            <xsl:with-param name='value'     select="$totalWarning_id-length"/> 
            <xsl:with-param name='errorType' select="'id-length'"/> 
         </xsl:call-template>
         <xsl:call-template name="output"> 
            <xsl:with-param name='value'     select="$totalWarning_prefer-named-capture-group"/> 
            <xsl:with-param name='errorType' select="'prefer-named-capture-group'"/> 
         </xsl:call-template>
         <xsl:call-template name="output"> 
            <xsl:with-param name='value'     select="$totalWarning_dot-notation"/> 
            <xsl:with-param name='errorType' select="'dot-notation'"/> 
         </xsl:call-template>
         <xsl:call-template name="output"> 
            <xsl:with-param name='value'     select="$totalWarning_no-underscore-dangle"/> 
            <xsl:with-param name='errorType' select="'no-underscore-dangle'"/> 
         </xsl:call-template>
         <xsl:call-template name="output"> 
            <xsl:with-param name='value'     select="$totalWarning_default-param-last"/> 
            <xsl:with-param name='errorType' select="'default-param-last'"/> 
         </xsl:call-template>
         <xsl:call-template name="output">
            <xsl:with-param name='value'     select="$totalIssueCount - $knownIssues"/>
            <xsl:with-param name='errorType' select="'UNKNOWN_ERROR_TYPE'"/>
         </xsl:call-template>

      </xsl:if>
   </xsl:template>

   <xsl:template match="file" mode="error">
      <xsl:variable name="errorCount"> <xsl:value-of select="(count(error[@severity='error']))"/> </xsl:variable>
      <xsl:if test="$errorCount > 0">
         <xsl:apply-templates select="error[@severity='error']"/>
      </xsl:if>
   </xsl:template>

   <xsl:template match="file" mode="warning">
      <xsl:variable name="warnCount">  <xsl:value-of select="(count(error[@severity='warning']))"/> </xsl:variable>
      <xsl:if test="$warnCount > 0">
         <xsl:apply-templates select="error[@severity='warning']"/>
      </xsl:if>
   </xsl:template>

   <xsl:template match="error[@severity='error']">
      ESLint ERROR(S) <xsl:value-of select="../@name"/> : <xsl:value-of select="@line"/> : <xsl:value-of select="@column"/> : <xsl:value-of select="@message"/>
   </xsl:template>

   <xsl:template match="error[@severity='warning']">
      ESLint WARNING(S) <xsl:value-of select="../@name"/> : <xsl:value-of select="@line"/> : <xsl:value-of select="@column"/> : <xsl:value-of select="@message"/>
   </xsl:template>

</xsl:stylesheet>



