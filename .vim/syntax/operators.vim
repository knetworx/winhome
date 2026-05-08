" Vim syntax file
" Language:	Custom Operators
" Maintainer:	Nick Heilmann

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"----------------------------------------------------------------
syn match	custOpPlus			display "+"
syn match	custOpMinus			display "-"
syn match	custOpAsterisk		display "\*"
syn match	custOpMod			display "%"
syn match	custOpSlash			display "\(\([/*]\)\@<!/\([/*]\)\@!\)"
syn cluster	custOpMath			contains=custOpPlus,custOpMinus,custOpAsterisk,custOpMod,custOpSlash
"----------------------------------------------------------------
syn match	custOpSemi			display ";"
syn match	custOpColon			display ":"
syn match	custOpComma			display ","
syn match	custOpDot			display "\."
syn match	custOpQuestion		display "?"
syn cluster	custOpPunc			contains=custOpSemi,custOpColon,custOpComma,custOpDot,custOpQuestion
"----------------------------------------------------------------
syn match	custOpExclam		display "!"
syn match	custOpEqual			display "="
syn match	custOpLT			display "<"
syn match	custOpGT			display ">"
syn cluster	custOpComparators	contains=custOpExclam,custOpEqual,custOpLT,custOpGT
"----------------------------------------------------------------
syn match	custOpParenOpen		display "("
syn match	custOpParenClose	display ")"
syn cluster	custOpParen			contains=custParenOpen,custParenClose

syn match	custOpCurlyOpen		display "{"
syn match	custOpCurlyClose	display "}"
syn cluster	custOpCurly			contains=custCurlyOpen,custCurlyClose

syn match	custOpSquareOpen	display "\["
syn match	custOpSquareClose	display "\]"
syn cluster	custOpSquare		contains=custSquareOpen,custSquareClose

syn cluster	custOpBrackets		contains=custParen,custCurly,custSquare
"----------------------------------------------------------------
syn match	custOpTilde			display "\~"
syn match	custOpCaret			display "\^"
syn match	custOpPipe			display "[|]"
syn match	custOpAmp			display "&"
syn cluster	custOpBitwise		contains=custOpTilde,custOpCaret,custOpPipe,custOpAmp
"----------------------------------------------------------------

syn cluster	custOps				contains=custOpMath,custOpPunc,custOpComparators,custOpBrackets,custOpBitwise

" Default highlighting
if version >= 508 || !exists("did_custop_syntax_inits")
  if version < 508
    let did_custop_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink custOperator		Operator
  delcommand HiLink
endif

let b:current_syntax = "custOp"

" vim: ts=4
