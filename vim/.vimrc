" Remap jk to ESC
inoremap jk <ESC>

" The meta plugin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" NERDtree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Themes
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

" Git Plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Extensions
Plug 'ctrlpvim/ctrlp.vim'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'

" Language
Plug 'cespare/vim-toml'
Plug 'hail2u/vim-css3-syntax'

" Cool status bar plugin. Preferably keep this at the end since it can depend on
" other plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" When vim-airline is enabled, it shows the mode in the status bar. Disabling
" default mode indicator in this case
set noshowmode

" Nerd Tree show
map <C-n> :NERDTreeToggle<CR>

colorscheme molokai
filetype plugin indent on
syntax on
set encoding=utf-8

" Status line customizations
set laststatus=2

" To use system clipboard. Make sure vim is compiled with +clipboard
set clipboard=unnamedplus

" Show line numbers
set number
" Toggle relative/absolute numbering
nnoremap <F7> :set relativenumber!<CR>
inoremap <F7> :set relativenumber!<CR>

" Backspace through everything
set backspace=indent,eol,start
" Tilde as operator
" set tildeop

" Tabs as four spaces
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Highlight search results by default. Use :noh to temporarily turn off
" highlighting within search results until the next search is performed.
nnoremap <F2> :set hlsearch!<CR>
" Incremental search
set incsearch

" Set max tab pages (up from 10)
set tabpagemax=15

" Set smart case search. Will search insensitive unless there is a capital
" letter in the search string
set ignorecase
set smartcase

" Allow switching from modified buffers, but confirm on buffer delete
set hidden
set confirm

" Show line/column information
set ruler

" More natural window splits
set splitbelow
set splitright

" Set the working directory to wherever the open file lives
" set autochdir

" Turn on wildmenu for tab completion in Ex commands
set wildmenu
set wildmode=full
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.pdf,*.swp
" set wildignore+=node_modules/*,bower_components/*

" For gitgutter to update quicker
set updatetime=750

" Frequent personal shortcuts (mostly leader based)
let mapleader = "\<Space>"

" Code search and lookup options
" Search for tags file in all ancestors
set tags=./tags;
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep\ $* grepformat=%f:%l:%c:%m

  " Use ag for ctrlp file listing
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Customized grep command to bypass output window and show quickfix list
command! -nargs=+ Lookup execute 'silent grep! <args>' | copen

" Create mapping for '%%' to be expanded to current file's directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Make the Y command consistent with the C and D commands
nnoremap Y y$

" Targeted edits
nnoremap <leader>e :e<space>
nnoremap <leader>f :find<space>
nnoremap <leader>or :e ./**/*
nnoremap <leader>oh :e %<.h<CR>
nnoremap <leader>oc :e %<.cpp<CR>
nnoremap <leader>oo :e! %<CR>
nnoremap <leader>on :new <bar> only <CR>
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>vl :source $MYVIMRC<CR>

" Diffs
set diffopt+=vertical
nnoremap <leader>od :windo diffthis<CR>
nnoremap <leader>oD :windo diffoff<CR>

" Window management
nnoremap <leader>0 <C-w>c
nnoremap <leader>1 <C-w>o
nnoremap <leader>2 <C-w>v
nnoremap <leader>3 <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer management
" nnoremap <leader>b :b<space>
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>d :bp <bar> bd #<CR>
" nnoremap <leader>d :bd<CR>

" Tab management
nnoremap <C-Tab> gt
" nnoremap <C-S-Tab> gT -- doesn't seem to work in mac
nnoremap <leader>n :tabnew %<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>to :tabnew<space>

" File management
nnoremap <leader>w :w<CR>
" cmap w!! !sudo tee %

" Search for word under cursor. Use appropriate shortcut
nnoremap <leader>lw :execute 'Lookup '.expand('<cword>').' '.getcwd()
nnoremap <leader>ll :Lookup<space>
nnoremap [q :cp<CR>
nnoremap ]q :cn<CR>

" Use the '.' command as a verb in visual mode
vnoremap . :'<,'>normal.<CR>
" Use the '&' command to repeat the last substitution with flags
vnoremap & :&&<CR>
nnoremap & :&&<CR>

" Move by display lines instead of actual lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

vnoremap j gj
vnoremap k gk
vnoremap 0 g0
vnoremap $ g$
vnoremap ^ g^

onoremap j gj
onoremap k gk
onoremap 0 g0
onoremap $ g$
onoremap ^ g^

nnoremap g$ $
nnoremap g0 0
nnoremap g^ ^
nnoremap gj j
nnoremap gk k

vnoremap g$ $
vnoremap g0 0
vnoremap g^ ^
vnoremap gj j
vnoremap gk k

onoremap g$ $
onoremap g0 0
onoremap g^ ^
onoremap gj j
onoremap gk k

" Filetype preferences
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType html,css,hs setlocal shiftwidth=2 tabstop=2
runtime macros/matchit.vim

" Git (fugitive) quick shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gw :Gwrite<CR>

" Clear fugitive buffers automatically
autocmd BufReadPost fugitive://* set bufhidden=delete

" Enable tabline for vim-airline
let g:airline#extensions#tabline#enabled = 1
" Use tabs and buffers as they are meant to be used
let g:airline#extensions#tabline#show_buffers = 0
" Simplify file names in tab headers
let g:airline#extensions#tabline#fnamemod = ':t'
" Enable powerline fonts for cool arrow effects in statusbar
let g:airline_powerline_fonts = 1
" Turn this on if you use hjkl too much for motions
" let g:hardtime_default_on = 0

" Ctrlp: Search for a root marker upwards from current working directory
let g:ctrlp_working_path_mode = 'rw'
" Additional prioritized root markers (over .git, .hg, etc.) for CtrlP
let g:ctrlp_root_markers = ['tags', '.ctrlproot', '.stfolder']
" Store cache across sessions on disk for faster loading times
let g:ctrlp_clear_cache_on_exit = 0
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRU<CR>

" Load machine specific options
if !empty(glob("~/.lvimrc"))
    source ~/.lvimrc
endif
