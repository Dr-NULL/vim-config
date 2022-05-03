" Deshabilitar alertas de compatiblidad
let g:coc_disable_startup_warning = 1 
 
" CONFIGURACIONES VISUALES GENERALES
set encoding=utf-8          " Usar codificación UTF-8
set clipboard=unnamedplus   " Habilitar portapapeles
set number                  " Habilitar números de línea
set nowrap                  " Deshabilitar desdoblamiento de líneas
set expandtab               " Reemplazar tabulaciones por espacios
set tabstop=4               " Espacios de tabulación (insertar)
set softtabstop=4           " Espacios de tabulación (borrar)
set shiftwidth=4            " Espacio de indentación
set cursorline              " Mostrar una línea con el cursor actual
set autoindent
set copyindent
syntax on                                           " Habilitar coloreado de sintaxis

" Configuración del explorador de archivos
" let g:netrw_liststyle = 3                           " Mostrar la vista de árbol por defecto
" let g:netrw_banner = 0                              " Ocultar banner
" let g:netrw_winsize = 25                            " Tamaño fijo del explorador
" let g:netrw_browse_split = 4

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Evitar que windows sustituya la funci??n original del ctrl + v
if has('win32')
  noremap <C-V> <C-V>
endif

" Iniciar gestor de paquetes
call plug#begin()
  Plug 'preservim/nerdcommenter'                    " Comentar/descomentar código
  Plug 'preservim/nerdtree'                         " Explorador de archivos
  Plug 'pangloss/vim-javascript'                    " JavaScript support
  Plug 'leafgarland/typescript-vim'                 " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'                   " JS and JSX syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Syntax checking server
call plug#end()

" Configuración de NERDTree
" --------------------------------------------------------------------------------
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Configurar NERDTree
let NERDTreeWinSize     = 40    " Setear tamaño por defecto
let NERDTreeShowHidden  = 1     " Mostrar archivos/carpetas ocultos

" Configuración del typechecking
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
