" Disable vi emulation
set nocompatible
" Use mouse in vim
set mouse=a

colorscheme mustang
set background=dark
set guifont=DejaVu\ Sans\ Mono\ 8

" Line Number
set number
" Show cursor line
set cursorline
" Set Text Width
set textwidth=80

" Set syntax
syntax on
" Show corresponding parentheses
set showmatch
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

" Fold
set foldmethod=syntax " (fdm) creates a fold for every level of indentation
set foldlevelstart=99 " (fdl) when file is opened, don't close any folds
set foldenable " (fen) enables or disables folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Session management
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Remove trailing whitespace
function! CleanWhiteSpace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown\|perl'
    return
  endif
  let _s=@/
  let l = line(".")
  let c = col(".")
  :%s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction()

" Remove trailing whitespaces when saving:
autocmd bufwritepre * call CleanWhiteSpace()

" Usual include path
set path+=.;

" Nerd Tree
nmap <silent> <c-n> :NERDTreeToggle<CR>

" CTags Completion (C-F12 generate, F12 open TagBar)
set tags=./tags;
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
nmap <F12> :TagbarToggle<CR>
" Completion Menu
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest,preview
" Limit popup menu height
set pumheight=16
" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType="context"

" Clang Complete
"Disable auto popup, use <Tab> to autocomplete
"if equal to 1, automatically complete after '->', '.', '::'
let g:clang_complete_auto = 0
"if equal to 1, open quickfix window on error.
let g:clang_complete_copen=1
"if equal to 1, it will highlight the warnings and errors the
let g:clang_hl_errors=1
" if equal to 1, it will periodically update the quickfix window
let g:clang_periodic_quickfix=0
" if equal to 1, it will do some snippets magic by completing function arguments.
let g:clang_snippets=0
" if equal to 1, vim will use vim 7.3 conceal feature to hide <# and #> which delimit a snippets.
let g:clang_conceal_snippets=1

" load Doxygen syntax per default
au BufNewFile,BufRead *.cu set filetype=cuda.doxygen
au BufNewFile,BufRead *.dox set filetype=doxygen
let g:load_doxygen_syntax = 1
let g:doxygen_enhanced_colour = 0
let doxygen_my_rendering = 0
let doxygen_javadoc_autobrief = 1
let doxygen_end_punctuation = '[.]'
