autocmd! bufwritepost .vimrc source ~/.vimrc
:set ttimeoutlen=0
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTree<CR>
au! BufNewFile,BufRead *.t,*.CPP setf cpp
syntax on
:set nu
:set cursorline
:syntax on
:set backspace=2 
:set ts=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab
:set autoindent
:set smartindent
:set cindent
:set vb

call plug#begin()

   Plug 'scrooloose/nerdtree'
   Plug 'jistr/vim-nerdtree-tabs'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'jiangmiao/auto-pairs'
   Plug 'Yggdroot/indentLine'
   let g:indent_guides_guide_size            = 1  
   let g:indent_guides_start_level           = 2
   Plug 'scrooloose/nerdcommenter'
   Plug 'luochen1990/rainbow'
   Plug 'preservim/tagbar'
   let g:ale_disable_lsp  =  1
   Plug 'dense-analysis/ale'
   Plug 'ocaml/vim-ocaml'

call plug#end()

set rtp^="/Users/miniv/.opam/default/share/ocp-indent/vim"
