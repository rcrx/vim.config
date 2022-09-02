"The Basics
"""""""""""
let mapleader=';'
set clipboard=unnamedplus
" "Escapades
   "inoremap <esc> <esc>
"   cnoremap <esc> <esc>
   "vnoremap <esc> <esc>
   set ttimeoutlen=5
     inoremap ;j <esc>
     vnoremap ;j <esc>
     cnoremap ;j <esc>
     "Correct semi-colon for mapleader
 	nnoremap ;' ;
 	vnoremap ;' ;
"make shift+y behavior consistent with similar shortcuts:
   nnoremap <s-y> y$

syntax on

"Lines:
"soft line-wrapping?
  set linebreak
  set wrap
"Line Numbers
set relativenumber
set nu

"always gives a status-line
  set laststatus=2
  set foldcolumn=1
  set autochdir
"highlights search terms, turn off with "noh"
  set hlsearch
 "turns on case-insensitive searches
set ignorecase

"Quickly edit .vimrc
map <leader>ev :tabe ~/.vimrc<cr>

"Tabs
nnoremap <leader>gn :tabnew<cr>
nnoremap <leader>nt :tabnew<cr>
"Buffers
nnoremap <leader>B :Buffers<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>nb :enew<cr>
	" new buffer

"GUI and CLI--specific options
if has('gui_running')
		"set go-=T
	colorscheme pencil
    let g:ranger_map_keys = 0
	set guioptions -=e
	set guioptions -=m
	set go-=r
	set bg=dark
	set go-=T
	set guifont=Ubuntu\ Mono\ Regular\ 18
		else
 "change status line color based on modes
au InsertEnter * hi StatusLine ctermfg=blue ctermbg=0
au InsertLeave * hi StatusLine ctermfg=black ctermbg=7
 "Change cursor shape based on modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
endif

"default filetypes
au BufNewFile,BufFilePre,BufRead *.md set filetype=pandoc
au BufNewFile,BufFilePre,BufRead *.note set filetype=pandoc
  "Filetypes
filetype plugin indent on
filetype plugin on

"motions&folds"
"""""""""""""""
autocmd FileType pandoc set textwidth=65
set foldenable
let foldmethod="manual"
let g:markdown_folding = 1
let g:pandoc#folding#fold_vim_markers = 1

"movements/mods
nnoremap { {{j^
nnoremap } }j^
nnoremap <leader>o o<cr>

"toggle fold open/closed
nnoremap <space> za
nnoremap <cr> zozz
nnoremap zn zczjzo
nnoremap zp zczkzo
	"center line on screen
inoremap <leader>z <Esc>zzA

"Wild completion
set wildmode=longest,list,full
set wildmenu

"Line manipulation
""""""""""""""""""
"adds blank line below/above
nnoremap <silent> <leader>J :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <leader>K :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Move Lines like in Atom
nnoremap <silent> <leader>k :m-2<cr>==
vnoremap <silent> <leader>k :m-2<cr>gv=gv
nnoremap <silent> <leader>j :m+<cr>==
vnoremap <silent> <leader>j :m'>+<cr>gv=gv

"reflow text
"reflow paragraph (hard breaks)
command R :norm vipgq<cr>
nnoremap <leader>rr :norm vipgq<cr>
"reflow document
command RF :norm ggVGgq<cr>

"Pandoc & file conversion
"""""""""""""""""""""""""
	command H :w | :!pandoc -s "%" -o "%.html"
	command O :w | :!pandoc -s %:p -o %:p.odt
	command P w! ~/Desktop/% | !pandoc -s ~/Desktop/% -o ~/Desktop/%.html && /usr/bin/firefox ~/Desktop/%.html
	    command RM !rm ~/Desktop/%*

"highlighting
"""""""""""""
hi Conceal ctermbg=NONE
hi SignColumn ctermbg=none
hi Folded ctermbg=none
hi FoldColumn ctermbg=none

"tab bar colors:
:hi TabLineFill ctermfg=black ctermbg=DarkGreen
:hi TabLine ctermfg=white ctermbg=black
:hi TabLineSel ctermfg=Black ctermbg=LightGray

"Plugins
""""""""
"enable fzf
set rtp+=~/.fzf
"____________________________________
"See plugins folder for more options:
"""""""""""""""""""""""""""""""""""""
"
"~/.vim/plugin/windows.vim
"~/.vim/plugin/folds.vim
"~/.vim/plugin/voom.vim
"~/.vim/plugin/goyo.vim
