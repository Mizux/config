" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
set nocompatible " be iMproved, required
set mouse=a " Use mouse in vim

" Plugins...
call plug#begin()
Plug 'bling/vim-airline' " lean & mean status/tabline
Plug 'flazz/vim-colorschemes' " one colorscheme pack to rule them all!
Plug 'ryanoasis/vim-devicons' " Add icons
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' } " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " git status in NerdTree
Plug 'jlanzarotta/bufexplorer' " Buffer explorer
"Plug 'severin-lemaignan/vim-minimap' " Sublime minimap equivalent
Plug 'preservim/tagbar' " ctags in a window
Plug 'airblade/vim-gitgutter' " shows a git diff/stage/revert using sign column
Plug 'vim-syntastic/syntastic' " Syntax checking hacks

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"Plug 'junegunn/vim-github-dashboard'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" Configuration
set number | set signcolumn=yes | set ruler | set cursorline
set nobackup | set nowritebackup " Some langage servers have issues with backup files
syntax enable | set showmatch
set hlsearch | set hlsearch
set ignorecase | set smartcase
set foldmethod=syntax | set foldlevelstart=99 | set foldenable
let g:xml_syntax_folding=1
let g:sh_fold_enabled=5
set updatetime=300 " default is 4000ms

" Theme
colorscheme mouse | set background=dark | set guifont="DejaVu Sans Mono:h10" | set termguicolors
let s:fontsize = 10
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! DejaVu Sans Mono:h" . s:fontsize
endfunction

nnoremap <silent> <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
nnoremap <silent> <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <silent> <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <silent> <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" Status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto Format
set autoindent | set smartindent
set textwidth=80
set tabstop=2 | set shiftwidth=2 | set softtabstop=2 | set expandtab

" sessions options
set ssop-=options | set ssop-=folds

" Key Binding
nnoremap <silent> <C-e> :Explore<CR> " open built-in TreeExplorer
nnoremap <silent> <C-n> :NERDTreeToggle<CR> " open NerdTree
nnoremap <silent> <C-b> :BufExplorer<CR> " open BufExplorer
nnoremap <silent> <C-t> :TagbarToggle<CR> " open TagBar
"nnoremap <silent> <C-m> :MinimapToggle<CR> " open Minimap

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" NerdTree style
" the ignore patterns are regular expression strings and seprated by comma
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
" disable help line
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
