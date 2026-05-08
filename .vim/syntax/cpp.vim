" Vim syntax file
" Language:	C++
" Maintainer:	Ken Shan <ccshan@post.harvard.edu>
" Last Change:	2002 Jul 15

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" C++ extentions
syn keyword cppStatement	new gcnew delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppType			inline virtual explicit export bool wchar_t uint8 uint32 farray varray
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match   cppCast			"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match   cppCast			"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppBoolean		true false

" Our custom classes all start with a capital letter
syn match cppCustDecl		"\<[A-Z][a-zA-Z0-9_]*\>" contains=cppCustDefines

"syn region cppDEBUGINNER	start=+^\s*#if+ end=+^\s*#endif.*$+ contained
"syn region cppDEBUG		start=+^\s*#if.*\<DEBUG\>+ skip=cppDEBUGINNER end=+^\s*#endif.*\<DEBUG\>+

syn match   cppFunctions	"\i\+\(\(<\i\+>\)\?(\)\@=" contains=cppCast,cppCustDecl
syn match   cppFunctions	"\(^\s*\)\@<=\([a-z]\i\+\)\(,\s*$\)\@="
" Function pointers		(*func)(arg1, arg2)
syn match   cppFunctions	"\((\*\)\@<=\(\i\+\)\()\s*(\)\@="
syn match   cppCustDefines	"\(->\|\.\)\@<!\(\<[A-Z_][A-Z0-9_]\+\>\)\(->\|\.\)\@!"
syn match   cppCustDefines	"\<[A-Z_][A-Z0-9_]\+\>"
syn keyword cppBuildName	_DEBUG __RELEASE_FINAL DEBUG __AVM2__
syn match   cppPreProcWords	"^\s*#\i\+" contains=cppBuildName
syn match   cppPreProcWords	"^\s*#if !\?defined" contains=cppOperator,custOps
syn match   cppCustDefines	"\(^\s*#\i\+\)\@<=.\+" contains=cppOperator,custOps,cComment,cCommentL,cNumber,cNumbers,cppBuildName,cppPreProcWords,cIncluded,custOpMath,custOpBrackets,custOpComparator,custOpPunc
syn match   cppStdBoostAccess	"\<\i\+\(::\i\+\)\+\>" contains=ALL
syn keyword cppStdBoost		contained std boost string vector unordered_map unordered_set ordered_map ordered_set map set bitset
syn keyword cppStdBoost		shared_ptr stringstream istringstream ostringstream iterator const_iterator cout endl runtime_error cerr
syn keyword cppStdBoost		list value_type ostream
syn keyword cRepeat		foreach

syn region  cppSectionHeader	 start=+///+ end=+$+

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppAccess		cppStatement
  HiLink cppCast		cppStatement
  HiLink cppExceptions		Exception
  HiLink cppOperator		Operator
  HiLink cppStatement		Statement
  HiLink cppType		Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure		Structure
  HiLink cppNumber		Number
  HiLink cppBoolean		Boolean
  HiLink cppBuildName		cppType
  HiLink cppStdBoost		cppCustDefines
  delcommand HiLink
endif

let b:current_syntax = "cpp"

" vim: ts=8
