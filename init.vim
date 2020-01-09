call plug#begin('~/.config/nvim/plugged')

" Add or remove your plugins here:
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'danchoi/ri.vim'
Plug 'danro/rename.vim'
Plug 'godlygeek/tabular'
Plug 'isRuslan/vim-es6'
Plug 'shiroyasha/make-test'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neomake/neomake'
Plug 'rainerborene/vim-reek'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'thisivan/vim-bufexplorer'
Plug 'tpope/vim-dispatch'
Plug 'elixir-editors/vim-elixir'
Plug 'renderedtext/vim-elixir-alternative-files'
Plug 'fatih/vim-go'
Plug 'shiroyasha/make-test'
Plug 'mhinz/vim-mix-format'

call plug#end()

runtime macros/matchit.vim               " Enables % to cycle through `if/else/endif`, recognizing Ruby blocks, etc.

let g:mix_format_on_save = 1

let g:vimfiler_safe_mode_by_default = 0  " disable safe mode for VimFiler

set noswapfile

set number
set ruler                                " Show the cursor position all the time
set colorcolumn=80                       " Show vertical bar at column 80
set showcmd                              " Show partial commands below the status line
set wrap                                 " wrap lines
set linebreak                            " Maintains the whole words when wrapping
set shell=bash                           " Avoids munging PATH under zsh
let g:is_bash=1                          " Default shell syntax
set scrolloff=3                          " Have some context around the current line always
                                         " on screen
set noerrorbells visualbell t_vb=        " Disable bell
set hidden                               " Allow backgrounding buffers without writing
                                         " them, and remember marks/undo for backgrounded
                                         " buffers
set backupdir=~/.config/nvim/_backup     " where to put backup files
set directory=~/.config/nvim/_temp       " where to put swap files
set inccommand=nosplit                   " incremental substitute


" Whitespace
set nowrap                               " don't wrap lines
set tabstop=2                            " a tab is two spaces
set shiftwidth=2                         " an autoindent (with <<) is two spaces
set expandtab                            " use spaces, not tabs

" Searching
set ignorecase                           " searches are case insensitive...
set smartcase                            " ... unless they contain at least one capital letter

function s:setupWrappingAndSpellcheck()
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
map <leader>l :BufExplorer <cr>
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

nmap <silent> <leader>t :MakeTestFileLine<CR>
nmap <silent> <leader>T :MakeTestFile<CR>

nnoremap <silent><leader><leader> :call ElixirAlternateFile()<cr>

set wildignore+=tmp/**
set wildignore+=*/vendor/*
set wildignore+=*/plugged/*

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
map <Left>  :echo "no! use h!"<cr>
map <Down>  :echo "no! use j!"<cr>
map <Up>    :echo "no! use k!"<cr>
map <Right> :echo "no! use l!"<cr>

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

"
" Golang setup, based on https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
"
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
