set runtimepath+=~/.vim_runtime

set nocompatible              " be iMproved, required
filetype off                  " required

" set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')

" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
" Plugin 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'rust-lang/rust.vim'
Plug 'cloudhead/neovim-fuzzy'
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
" Plug 'dense-analysis/ale'

" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'fatih/vim-go'
call plug#end()            " required

filetype plugin indent on

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
set shiftround

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Vundle Plugin Commands
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>

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

" nnoremap <leader>ggb :Git branch<space>
" nnoremap <leader>ggc :Git checkout<space>
" nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gc :Gcommit<CR>
" nnoremap <leader>gb :Gblame<CR>
" noremap <leader>gr :Gbrowse<CR>
" nnoremap <leader>gd :Gdiff<CR>
" nnoremap <leader>gp :Ggrep<space>

" Save and Quit
nnoremap <leader>q :close<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :w<CR>

" Enter commands with ;
nnoremap ; :

" autocmd BufEnter * EnableStripWhitespaceOnSave
autocmd BufNewFile,BufRead *.mdx set syntax=markdown
autocmd BufNewFile,BufRead *.inc set syntax=php

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

function! Regexify(text)
  let regex_text=escape(a:text, "'()/\.*$^~[]\\\"\?")

  " escaping for oh my zsh
  let regex_text=escape(regex_text, "'()/\.*$^~[]\\\"\?")
  let regex_text=substitute(regex_text, ' ', '_', 'g')
  return regex_text
endfunction

function! OpenUrl(url)
  return system(substitute("open '" . a:url . "' -a Google\\ Chrome", "\n", "", "g"))
endfunction

function! GithubUrl()
  let github="https://github.com"
  let repo=system("pwd \| sed 's/.*github.com//'")
  let rev=system("git rev-parse HEAD")
  let url=github . repo . "/blob/" . rev . "/" . @%

  return url
endfunction

function! GithubLineUrl()
  let url=GithubUrl()
  let line_number=line(".")

  return url . "#L" . line_number
endfunction

function! GithubMultiLineUrl() range
  let url=GithubUrl()

  " visual mode marks for start/end of selection
  let start_line_number=line("'<")
  let end_line_number=line("'>")

  return url . "#L" . start_line_number . "-L" . end_line_number
endfunction

nnoremap <leader>vv :call OpenUrl(GithubUrl())<CR>
nnoremap <leader>vl :call OpenUrl(GithubLineUrl())<CR>
vnoremap <leader>vl :<c-u>call OpenUrl(GithubMultiLineUrl())<CR>

nnoremap <leader>op :Dispatch /opt/dev/bin/dev open pr<CR>
nnoremap <leader>tt :Dispatch /opt/dev/bin/dev test<CR>
vnoremap <leader>tt "zy:let @x=expand("%")<CR>:Dispatch /opt/dev/bin/dev test <C-r>x -n /`=Regexify(@z)`/<CR>

nnoremap <leader>tc :Dispatch /opt/dev/bin/dev test %<CR>
nnoremap <leader>tb :Dispatch /opt/dev/bin/dev test --include-branch-commits<CR>

" Render the current mdx file to Markdown
nnoremap <leader>md :Dispatch python3 ~/git/markdown-extended/main.py % .<CR>

nnoremap <C-p> :FuzzyOpen<CR>

inoremap ;; <Esc>/<++><CR>"_c4l

" Mappings for ruby
autocmd Filetype ruby inoremap ;d def <++>(<++>)<CR><++><CR>end<ESC>2k0f<"_c4l
autocmd Filetype ruby inoremap ;c class <++><CR><++><CR>end<ESC>2k0f<"_c4l
autocmd Filetype ruby inoremap ;m module <++><CR><++><CR>end<ESC>2k0f<"_c4l
autocmd Filetype ruby inoremap ;t test "<++>" do<CR><++><CR>end<ESC>2k0f<"_c4l

" Mappings for erb
autocmd Filetype eruby inoremap ;b <%= <++> do %><CR><++><CR><% end %><ESC>2k0wf<"_c4l
autocmd Filetype eruby inoremap ;v <%= <++> do \|<++>\| %><CR><++><CR><% end %><ESC>2k0wf<"_c4l
autocmd Filetype eruby inoremap ;t <%= <++> %><ESC>0wf<"_c4l

let g:rustfmt_autosave = 1

" Ale config

" let g:ale_fix_on_save = 1
"let g:ale_completion_enabled = 1
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'go': ['gofmt'],
"\   'ruby': ['rubocop'],
"\   'typescript': ['tsserver'],
"\   'rust': ['rustfmt'],
"\}

"nmap <silent><leader>ad :ALEDetail<CR>
"nmap <silent><leader>af :ALEFirst<CR>
"nmap <silent><leader>al :ALELast<CR>
"nmap <silent><leader>an :ALENext<CR>
"nmap <silent><leader>ap :ALEPrevious<CR>
"nmap <silent><leader>agd :ALEGoToDefinition<CR>
"nmap <silent><leader>afr :ALEFindReferences<CR>
"nmap <silent><leader>afa :ALEFix<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
