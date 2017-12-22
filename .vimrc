set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'tpope/vim-fugitive'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'wincent/command-t'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'tpope/vim-endwise'
  Plugin 'rizzatti/dash.vim'
  Bundle 'joonty/vim-do.git'
call vundle#end()

function GetTestName()
  let line=getline('.')
  let testname=matchstr(line,'test [''"]\zs.\{-}\ze[''"] do')

  if empty(testname)
    throw 'No test found in current line: "' . line . '"'
  endif

  let testname=substitute('test ' . testname, ' ', '_', 'g')
  let testname=substitute(testname, '#', '\\#', '')
  let testname=substitute(testname, '(', '\\(', 'g')
  let testname=substitute(testname, ')', '\\)', 'g')
  let testname=substitute(testname, "'", "\\'", 'g')
  let testname=substitute(testname, '"', '\\"', 'g')

  return testname
endfunction

function RakeSingleTest()
  let testname= GetTestName()
  let filename=bufname("%")

  " execute ':new | 0read ! bin/rails test ' . filename . ' -n ' . testname
  execute ':! /opt/dev/bin/dev test ' . filename . ' -n ' . testname
endfunction

function RakeFileTest()
  let filename=bufname("%")

  " execute ':new | 0read ! bin/rails test ' . filename
  execute ':! /opt/dev/bin/dev test ' . filename
endfunction

let g:CommandTMaxFiles=200000 " Increase command-t file limit

:nnoremap tt :call RakeSingleTest()<cr>
:nnoremap ff :call RakeFileTest()<cr>

autocmd BufEnter * EnableStripWhitespaceOnSave

syntax on
color dracula

set relativenumber
set number
set colorcolumn=121

set ignorecase " Ignore case when searching
set smartcase
set hlsearch " Highlight search results
set incsearch
map <space> /

set showmatch " Highlight matching brackets

set foldcolumn=1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

let mapleader="\<Space>"

map 0 ^

nnoremap j gj
nnoremap k gk

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <CR> o<Esc>

nnoremap <tab> %
vnoremap <tab> %

imap jk <esc>

nnoremap <leader>q :close<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :w<CR>

nnoremap ; :

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set rtp+=~/.fzf
