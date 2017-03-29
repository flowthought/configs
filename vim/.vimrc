" Remap jk to ESC
inoremap jk <ESC>

" Vim-Plug(junegunn/vim-plug). Run the following on linux. Not checking this in because it needs to be updated.
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" NERDtree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Solarized
Plug 'altercation/vim-colors-solarized'

" Monokai
Plug 'sickill/vim-monokai'

" Fugitive
Plug 'tpope/vim-fugitive'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()

" Nerd Tree show
map <C-n> :NERDTreeToggle<CR>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep\ $* grepformat=%f:%l:%c:%m

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Customized grep command to bypass output window and show quickfix list
command! -nargs=+ Lookup execute 'silent grep! <args>' | copen
" Search for word under cursor. Use appropriate shortcut
" nnoremap <C-s> :execute 'Lookup '.expand('<cword>').' '.expand('%:h')<CR>

" Create mapping for '%%' to be expanded to current file's working directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

colorscheme monokai
filetype plugin indent on
syntax on
set encoding=utf-8

" Status line customizations
set laststatus=2

" To use system clipboard. Make sure vim is compiled with +clipboard
set clipboard=unnamedplus

" Show line numbers
set number

" Backspace through everything
set backspace=indent,eol,start

" Tabs as four spaces[1]
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Highlight search results by default. Use :noh to temporarily turn off
" highlighting within search results until the next search is performed.
set hlsearch
" Incremental search
set incsearch

" Set max tab pages (up from 10)
set tabpagemax=25

" Set smart case search[2]. Will search insensitive unless there is a capital
" letter in the search string
set ignorecase
set smartcase

" Allow switching buffers before confirmation, but confirm without quitting
set hidden
set confirm

" Show line/column information
set ruler

" More natural window splits
set splitbelow
set splitright

" Turn on wildmenu for tab completion in Ex commands
set wildmenu
set wildmode=full

" Frequent personal shortcuts (mostly leader based)
let mapleader = "\<Space>"

" Targeted edits [3]
nnoremap <leader>oh :e %<.h<CR>
nnoremap <leader>oc :e %<.cpp<CR>
nnoremap <leader>oo :e! %<CR>
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>vl :so $MYVIMRC<CR>
nnoremap <leader>f :find 
nnoremap <leader>pf :CtrlP 
nnoremap <leader>pb :CtrlPBuffer<CR>
nnoremap <leader>ps :set path=
nnoremap <leader>pa :set path+=

" Buffer/Window management
nnoremap <leader>1 :only<CR>
nnoremap <leader>2 <C-w>v
nnoremap <leader>3 <C-w>s
nnoremap <leader>d :bd<CR>
nnoremap <leader>bd :bd!<CR>
nnoremap <C-Tab> gt
" nnoremap <C-S-Tab> gT -- doesn't seem to work in mac
nnoremap <leader>tn :tabnew %<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>to :tabnew 

" File management
nnoremap <leader>w :w<CR>
cmap w!! !sudo tee %

" Use the '.' command as a verb in visual mode
vnoremap . :'<,'>norm.<CR>

" Git (fugitive) quick shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit 

source ~/.mvimrc

"" [1]: http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
"" [2]: http://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
"" [3]: http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
