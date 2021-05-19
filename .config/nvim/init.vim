" ~/.config/nvim/init.vim


"             _                         _     _ _      
"   ___   ___| |_ _____      ____ _  __| | __| | | ___ 
"  / _ \ / __| __/ _ \ \ /\ / / _` |/ _` |/ _` | |/ _ \
" | (_) | (__| || (_) \ V  V / (_| | (_| | (_| | |  __/
"  \___/ \___|\__\___/ \_/\_/ \__,_|\__,_|\__,_|_|\___|
"                     
     

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File

filetype plugin indent on

set hidden
set noswapfile
set encoding=UTF-8
set exrc
set nobackup
set undodir=~/.vim/undodir
set undofile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual

colorscheme gruvbox

syntax on

set colorcolumn=80 signcolumn=yes
set number relativenumber
set nowrap
set scrolloff=4
set incsearch hlsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing

set backspace=start,eol,indent
set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab autoindent smartindent
set path=.,**,,/usr/include,
set noerrorbells


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion

let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-clangd',
    \ 'coc-rust-analyzer',
    \ 'coc-json',
    \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard shortcuts

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <C-p> :Files<CR>
nmap <silent> <C-s> :Rg<CR>
