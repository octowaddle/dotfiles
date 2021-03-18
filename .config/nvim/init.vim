" .config/nvim/init.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options

" Line numbers
set relativenumber
set number

" Scroll
set scrolloff=4

" Tab indent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Columns
set colorcolumn=80
set signcolumn=yes

" Text wrap
set nowrap

" Search
set nohlsearch
set incsearch

" History
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Colorscheme
colorscheme gruvbox

" Other
set encoding=UTF-8
set exrc
set noerrorbells
set hidden
filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings

let mapleader = " "
nmap <S-t> :botright terminal<CR>
nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <C-p> :Files<CR>
nmap <C-s> :Rg<CR>
nmap <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure plugins

" Plugin coc
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-clangd',
    \ 'coc-rust-analyzer',
    \ ]

" Plugin NERDcommenter
let g:NERDCreateDefaultMappinigs = 1
