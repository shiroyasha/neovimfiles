local Plug = vim.fn['plug#']

vim.call('plug#begin', "/home/dev/.config/nvim/plugged")

Plug('nvim-lua/plenary.nvim')

Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')

Plug('bluz71/vim-nightfly-colors', {as = 'nightfly' })
Plug('christoomey/vim-tmux-navigator')
Plug('szw/vim-maximizer')

Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')

-- Plug 'Shougo/unite.vim'
-- Plug 'Shougo/vimfiler.vim'
-- Plug 'AndrewRadev/splitjoin.vim'
-- Plug 'danchoi/ri.vim'
-- Plug 'danro/rename.vim'
-- Plug 'godlygeek/tabular'
-- Plug 'isRuslan/vim-es6'
-- Plug 'shiroyasha/make-test'
-- Plug 'kana/vim-textobj-user'
-- Plug 'kien/ctrlp.vim'
-- Plug 'rking/ag.vim'
-- Plug 'nelstrom/vim-textobj-rubyblock'
-- Plug 'neomake/neomake'
-- Plug 'rainerborene/vim-reek'
-- Plug 'sheerun/vim-polyglot'
-- Plug 'tpope/vim-endwise'
-- Plug 'tpope/vim-fugitive'
-- Plug 'tpope/vim-rails'
-- Plug 'tpope/vim-repeat'
-- Plug 'tpope/vim-surround'
-- Plug 'vim-airline/vim-airline'
-- Plug 'thisivan/vim-bufexplorer'
-- Plug 'tpope/vim-dispatch'
-- Plug 'elixir-editors/vim-elixir'
-- Plug 'renderedtext/vim-elixir-alternativ-files'
-- Plug 'fatih/vim-go'
-- Plug 'shiroyasha/make-test'
-- Plug 'mhinz/vim-mix-format'
-- Plug 'github/copilot.vim'
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'hrsh7th/cmp-nvim-lsp', { 'branch' = 'main' }
-- Plug 'hrsh7th/cmp-buffer', { 'branch' = 'main' }
-- Plug 'hrsh7th/cmp-path', { 'branch' = 'main' }
-- Plug 'hrsh7th/cmp-cmdline', { 'branch' = 'main' }
-- Plug 'hrsh7th/nvim-cmp', { 'branch' = 'main' }
-- Plug 'neoclide/coc.nvim', { 'branch' = 'release'}

vim.call('plug#end')
