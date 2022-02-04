" Deshabilitar alertas de compatiblidad                                                                                                                                                                 2 let g:coc_disable_startup_warning = 1

" CONFIGURACIONES VISUALES GENERALES
set encoding=utf-8          " Usar codificación UTF-8
set clipboard=unnamedplus   " Habilitar portapapeles
set number                  " Habilitar números de línea
set nowrap                  " Deshabilitar desdoblamiento de líneas
set expandtab               " Reemplazar tabulaciones por espacios
set tabstop=2               " Espacios de tabulación (insertar)
set softtabstop=2           " Espacios de tabulación (borrar)
set shiftwidth=2            " Espacio de indentación
set cursorline              " Mostrar una línea con el cursor actual
set autoindent
set copyindent
syntax on             " Habilitar coloreado de sintaxis

" Evitar que windows sustituya la función original del ctrl + v
if has('win32')
  noremap <C-V> <C-V>
endif

" Iniciar gestor de paquetes
call plug#begin()
  Plug 'preservim/nerdcommenter'                    " Comentar/descomentar código
  Plug 'pangloss/vim-javascript'                    " JavaScript support
  Plug 'leafgarland/typescript-vim'                 " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'                   " JS and JSX syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Syntax checking server
call plug#end()

" Configuraci??n del typechecking
" --------------------------------------------------------------------------------
set cmdheight=2
set updatetime=300
set shortmess+=c

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
