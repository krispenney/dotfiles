set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required
filetype plugin indent on

set runtimepath+=~/.vim_runtime
set relativenumber
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set colorcolumn=121

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

" Normal mode on jk
imap jk <esc>

let mapleader="\<Space>"

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

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
