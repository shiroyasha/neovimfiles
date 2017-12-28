"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/vagrant/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/vagrant/.cache/dein')
  call dein#begin('/home/vagrant/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/vagrant/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('danchoi/ri.vim')
  call dein#add('danro/rename.vim')
  call dein#add('godlygeek/tabular')
  call dein#add('isRuslan/vim-es6')
  call dein#add('janko-m/vim-test')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kien/ctrlp.vim')
  call dein#add('rking/ag.vim')
  call dein#add('nelstrom/vim-textobj-rubyblock')
  call dein#add('neomake/neomake')
  call dein#add('rainerborene/vim-reek')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

runtime macros/matchit.vim          " Enables % to cycle through `if/else/endif`, recognizing Ruby blocks, etc.

set number
set ruler                              " Show the cursor position all the time
set colorcolumn=80                     " Show vertical bar at column 80
set showcmd                            " Show partial commands below the status line
set shell=bash                         " Avoids munging PATH under zsh
let g:is_bash=1                        " Default shell syntax
set scrolloff=3                        " Have some context around the current line always
                                       " on screen
set noerrorbells visualbell t_vb=      " Disable bell
set hidden                             " Allow backgrounding buffers without writing
                                       " them, and remember marks/undo for backgrounded
                                       " buffers
set backupdir=~/.config/nvim/_backup   " where to put backup files
set directory=~/.config/nvim/_temp     " where to put swap files
set inccommand=nosplit                 " incremental substitute

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

" Searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

function s:setupWrappingAndSpellcheck()
  set wrap
  set wrapmargin=2
  set textwidth=80
  set spell
endfunction

if has("autocmd")
  " Delete empty space from the end of lines on every save
  au BufWritePre * :%s/\s\+$//e

  " Make sure all markdown files have the correct filetype set and setup
  " wrapping and spell check
  au BufRead,BufNewFile *.{md,md.erb,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrappingAndSpellcheck()

  " Spellcheck
  au BufRead,BufNewFile *.feature setlocal spell

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " Encrypted Yaml
  au BufRead,BufNewFile *.{yml.enc} setlocal filetype=yaml

  au BufRead,BufNewFile *.{inky} setlocal filetype=html

  " Git
  au Filetype gitcommit setlocal spell textwidth=72

  au BufWritePost * Neomake
endif

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

let mapleader=" "

" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=

inoremap jj <Esc>

let g:vimfiler_as_default_explorer = 1

map <leader>ga :CtrlP app<cr>
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gj :CtrlP app/assets/javascripts<cr>
map <leader>gf :CtrlP features<cr>
map <leader>gs :CtrlP spec<cr>
map <leader>gt :CtrlP test<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>f :CtrlP ./<cr>
map <leader>b :CtrlPBuffer ./<cr>
map <leader>e :VimFilerBufferDir -toggle <cr>
map <leader>gd :e db/schema.rb<cr>
map <leader>gr :e config/routes.rb<cr>
map <leader>gg :e Gemfile<cr>
map <leader><leader> :A<CR>
map <leader>s :split<CR>
map <leader>v :vsplit<CR>

let g:ag_prg="ag --nocolor --nogroup --column"
nmap <leader>a :Ag! ""<Left>
nmap <leader>A :Ag! <C-r><C-w>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy="neovim"

set wildignore+=tmp/**
set wildignore+=*/vendor/*
set wildignore+=*/plugged/*

nnoremap <leader><leader> <c-^>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" map Ctrl+S to :w
noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Airline
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline_section_x=""
let g:airline_section_y=""
let g:airline_section_z="%l/%L %-3.c"

" Reek
let g:reek_on_loading = 0
let g:reek_line_limit = 1000 " Don't check files with more than 1000 lines

" Nvim Terminal
" Make escape work in the Neovim terminal.
tnoremap <Esc> <C-\><C-n>

" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert

" Ruby on Rails
let g:rubycomplete_rails = 1

set background=dark
highlight ColorColumn ctermbg=234

if has('nvim')
  tmap <C-o> <C-\><C-n>
end
