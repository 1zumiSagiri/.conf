autocmd! bufwritepost .vimrc source ~/.vimrc
:set ttimeoutlen=0
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTree<CR>
au! BufNewFile,BufRead *.t,*.CPP setf cpp
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

set rtp^="/Users/ruri/.opam/default/share/ocp-indent/vim"

" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

" Use system clipboard automatically (if available)
set clipboard=unnamedplus
" Copy visual selection with Ctrl+C
vnoremap <C-c> "+y
" Cut visual selection with Ctrl+X
vnoremap <C-x> "+d
" Paste in normal and visual mode with Ctrl+V
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP
