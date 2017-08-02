set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required
filetype plugin indent on

set runtimepath+=~/.vim_runtime
set relativenumber
set number
set colorcolumn=121

set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

set guifont=Inconsolata\ for\ Powerline:h24

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

let mapleader="\<Space>"

nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pu :PluginUpdate<CR>

" Move by visual lines
nnoremap j gj
nnoremap k gk

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" Normal mode on jk
imap jk <esc>


nnoremap <leader>ggb :Git branch<space>
nnoremap <leader>ggc :Git checkout<space>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
noremap <leader>gr :Gbrowse<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gp :Ggrep<space>

" Save and Quit
nnoremap <leader>q :close<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :w<CR>

" Enter commands with ;
nnoremap ; :

autocmd BufEnter * EnableStripWhitespaceOnSave

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
