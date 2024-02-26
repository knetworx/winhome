let g:vimrcdebug=0

let g:mac=0
let g:macvim=0
let g:cygwin=0
let g:windows=0
let g:unix=0

" VUNDLE
"---------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

let g:clang_library_path = '/usr/bin/clang'
let g:SuperTabDefaultCompletionType = "<C-S-space>"
"let g:clang_user_options='|| exit 0'
let g:clang_user_options = '2>/dev/null || exit 0'
"let g:clang_use_library = 1
let g:clang_complete_auto = 0 " Whether to start completion on ->, ., ::
let g:clang_complete_copen = 1 " Whether to open quickfix window on error

" CtrlP Options
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:100'

filetype plugin indent on

" Vaxe Options
let g:vaxe_skip_hxml = 1

if g:vimrcdebug | echom "Running vimrc" | endif

" See ':help has()'
if has('gui_macvim')
	if g:vimrcdebug | echom "macvim" | endif
	let g:macvim=1
elseif has('win32') || has('win64')
	if g:vimrcdebug | echom "windows" | endif
	let g:windows=1
endif

if has('macunix')
	if g:vimrcdebug | echom "mac unix" | endif
	let g:mac=1
endif

" This will be true for Git Bash terminals in Windows
if has('win32unix')
	if g:vimrcdebug | echom "cygwin" | endif
	let g:cygwin=1
endif

if has('unix')
	if g:vimrcdebug | echom "unix" | endif
	let g:unix=1
endif

set nocompatible

set winaltkeys=no

filetype on
filetype plugin on

if g:vimrcdebug | echom "NightDaySwap" | endif

" Always start with my own colorscheme
colorscheme nick
" However, my dark theme is tough to see while riding in the car in the sun,
" so let's have a hotkey for switching to something with a light background
function! NightDaySwap()
	if g:colors_name == "nick"
		colorscheme morning
		hi SpecialKey guifg=#999999
		hi Comment guifg=#999999
		" And the lime green cursor is kinda tough to see as well
		hi cursor guibg=blue ctermbg=blue
	else
		colorscheme nick
	endif
	" For some reason, vimFunction isn't linked to Function by default
	hi link vimFunction Function
endfunction
noremap <F11> :call NightDaySwap()<CR>

syntax on

if !has("gui_running")
	set t_Co=256
else
	set t_Co=512
endif

set mouse=a

" TODO: Look up what this does and put a useful comment
if has('mouse_sgr')
    set ttymouse=sgr
endif

if g:vimrcdebug | echom "Group 1" | endif

set autoindent
set autoread
set backspace=indent,eol,start
set browsedir=buffer
set clipboard=unnamed
if &diff
	set scrollbind
	set cursorbind
	"set lines=999
else
	if has('gui')
		"set lines=999
	endif
endif
set complete=.,w,b,u,k,s,i,d,]
set completeopt=menu,menuone,longest
set copyindent
set preserveindent
set diffopt=filler,vertical,context:10,foldcolumn:0,iwhite
set display=lastline
set gdefault
set foldmethod=expr
set nofoldenable
set nu
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
if g:mac || g:macvim
	set guifont=Monaco:h10
else
	set guifont=Lucida_Console:h9
endif
set guioptions=eihmtbrlaAc
set history=2000
set ignorecase
set smartcase
set infercase
set incsearch
set selection=inclusive
set keymodel=startsel
set linespace=0
set listchars=tab:>-
set list
set nobackup
set noswapfile
set noremap
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
set foldminlines=40
set hlsearch
set nowrap
set ruler
set scroll=1
set sidescroll=3
set scrolloff=3
set sidescrolloff=10
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set scrollopt=ver,hor,jump
set showcmd
set smartindent
if g:vimrcdebug | echom "Group 2" | endif
au Bufread,BufNewFile * set ts=4 sts=4 sw=4 tw=0 noet
"au BufNewFile,BufRead *.txt,*.doc,*.rtf set spell
"au Bufread,BufNewFile *.as set filetype=actionscript
"au Bufread,BufNewFile *.template set filetype=jinja
"augroup filetype
	"au! BufRead,BufNewFile *.proto setfiletype proto
"augroup end
if g:vimrcdebug | echom "Group 3" | endif
"set spellsuggest=fast
set nospell
set splitright
set splitbelow
set switchbuf=split
set textwidth=0
set undolevels=10000
set whichwrap=b,s,<,>
set winheight=999
"set winwidth=999
"set columns=999
"set lines=999
set wildmenu

" Always start with '=' so if we reload the vimrc it doesn't keep adding onto the previous collection
set wildignore=.DS_Store
set wildignore+=_cache,*.abc,*.as3proj,*.bmp,*.class,*.csv,*.cxx,*.d,*.dat,*.data,*.db,*.diff,*.dio,*.dmg,*.dylib,*.exe,*.fla,*.flv,*.git,*.gitignore,*.gz,*.hg,*.idea,*.iml,*.jar,*.jpeg,*.jpg,*.LinkFileList,*.mp4,*.mpg,*.o,*.otf,*.out,*.pb.*,*.pbxproj,*.pc,*.png,*.properties,*.props,*.pyc,*.sspj,*.stamp,*.svn-base,*.swc,*.swf,*.tar.gz,*.tgz,*.ttf,*.wav,*.xconfig,*.xfl,**/.svn/**,**/.git/**
"set wildignore+=*.i

if g:vimrcdebug | echom "Group 4" | endif

function! SwitchSourceHeader()
	if (expand ("%:e") == "cpp" || expand ("%:e") == "c")
		if filereadable(expand("%:p:r").".hpp")
			find %:p:r.hpp
		elseif filereadable(expand("%:p:r").".h")
			find %:p:r.h
  		endif
	else
		if filereadable(expand("%:p:r").".cpp")
			find %:p:r.cpp
		elseif filereadable(expand("%:p:r").".c")
			find %:p:r.c
  		endif
	endif
endfunction

" Add a vim modeline to the beginning of the file
function! AddModeline()
  let l:modeline = printf(" vim: set ts=%d sts=%d sw=%d tw=%d %set :",
        \ &tabstop, &softtabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("^"), l:modeline)
endfunction

function! SetSpaces(spaces)
  exec "set tabstop=".a:spaces
  exec "set softtabstop=".a:spaces
  exec "set shiftwidth=".a:spaces
  exec "set expandtab"
endfunction

function! SetTabs(spaces)
  exec "set tabstop=".a:spaces
  exec "set softtabstop=".a:spaces
  exec "set shiftwidth=".a:spaces
  exec "set noexpandtab"
endfunction

" For a list of autocmd triggers, see:
"http://vimdoc.sourceforge.net/htmldoc/autocmd.html

if g:vimrcdebug | echom "Group 5" | endif

" Change working directory to current
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

autocmd FileType python set tabstop=4 | set softtabstop=4 | set shiftwidth=4 | set expandtab

"au FocusGained,BufEnter * :silent! !

if g:vimrcdebug | echom "Group 6" | endif

"""""""""""""""""""""""""
" If we're dealing with a very large file, cut back on its processing
"let g:LargeFile = 1024 * 1024 * 5
"augroup LargeFile 
" autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
"augroup END
"
"function! LargeFile()
" " no syntax highlighting etc
" set eventignore+=FileType
" " save memory when other file is viewed
" setlocal bufhidden=unload
" " is read-only (write with :w new_filename)
" setlocal buftype=nowrite
" " no undo possible
" setlocal undolevels=-1
"endfunction
"""""""""""""""""""""""""

noremap <ESC> :noh<CR><ESC>

" Tells you what Vim recognizes the current word as for highlighting
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" CTRL+Tab between internal windows
noremap <C-tab> <C-W>w
inoremap <C-tab> <C-O><C-W>w
cnoremap <C-tab> <C-C><C-W>w
noremap <C-S-tab> <C-W><S-W>
inoremap <C-S-tab> <C-O><C-W><S-W>
cnoremap <C-S-tab> <C-C><C-W><S-W>

"map <C-M> :!sml %<CR><C-D>

" Same thing on Mac with iterm2
noremap tab <C-W>w
inoremap tab <C-O><C-W>w
cnoremap tab <C-C><C-W>w
noremap s-tab <C-W><S-W>
inoremap s-tab <C-O><C-W><S-W>
cnoremap s-tab <C-C><C-W><S-W>

" Quick header switch
"noremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"noremap <S-F4> :split %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"noremap <M-F4> :vsplit %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

if g:vimrcdebug | echom "Group 7" | endif

noremap <F4> :call SwitchSourceHeader()<CR>
noremap <S-F4> :call SwitchSourceHeader()<CR>

if &diff
	noremap <F5> :diffupdate<CR>
else
	noremap <S-F5> :source $MYVIMRC<CR><CR>
	noremap <F5> :CtrlP<CR>
	noremap <M-P> :CtrlP<CR>
	noremap <M-p> :CtrlP<CR>
	noremap <D-P> :CtrlP<CR>
	noremap <D-p> :CtrlP<CR>
	noremap <Space><Space> :CtrlP<CR>
	"noremap <S-F5> :CommandTFlush<CR>
endif

"noremap <C-E> :CommandT<CR>
"noremap <S-E> :CommandT<CR>
noremap <C-E> :CtrlP<CR>
noremap <S-E> :CtrlP<CR>

" CTRL-F4 is Close window
"noremap <C-F4> <C-W>c
"inoremap <C-F4> <C-O><C-W>c
"cnoremap <C-F4> <C-C><C-W>c

" CTRL-Up to scroll the window up one line
noremap <C-Up> <C-Y>
inoremap <C-Up> <C-O><C-Y>
cnoremap <C-Up> <C-C><C-Y>

" CTRL-Down to scroll the window down one line
noremap <C-Down> <C-E>
inoremap <C-Down> <C-O><C-E>

" This is apparently something to do with Mac, but I'm not sure what, so I
" don't want to delete it
inoremap <C-@> <C-X><C-O>
inoremap <C-@> <C-P>
" CTRL-Space to complete word or bring up completion menu (only in insert mode)
inoremap <C-Space> <C-X><C-O>
inoremap <C-Space> <C-P>

" Jump to the last place you edited text or place where the cursor was before
" the last jump command (jump commands are caused by searching, jumping to
" marks, etc.)
" Note: Since Vim uses named marks, this is the closest I could come to
" actually setting bookmarks
noremap <F2> <C-O>
inoremap <F2> <C-O><C-O>
cnoremap <F2> <C-C><C-O>
noremap <S-F2> <C-I>
inoremap <S-F2> <C-O><C-I>
cnoremap <S-F2> <C-C><C-I>
" Remap the meta key (e.g. command key on Mac) to go forward and back
noremap <D-[> <C-O>
inoremap <D-[> <C-O><C-O>
cnoremap <D-[> <C-C><C-O>
noremap <D-]> <C-I>
inoremap <D-]> <C-O><C-I>
cnoremap <D-]> <C-C><C-I>

if &diff
	" Find the next/previous change in a diff using F7 and F8
	noremap <F7> [c
	inoremap <F7> <C-O>[c
	cnoremap <F7> <C-C>[c
	noremap <F8> ]c
	inoremap <F8> <C-O>]c
	cnoremap <F8> <C-C>]c
	" ...or with F3 and Shift-F3
	noremap <F3> ]c
	inoremap <F3> <C-O>]c
	cnoremap <F3> <C-C>]c
	noremap <S-F3> [c
	inoremap <S-F3> <C-O>[c
	cnoremap <S-F3> <C-C>[c
endif

function! FindInFiles(search, path)
	"echo "Searching from '".getcwd()."', search='".a:search."', path='".a:path."'"
	let command="noautocmd vimgrep /".a:search."/j ".a:path." | cw"
	"echo "Command=".l:command
	exec l:command
endfunction

noremap <C-G> :call FindInFiles('\<'.expand("<cword>").'\>', '**')<CR>
" Note: putting left here so many times so that the cursor will end up between the search quotes
"noremap <C-S-H> :exec "noautocmd vimgrep //j **" <Bar> cw<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
noremap <C-F> :call FindInFiles('', '**')<S-Left><Left><Left><Left>

" Auto-indent every time you paste
" Note: Disabling this because it doesn't seem to be working properly
" noremap p ]p

" Fix the arrow keys in normal mode in the terminal
"nnoremap OA <ESC>ki
"nnoremap OB <ESC>ji
"nnoremap OC <ESC>li
"nnoremap OD <ESC>hi
nnoremap OA k
nnoremap OB j
nnoremap OC l
nnoremap OD h
noremap OA k
noremap OB j
noremap OC l
noremap OD h

" Alt-Arrow to switch between splits
noremap <S-Up> <C-W><Up><C-W>_
noremap <S-Down> <C-W><Down><C-W>_
noremap <S-Left> <C-W><Left><C-W>_
noremap <S-Right> <C-W><Right><C-W>_
inoremap <S-Up> <ESC><C-W><Up><C-W>_
inoremap <S-Down> <ESC><C-W><Down><C-W>_
inoremap <S-Left> <ESC><C-W><Left><C-W>_
inoremap <S-Right> <ESC><C-W><Right><C-W>_

" Custom settings for any given computer (i.e. my old Macbook has a lower
" resolution screen, so I use a smaller font to fit more text
if filereadable($HOME . "/.vimrclocal")
	source $HOME/.vimrclocal
endif

" Add block cursor to vim specifically for cygwin
if g:cygwin
	let &t_ti.="\e[1 q"
	let &t_SI.="\e[5 q"
	let &t_EI.="\e[1 q"
	let &t_te.="\e[0 q"
endif

if g:vimrcdebug | echom "FIN!" | endif
