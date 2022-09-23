set nocompatible " be iMproved, required
set mouse=a " Use mouse in vim

" Plugins...
call plug#begin()
Plug 'bling/vim-airline' " lean & mean status/tabline
Plug 'flazz/vim-colorschemes' " one colorscheme pack to rule them all!
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' } " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " git status in NerdTree
Plug 'jlanzarotta/bufexplorer' " Buffer explorer
Plug 'preservim/tagbar' " ctags in a window
Plug 'airblade/vim-gitgutter' " shows a git diff/stage/revert using sign column
Plug 'vim-syntastic/syntastic' " Syntax checking hacks

"Plug 'junegunn/vim-github-dashboard'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" Remove trailing whitespace
function! CleanWhiteSpace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown\|perl\|diff'
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

" Configuration
colorscheme mouse | set background=dark | set termguicolors
set number | set ruler | set cursorline | set textwidth=80
syntax enable | set showmatch | set hlsearch | set hlsearch | set ignorecase | set smartcase
set autoindent | set smartindent | set tabstop=2 | set shiftwidth=2 | set softtabstop=2 | set expandtab
set foldmethod=syntax | set foldlevelstart=99 | set foldenable
let g:xml_syntax_folding=1
let g:sh_fold_enabled=5
" sessions options
set ssop-=options | set ssop-=folds

nnoremap <silent> <C-e> :Explore<CR> " open built-in TreeExplorer
nnoremap <silent> <C-n> :NERDTreeToggle<CR> " open NerdTree
nnoremap <silent> <c-b> :BufExplorer<cr> " open BufExplorer
nnoremap <silent> <C-t> :TagbarToggle<cr> " open TagBar

" the ignore patterns are regular expression strings and seprated by comma
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
let NERDTreeMinimalUI = 1
" augroup nerdtree_open
"     autocmd!
"     autocmd VimEnter * NERDTree | wincmd p
" augroup END

" load Doxygen syntax per default
au BufNewFile,BufRead *.dox set filetype=doxygen
let g:load_doxygen_syntax = 1
let g:doxygen_enhanced_colour = 0
let doxygen_my_rendering = 1
let doxygen_javadoc_autobrief = 0
let doxygen_end_punctuation = '[.]'
" SVG load xml syntax for indentation
au BufNewFile,BufRead *.svg set filetype=xml
" SWIG load swig syntax for indentation
au BufNewFile,BufRead *.i set filetype=swig
" .NET load xml syntax for indentation
au BufNewFile,BufRead *.fsproj set filetype=xml
