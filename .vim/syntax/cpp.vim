" Vim syntax file
" Language:	C++
" Maintainer:	Nick Heilmann
" Based on:	Ken Shan <ccshan@post.harvard.edu>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" ============================================================
" C++ keywords
" ============================================================
syn keyword cppStatement	new gcnew delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppType		inline virtual explicit export override final
syn keyword cppType		bool wchar_t uint8 uint16 uint32 uint64 int8 int16 int32 int64
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match   cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match   cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppBoolean		true false
syn keyword cRepeat		foreach

" ============================================================
" UE type prefixes: A=Actor, U=UObject, F=struct, E=enum, T=template, I=interface
" Matches e.g. AActor, UObject, FName, FVector, ENetMode, TArray, IInterface
" Does NOT match plain capitalized variables like Target, Event, WorldContext
" ============================================================
syn match cppUEType "\<[AUFETI][A-Z][a-zA-Z0-9_]*\>"

" ============================================================
" ALL_CAPS defines / macros (JUNO_API, PI, INDEX_NONE, etc.)
" ============================================================
syn match cppCustDefines "\<[A-Z_][A-Z0-9_]\{2,\}\>"

" ============================================================
" Functions: identifier immediately before ( or <T>(
" ============================================================
syn match cppFunctions "\i\+\(\(<\i\+>\)\?(\)\@=" contains=cppCast
" Function pointer:  (*FuncName)(args)
syn match cppFunctions "\((\*\)\@<=\(\i\+\)\()\s*(\)\@="

" ============================================================
" Std / Boost qualified access:  std::vector, boost::shared_ptr
" ============================================================
syn match   cppStdBoostAccess "\<\i\+\(::\i\+\)\+\>" contains=ALL
syn keyword cppStdBoost contained
    \ std boost string vector unordered_map unordered_set map set bitset
    \ shared_ptr stringstream istringstream ostringstream iterator
    \ const_iterator cout endl runtime_error cerr list value_type ostream

" ============================================================
" Build / preprocessor
" ============================================================
syn keyword cppBuildName	_DEBUG __RELEASE_FINAL DEBUG __AVM2__
syn match   cppPreProcWords	"^\s*#\i\+" contains=cppBuildName
syn match   cppPreProcWords	"^\s*#if !\?defined" contains=cppOperator,custOps
syn match   cppCustDefines	"\(^\s*#\i\+\)\@<=.\+" contains=cppOperator,custOps,cComment,cCommentL,cNumber,cNumbers,cppBuildName,cppPreProcWords,cIncluded,custOpMath,custOpBrackets,custOpComparator,custOpPunc

" ============================================================
" Section divider comments:  ////...
" ============================================================
syn region cppSectionHeader start=+///+ end=+$+

syn match cppMinMax "[<>]?"

" ============================================================
" Highlighting links
" ============================================================
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cppAccess	cppStatement
  HiLink cppCast	cppStatement
  HiLink cppExceptions	Exception
  HiLink cppOperator	Operator
  HiLink cppStatement	Statement
  HiLink cppType	Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure	Structure
  HiLink cppNumber	Number
  HiLink cppBoolean	Boolean
  HiLink cppBuildName	cppType
  HiLink cppStdBoost	cppCustDefines
  HiLink cppMinMax	Operator

  HiLink cppUEType	Type
  HiLink cppCustDefines	Constant
  HiLink cppFunctions	Function
  HiLink cppPreProcWords	Include
  HiLink cppSectionHeader	Comment
  HiLink cppStdBoostAccess	Identifier

  delcommand HiLink
endif

let b:current_syntax = "cpp"

" vim: ts=8
