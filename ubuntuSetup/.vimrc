"==================================================
" Bundle Setup
"==================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
colorscheme gruvbox

"==================================================
" Map Setting
"==================================================
nmap ,s :source ~/.vimrc<cr>
nmap ,v :e ~/.vimrc<cr>
nmap ,q :q!<cr>

map <F2>		:vs ./<CR>
map <F3>		:sp ./<CR>
map <F4>		:q!<CR>
map <F5>		:set syntax=spice<CR>
map <F6>		:set syntax=verilog<CR>
map <F7>		:set syntax=tcl<CR>
map <F8>		:set syntax=skill<CR>
map <F12>		:TagbarToggle<CR>
map <C-Left>	:tabprev<CR>
map <C-Right>	:tabnext<CR>
map <C-n>		:tabnew<CR>
map <C-S-CR>	:term<CR>

"==================================================
" Visual Setting
"==================================================
"colorscheme torte
syntax  on
set guifont=DejaVu\ Sans\ Mono\ 11
set linespace=2
set nocursorcolumn
set nocursorline
set laststatus=2
set incsearch
set lazyredraw
set linebreak
set nolist
"set list listchars=tab:≫\ ,trail:·
set mouse=a
set mousehide
set number
set numberwidth=5
"set pumheight=x
"set rightleft
set ruler
"set scroll=10
set shiftwidth=4
set showbreak=+++\ 
set showcmd
set showmatch
set showtabline=1
set sidescroll=4

set nowrap
set sidescroll=2
set sidescrolloff=10    " 좌우 스크롤 offset 설정
"set list listchars+=extends:>,precedes:<    " 왼쪽 스크롤이 필요한 경우 <, 오른쪽 스크롤이 필요한 경우 > 를 보여준다.nowrap

"==================================================
" Editing
"==================================================
set autoindent
set cindent
set smartindent
set smarttab
set expandtab tabstop=4
set noexpandtab
set mps+=<:>
set nf=alpha,octal,hex,bin
"set omnifunc=syntaxcomplete#Complete
"set operatorfunc
"set statusline
"set tabline

"==================================================
" Environment
"==================================================
set noautochdir
set autoread
set background=dark
"set background=light
set backspace=indent,eol,start
"set backup backupdir=./
set confirm
set dict=~\.vimdic
set hlsearch
set history=100
"set ignorecase
"set smartcase
set noignorecase
set loadplugins
set noeb vb

"==================================================
" Abbreviate
"==================================================
iabbr __email woongchoi@sm.ac.kr
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')
iabbr <expr> __branch system("git rev-parse --abbrev-ref HEAD")
iabbr <expr> __bash system("which bash")

"==================================================
" Functions
"==================================================
" Remain File Infomation
"--------------------------------------------------
filetype on
filetype indent on
filetype plugin on

au BufNewFile,BufReadPost Makefile set noexpandtab

set showcmd
set cmdheight=1
set laststatus=2
"set statusline=\(%n\)%<%f\ %h%m%r%=0x%B\ \ \ \ %-14.(%l,%c%V%)\ %P

"When editing a file, always jump to the last known cursor position
au BufReadPost *
 \ if line("'\"") > 0 && line("\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif

augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent loadview
augroup END
