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

filetype plugin on
filetype indent on

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
   Plug 'olimorris/onedarkpro.nvim'
   Plug 'sheerun/vim-polyglot'
   Plug 'lervag/vimtex'
   Plug 'joom/latex-unicoder.vim'
   let g:vimtex_quickfix_enabled = 0
   let g:vimtex_syntax_conceal_disable = 1
   Plug 'whonore/Coqtail'
   " write require('lean').setup{ mappings = true } into ~/.config/nvim/plugin/lean.lua
   Plug 'julian/lean.nvim', {'BufReadPre': '*.lean', 'BufNewFile': '*.lean'}
   Plug 'neovim/nvim-lspconfig'
   Plug 'nvim-lua/plenary.nvim'
   Plug 'kana/vim-textobj-user'
   Plug 'neovimhaskell/nvim-hs.vim'
   Plug 'isovector/cornelis', { 'do': 'stack build', 'tag': '*' }

call plug#end()

colorscheme onedark

set rtp^="/Users/ruri/.opam/default/share/ocp-indent/vim"

" Coqtail binding Alt + jkl
function CoqtailHookDefineMappings()
  imap <buffer> <M-j> <Plug>RocqNext
  imap <buffer> <M-l> <Plug>RocqToLine
  imap <buffer> <M-k> <Plug>RocqUndo
  nmap <buffer> <M-j> <Plug>RocqNext
  nmap <buffer> <M-l> <Plug>RocqToLine
  nmap <buffer> <M-k> <Plug>RocqUndo
endfunction

" latex-unicoder
nnoremap <nowait> <c-z> :call unicoder#start(0)<CR>
inoremap <nowait> <c-z> <Esc>:call unicoder#start(1)<CR>
vnoremap <nowait> <c-z> :<C-u>call unicoder#selection()<CR>
nnoremap <c-x><c-z> <c-z>

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
