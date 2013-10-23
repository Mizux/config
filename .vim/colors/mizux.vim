" Vim color file
" Maintainer:	Corentin "Mizux" LE MOLGAT <webmaster@mizux.net>
" Last Change:	$Date: 2009/05/29 00:00:00 $
" URL: http://www.mizux.net $
" Version:	$Id: mizux.vim,v1.0 2009/05/29 00:00:00 $

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif

let g:colors_name = "mizux"

" Gui version GVIM
" Default Colors
hi Normal	 guifg=#a0a0a0 guibg=#101010 
hi NonText guifg=#005bc0 guibg=#202020 gui=none
hi Cursor	 guifg=#101010 guibg=#d3d7cf 
hi lCursor guifg=#101010 guibg=#d3d7cf 

" Search
hi Search			guifg=#101010	guibg=#b0b020 gui=bold
hi IncSearch	guifg=#101010	guibg=#00c050	gui=bold

" Window Elements
hi StatusLine		guifg=#a0a0a0 guibg=#103858 gui=none
hi StatusLineNC	guifg=#a0a0a0 guibg=#202020 gui=none
hi VertSplit		guifg=#a0a0a0 guibg=#103858 gui=none
hi Folded				guifg=#ffff00 guibg=#002030 gui=none
hi Visual				guifg=#c0c0c0 guibg=#103858 gui=none

" Specials
hi Todo		guifg=#b00000 guibg=#101010 gui=bold
hi Title	guifg=#202020 guibg=#80ff00	gui=bold

" Syntax
hi PreProc		guifg=#005bc0		gui=bold
hi Type				guifg=#005bc0		gui=bold
hi Special		guifg=#005bc0		gui=bold
hi Structure  guifg=#00c05b   gui=bold
hi Statement	guifg=#dddddd		gui=bold
hi Identifier	guifg=#dddddd		gui=bold
hi doxygenParamName guifg=#a0a0a0 gui=none
" Values
hi Constant		guifg=#00c05b		gui=bold
hi Number			guifg=#b0b020		gui=bold
hi Float			guifg=#b05620		gui=bold
" Code comment
hi Comment		guifg=#505050		gui=none

" Diff
hi DiffChange guifg=#000000 guibg=#502020 gui=none
hi DiffText   guifg=#ffffff guibg=#502020 gui=none
hi DiffAdd    guifg=#ffffff guibg=#205020 gui=none
hi DiffDelete guifg=#101010 guibg=#202020 gui=none											 

" Misc
hi ErrorMsg   guifg=#f0f0f0 guibg=#f00000

" Completion Menu 
hi Pmenu      guifg=#a0a0a0 guibg=#000000
hi PmenuSel   guifg=#c0c0c0 guibg=#103858 
hi PmenuThumb guifg=#c0c000 guibg=bg
hi PmenuSbar  guifg=fg      guibg=#202020

" Cterm version VIM
" Default Colors
hi Normal	 ctermfg=GREY ctermbg=BLACK
hi NonText ctermfg=BLUE ctermbg=GREY  cterm=none
hi Cursor	 ctermfg=GREY ctermbg=WHITE
hi lCursor ctermfg=GREY ctermbg=WHITE

" Search
hi Search			ctermfg=BLACK	ctermbg=YELLOW cterm=bold
hi IncSearch	ctermfg=BLACK	ctermbg=GREEN	  cterm=bold

" Window Elements
hi StatusLine		ctermfg=WHITE  ctermbg=BLUE cterm=none
hi StatusLineNC	ctermfg=BLACK  ctermbg=GREY cterm=none
hi VertSplit		ctermfg=WHITE  ctermbg=BLUE cterm=none
hi Folded				ctermfg=YELLOW ctermbg=BLUE cterm=none
hi Visual				ctermfg=WHITE  ctermbg=BLUE cterm=none

" Specials
hi Todo		ctermfg=BLACK ctermbg=YELLOW cterm=bold
hi Title	ctermfg=BLACK ctermbg=YELLOW cterm=bold

" Syntax
hi PreProc		ctermfg=BLUE  cterm=bold
hi Type				ctermfg=BLUE  cterm=bold
hi Special		ctermfg=BLUE  cterm=bold
hi Statement	ctermfg=WHITE cterm=bold
hi Identifier	ctermfg=WHITE cterm=bold
" Values
hi Constant		ctermfg=GREEN  cterm=bold
hi Number			ctermfg=YELLOW cterm=bold
hi Float			ctermfg=YELLOW cterm=bold
" Code Comment
hi Comment		ctermbg=DARKRED	ctermfg=BLACK cterm=italic

" Diff
hi DiffChange ctermfg=GREY  ctermbg=RED cterm=none
hi DiffText   ctermfg=YELLOW ctermbg=RED cterm=none
hi DiffAdd    ctermfg=WHITE ctermbg=GREEN cterm=none
hi DiffDelete ctermfg=BLUE  ctermbg=GREY cterm=none

" Misc
hi ErrorMsg   ctermfg=WHITE ctermbg=RED

" Completion Menu
hi Pmenu      ctermfg=LIGHTGREY ctermbg=BLACK
hi PmenuSel   ctermfg=WHITE ctermbg=BLUE
hi PmenuThumb ctermfg=YELLOW ctermbg=bg
hi PmenuSbar  ctermfg=fg      ctermbg=DARKGREY

