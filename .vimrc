set nocompatible " this also changes the meaning of other options

" start pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on " indent according to syntax rules for file type
" now any plugs can be extacted to a subdirectory under ~/.vim/bundle and they
" will be added to the 'runtimepath'
" ref: https://github.com/tpope/vim-pathogen

" pymode options
" documentation is available in vim :help pymode
" don't run the mccabe complexity checker
let g:pymode_lint_checkers = ['pyflakes', 'pep8']

" map jk and kj   to <ESC>
"inoremap jk <ESC>
"inoremap kj <Esc>

"two Escapes save the buffer
map <Esc><Esc> :w<CR>

" vim latex stuff: see vim-latex.sourceforge.net
set grepprg=grep\ -nH\ $* " have grep always generate a file name
let g:tex_flavor='latex'  " load vim-latex for empty .tex files

set hidden " hide buffers instead of closing them
set nowrap " don't wrap lines

set tabstop=4  " tab is four spaces
set expandtab " convert tabs to spaces

set backspace=indent,eol,start " allow backspacing over everthing in insert mode
set autoindent
set copyindent " copy previous indentation on autoindenting
set number " always show line numbers
set shiftwidth=4 " number of spaces to use for autoindenting
set shiftround " use multiple shiftweidth when indenting with '<'
set showmatch " show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " search is case sensitive iff not all lower case
set smarttab " insert tabs at start of line according to shiftwidth, not tabstop
"set hlsearch " highlight search terms
"set incsearch " show search matches as you type

set history=1000 " remember many commands
set undolevels=1000 " allow many undoes

set visualbell " don't beep
set noerrorbells " don't beep

set nobackup
set noswapfile

" status line
set laststatus=2  " show status line even if just one window

set autoread   " reload a file if it changes
autocmd CursorHold * checktime  " run checktime automatically after 4 secs


set mouse=a " enable mouse for command line, input, navigation

" use Q for formatting current paragraph or selection
vmap Q gq
vmap Q gqap

" save buffer in two keystrokes when in normal mode
" THIS DOES NOT WORK IN MY UBUNTU ON ISOLDE
"nmap <Esc><Esc> :w<CR>

" make navigating among multiple windows easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w> <C-w>w  " move to next window below or to right; cycle
map <C-W> <C-w>W  " move to next window above to to left; cycle

" clear search buffer when you press ,/
nmap <silent> ,/ :nohlsearch<CR>

 
" disable arrow keys when in insert mode
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>

" auto-reload .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" set color scheme; ones I like are delek, khoeler, railcasts, slate
syntax enable
set background=dark
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme slate

" underline current line in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" highlight cursorline and cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" \c will toggle highlighting on and off (to make it easy to locate the cursor
" in a large file)
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" save and reload folds
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
autocmd BufWrite * mkview
autocmd BufRead * silent loadview

" create folds manually then mark them (select then zf)
set foldmethod=marker
