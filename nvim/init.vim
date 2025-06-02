" ~/.config/nvim/init.vim
set nocompatible
set clipboard=unnamedplus
set number
set cursorline
syntax on
set backspace=2 
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set vb
set mouse=a
set ttimeoutlen=0

autocmd BufNewFile,BufRead *.t,*.CPP setfiletype cpp

nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTree<CR>

vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP

call plug#begin()

   Plug 'scrooloose/nerdtree'
   Plug 'jistr/vim-nerdtree-tabs'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'jiangmiao/auto-pairs'
   Plug 'Yggdroot/indentLine'
   let g:indent_guides_guide_size = 1  
   let g:indent_guides_start_level = 2
   Plug 'scrooloose/nerdcommenter'
   Plug 'luochen1990/rainbow'
   Plug 'preservim/tagbar'
   let g:ale_disable_lsp  = 1
   Plug 'dense-analysis/ale'
   Plug 'ocaml/vim-ocaml'
   Plug 'navarasu/onedark.nvim'
   Plug 'lervag/vimtex'
   let g:vimtex_quickfix_enabled = 0

call plug#end()

colorscheme onedark

set rtp^="/Users/ruri/.opam/default/share/ocp-indent/vim"
