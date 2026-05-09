hi clear
set bg=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nick"

hi Comment					guifg=green4											ctermfg=darkred		ctermbg=black
hi Constant					guifg=purple							gui=none		ctermfg=darkmagenta	ctermbg=black
hi Character				guifg=red												ctermfg=red			ctermbg=black
if (&t_Co > 16)
	hi DiffAdd										guibg=#002200		gui=none							ctermbg=22
	hi DiffChange									guibg=#330033		gui=none							ctermbg=17
else
	hi DiffAdd										guibg=#002200		gui=none							ctermbg=darkgreen
	hi DiffChange									guibg=#330033		gui=none							ctermbg=darkmagenta
endif
hi DiffDelete				guifg=#333333		guibg=#171717		gui=none							ctermbg=darkgray
hi DiffText										guibg=#000077		gui=none							ctermbg=darkblue
"hi Directory				guifg=cyan												ctermfg=cyan		ctermbg=black
hi Error					guifg=white			guibg=red							ctermfg=white		ctermbg=red
hi Exception				guifg=orange											ctermfg=darkyellow
hi Folded					guifg=gray			guibg=#004400						ctermfg=white		ctermbg=darkgray
hi FoldColumn				guifg=darkgreen		guibg=#222222						ctermfg=darkgreen	ctermbg=darkgray
hi Function					guifg=#eb660e											ctermfg=gray		ctermbg=black
hi Identifier				guifg=#5555ff							gui=none		ctermfg=blue		ctermbg=black
hi Include					guifg=#999999											ctermfg=magenta		ctermbg=black
hi Label					guifg=yellow											ctermfg=cyan		ctermbg=black
"hi LineComment				guifg=#777777
hi LineNr					guifg=#555555
hi MatchParen				guifg=white			guibg=#000000						ctermfg=white		ctermbg=black
hi Normal					guifg=#doce7c		guibg=#1e1e1e						ctermfg=white		ctermbg=black			
hi Number					guifg=#86aa90											ctermfg=red			ctermbg=black
hi PreProc					guifg=#00ff00											ctermfg=green		ctermbg=black
hi Operator					guifg=#559fd1											ctermfg=green		ctermbg=black
hi Search						               guibg=#c0c000											ctermbg=yellow
hi SpecialComment			guifg=darkcyan											ctermfg=darkcyan
hi SpecialKey				guifg=#555555											ctermfg=darkgray
hi Statement				guifg=#3f8cbd							gui=bold		ctermfg=yellow		ctermbg=black
hi StatusLine				guifg=#ffff00		guibg=#0000ff		gui=none		ctermfg=yellow		ctermbg=blue
hi String					guifg=#c68860											ctermfg=magenta		ctermbg=black
hi Todo						guifg=#000080		guibg=#c0c000		gui=bold		ctermfg=red			ctermbg=yellow
hi Type						guifg=#3f8cbd							gui=bold		ctermfg=yellow		ctermbg=black
hi Unknown					guifg=black			guibg=yellow		gui=bold		ctermfg=black		ctermbg=yellow			cterm=bold
hi Visual										guibg=#004400											ctermbg=darkgreen

hi link Boolean			Statement
hi link Conditional		Statement
hi link Directory		Comment
hi link Float			Number
hi link LineComment		Comment
hi link Macro			Constant
hi link PreCondit		Statement
hi link Repeat			Statement
hi link Special			Comment
hi link SpecialChar		Constant
hi link StorageClass	Statement
hi link Structure		Statement

hi link vimFunction Function

" Actionscript
hi actionScriptObjects			guifg=yellow
hi actionScriptAs2				guifg=blue
hi actionScriptParen			guifg=green
hi link actionScriptLineComment	LineComment
"actionScriptCommentSkip xxx cleared
"actionScriptSpecial xxx links to Special
"actionScriptCommentString xxx cleared
"actionScriptComment2String xxx cleared
"actionScriptCharacter xxx links to Character
hi link actionScriptNumber		Number
"actionScriptComment xxx links to Comment
"actionScriptStringD xxx links to String
"actionScriptStringS xxx links to String
"actionScriptSpecialCharacter xxx links to actionScriptSpecial
"actionScriptConditional xxx links to Conditional
"actionScriptRepeat xxx links to Repeat
"actionScriptCase xxx links to Label
"actionScriptConstructor xxx links to Operator
"actionScriptObjects xxx guifg=yellow
"actionScriptStatement xxx links to Statement
"actionScriptFunction xxx links to Function
"actionScriptValue xxx links to Boolean
"actionScriptArray xxx links to Type
"actionScriptDate xxx links to Type
"actionScriptMath xxx links to Type
"actionScriptNumberObj xxx links to Type
"actionScriptObject xxx links to Function
"actionScriptString xxx links to Type
"actionScriptColor xxx links to Type
"actionScriptKey xxx links to Type
"actionScriptMouse xxx links to Type
"actionScriptSelection xxx links to Type
"actionScriptSound xxx links to Type
"actionScriptStage xxx links to Type
"actionScriptSystem xxx links to Type
"actionScriptTextFormat xxx links to Type
"actionScriptCommunication xxx links to Type
"actionScriptXMLSocket xxx links to Type
"actionScriptTextField xxx links to Type
"actionScriptMethods xxx links to Statement
"actionScriptBraces xxx links to Function
"actionScriptException xxx links to Exception
"actionScriptXML xxx links to Type
"actionScriptArrayConstant xxx links to Constant
"actionScriptStringConstant xxx links to Constant
"actionScriptEventConstant xxx links to Constan

" Diff files
hi diffAdded				guifg=green
hi diffFile					guifg=yellow2
hi diffLine					guifg=#555555
hi diffRemoved				guifg=red

" Completion Menu
hi Pmenu					guifg=#dddddd		guibg=#333333						ctermfg=white		ctermbg=darkgray		cterm=bold
hi PmenuSel					guifg=#dddddd		guibg=#000055						ctermfg=white		ctermbg=darkblue

" C Highlighting
hi link cBracket Operator
hi link cCppBracket Operator
hi link cCppParen Operator
hi link cCppString String
hi link cParen Operator
hi link cLabel Label
hi link cUserCont Operator
hi cComment2String		guifg=gray											ctermfg=gray
hi cCommentString		guifg=gray											ctermfg=gray
hi cErrInBracket		guifg=fg			guibg=bg			gui=none	ctermfg=fg		ctermbg=bg	cterm=none
hi cErrInParen			guifg=white			guibg=red			gui=bold	ctermfg=white	ctermbg=red	cterm=bold
"hi cType guifg=#3f8cbd gui=bold
" And some keywords I added...
hi link cMyKeywords Identifier
hi link cMyKeywords2 Normal
hi link cLibKeywords Directory

" C++ Highlighting (extends from C Highlighting)
hi cppAccess guifg=#3f8cbd gui=bold
hi link cppMinMax Operator
hi link cppExceptions Exception
" Again, syntax elements I created
hi link cppFunctions Function
hi link cppPreProcWords Include
hi link cppCustDefines Constant
hi link cppSectionHeader Comment
hi link cppCustKW Identifier
hi link cppCustDecl Identifier
hi link cppCustCast Identifier
hi link cppCustTemp Identifier
hi link cppCustFwdDecl Identifier
hi link cppCustTypeDef Identifier
hi link cppCustEnumName Identifier
hi link cppCustSRO Identifier
hi link cppAccess Label
hi cppPragmaRegion		guifg=black			guibg=gray			gui=bold		ctermfg=black	ctermbg=gray	cterm=bold
hi cppPRKeywords		guifg=blue			guibg=gray			gui=bold		ctermfg=blue	ctermbg=gray	cterm=bold
hi cppDEBUG									guibg=#333333
hi cppUEType guifg=yellow gui=bold

hi dosbatchPath			guifg=darkgreen											ctermfg=darkgreen

" Java Highlighting
hi link javaBraces Operator
hi link javaConditional Statement
hi link javaConstant Constant
hi link javaError2 Error
hi link javaExceptions Statement
hi link javaExternal String
hi link javaLabel Directory
hi link javaOpchars Operator
hi link javaOperator Statement
hi link javaOperatorC Operator
hi link javaParen Operator
hi link javaScopeDecl Statement
hi link javaSpecialChar Constant
hi link javaString String
hi link javaType Statement
hi link javaTypedef Directory
hi link javaNicksExceptions Constant
hi link javaClassType Constant
hi link javaCommentCharacter SpecialComment
hi link javaCommentSpecial SpecialComment
hi link javaCommentSpecial2 SpecialComment
hi link javaCommentString SpecialComment
hi javaBoolean             guifg=magenta                   	gui=bold			ctermfg=magenta						cterm=bold
hi javaDocComment          guifg=#228844                   	gui=none			ctermfg=darkgreen					cterm=bold
hi javaDocParam            guifg=cyan3											ctermfg=darkcyan
hi javaDocTags             guifg=cyan                      	gui=bold			ctermfg=cyan						cterm=bold
hi javaStorageClass        guifg=red3                      	gui=bold			ctermfg=darkred						cterm=bold

" JavaScript Highlighting
hi javaScriptFunction		guifg=yellow
hi javaScriptFunctions		guifg=darkgray

" QNA Highlighting (Custom filetype, see syntax/qna.vim)
hi qnaQuestion              guifg=white                     gui=bold			ctermfg=white                       cterm=bold
hi qnaStartNum              guifg=green                     gui=bold			ctermfg=green                       cterm=bold
hi qnaResponse              guifg=gray											ctermfg=gray
hi qnaMyName                guifg=red                       gui=bold			ctermfg=red                         cterm=bold

" VB Highlighting
hi link vbOperator Operator

" HTML Highlighting
hi cssStyle                 guifg=orange                                        ctermfg=black       ctermbg=yellow  cterm=bold
hi htmlEndTag               guifg=blue                      gui=bold            ctermfg=green                       cterm=bold
hi htmlScriptTag            guifg=blue                      gui=bold            ctermfg=blue
hi htmlTag                  guifg=blue                      gui=bold            ctermfg=green                       cterm=bold
hi htmlTitle                guifg=magenta                   gui=bold,underline	ctermfg=magenta						cterm=bold,underline
hi javaScript               guifg=green                                         ctermfg=black       ctermbg=yellow  cterm=bold

" MATH highlighting (Custom filetype, see syntax/math.vim)
hi link mathOperator Operator
hi link mathNumber Number
hi mathVariable             guifg=white
hi mathExample              guifg=yellow                    gui=bold,underline

hi luaOperator				guifg=green											ctermfg=green
hi luaFunc					guifg=darkgray										ctermfg=darkgray
hi luaNumber				guifg=red											
hi luaConstant				guifg=purple3
hi luaFunction				guifg=yellow
hi luaVolitionConstant		guifg=#770077
hi luaVolitionSysConstant	guifg=blue

hi unrealSpecifier guifg=#a96a1e
hi link unrealMetaKey unrealSpecifier
hi link unrealGenerated Macro
