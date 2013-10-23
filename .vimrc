" Disable vi emulation
set nocompatible
" Use mouse in vim
set mouse=a

" Theme
colorscheme mustang
set background=dark
" Show cursor line
set cursorline
" Set default font
set guifont=DejaVu\ Sans\ Mono\ 8

" Set syntax
syntax on
" Show corresponding parentheses
set showmatch
" Line Number
set number
" Set Text Width
set textwidth=80

" Highlight Pattern Search
set hlsearch
" Ignore Case for lowercase search
set ignorecase
" Reuse Case sensitive search when search contains Uppercase
set smartcase

" Set indentation
filetype plugin indent on
" Set autoindent
set autoindent
" Set automatic C type indentation
set smartindent
" Sets the tab stop to 2 spaces
set tabstop=2
" Shift width, nb of spaces for auto indentation
set shiftwidth=2
" Set Expand Tab to Space
set expandtab

" Remove trailing whitespace
function! CleanWhiteSpace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  :%s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction()
command! -nargs=0 CleanWhiteSpace :call CleanWhiteSpace()
" Remove trailing whitespaces when saving:
autocmd bufwritepre * :CleanWhiteSpace

" Fold
set foldmethod=syntax " (fdm) creates a fold for every level of indentation
set foldlevelstart=99 " (fdl) when file is opened, don't close any folds
set foldenable " (fen) enables or disables folding

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Usual include path
set path+=.;

" load Doxygen syntax per default
au BufNewFile,BufRead *.cu set filetype=cuda.doxygen
au BufNewFile,BufRead *.dox set filetype=doxygen
