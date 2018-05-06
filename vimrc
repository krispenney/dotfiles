set runtimepath+=~/.vim_runtime

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wincent/command-t'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()            " required

filetype plugin indent on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_php_checkers = ['php']
let g:syntastic_python_checkers = ["python3"]

syntax on
set termguicolors
colorscheme onehalfdark
let g:airline_theme='onehalflight'
" color dracula

set relativenumber
set number

set shiftwidth=2
set shiftround
set softtabstop=2

set colorcolumn=121

set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

let mapleader="\<Space>"

" Softtabs, 2 spaces
set shiftwidth=2
set shiftround
set expandtab

" Vundle Plugin Commands
nnoremap <leader>vpi :PluginInstall
nnoremap <leader>vpu :PluginUpdate

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

" Enter to create new lines
nnoremap <CR> o<Esc>

" bind K to grep word under the cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
autocmd BufNewFile,BufRead *.mdx set syntax=markdown
autocmd BufNewFile,BufRead *.inc set syntax=php


" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Render the current mdx file to Markdown
nnoremap <leader>md :Dispatch python3 ~/git/markdown-extended/main.py % .<CR>

nmap <silent> <Leader>t <Plug>(CommandT)
