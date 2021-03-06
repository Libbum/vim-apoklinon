" File:       apoklinon.vim
" Maintainer: Tim DuBois (Libbum)
" URL:        https://github.com/Libbum/vim-apoklinon
" Modified:   19 Apr 2013 07:33 AM AEST
" License:    MIT

" Description:"{{{
" ----------------------------------------------------------------------------
" A dark colorscheme for Vim with divergent colour properties. Designed not to
" be too harsh whilst also not being washed out or lacking in terms of
" pallette. Optimised for 256 colour terminals. So far not tested in gVim, but
" should still be fine.
"
"}}}
" Requirements And Recommendations:"{{{
" ----------------------------------------------------------------------------
" This colourscheme is intended for use on:
"   - gVim 7.3 for Linux, Mac and Windows.
"   - Vim 7.3 for Linux, using a 256 colour enabled terminal.
"
" By default, Vim will use the closest matching cterm equivalent of the RGB
" colours.
"
" However, Due to the limited 256 palette, colours in Vim and gVim will still
" be noticeably different. In order to get a uniform appearance and the way
" that this colourscheme was intended, it is HIGHLY recommended that you:
"
" 1.  Add these colours to ~/.Xresources:
"
"       https://gist.github.com/TODO:ADD GIST LINK
"
" 2.  Use Xresources colours by setting in ~/.vimrc:
"
"       let g:apoklinon_use_Xresources = 1
"       colorscheme apoklinon

"}}}
" Initialisation:"{{{
" ----------------------------------------------------------------------------
if !has("gui_running") && &t_Co < 256
  finish
endif

if !exists("g:apoklinon_use_Xresources")
  let g:apoklinon_use_Xresources = 0
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "apoklinon"

"}}}
" GUI And Cterm Palettes:"{{{
" ----------------------------------------------------------------------------
if has("gui_running")
  let s:vmode      = "gui"
  let s:background = "#1d1f21"  "TODO - these are still hybrid
  let s:dgray       = "#c5c8c6"
  let s:davgray= "#373b41"
  let s:gray        = "#282a2e"
  let s:onyx    = "#707880"
  let s:jazzberry        = "#cc6666"
  let s:orange     = "#de935f"
  let s:sandy     = "#f0c674"
  let s:apple      = "#b5bd68"
  let s:aqua       = "#8abeb7"
  let s:blue       = "#81a2be"
  let s:lavender     = "#b294bb"
  let s:window     = "#303030"
  let s:darkcolumn = "#1c1c1c"
  let s:addbg      = "#5F875F"
  let s:addfg      = "#d7ffaf"
  let s:changebg   = "#5F5F87"
  let s:changefg   = "#d7d7ff"
else
  let s:vmode      = "cterm"
  let s:background = "16"
  let s:window     = "240"
  let s:darkcolumn = "16"
  let s:addbg      = "151"
  let s:addfg      = "192"
  let s:changebg   = "61"
  let s:changefg   = "229"
  if g:apoklinon_use_Xresources == 1
    let s:onyx       = "8"    " Onyx
    let s:jazzberry  = "1"    " Jazzberry Jam
    let s:brick      = "9"    " Brick Red
    let s:orange     = "3"    " Outrageous Orange
    let s:sandy      = "12"   " Sandy Brown
    let s:flavescent = "10"   " Flavescent
    let s:lemon      = "13"   " Lemon Chiffon
    let s:lgray      = "7"    " Light Gray  
    let s:davgray    = "0"    " Davy's Gray 
    let s:lavender   = "5"    " Dark Lavender
    let s:blue       = "4"    " Tufts Blue
    let s:aqua       = "6"    " Medium Aquamarine
    let s:apple      = "2"    " Granny Smith Apple
    let s:khaki      = "11"   " Light Khaki
    let s:gray       = "14"   " Gray=
    let s:dgray      = "15"   " Dark Gray
  else
    let s:onyx       = "235"  " Onyx
    let s:jazzberry  = "125"  " Jazzberry Jam
    let s:brick      = "167"  " Brick Red
    let s:orange     = "203"  " Outrageous Orange
    let s:sandy      = "215"  " Sandy Brown
    let s:flavescent = "222"  " Flavescent
    let s:lemon      = "229"  " Lemon Chiffon
    let s:lgray      = "252"  " Light Gray
    let s:davgray    = "240"  " Davy's Gray 
    let s:lavender   = "61"   " Dark Lavender
    let s:blue       = "67"   " Tufts Blue
    let s:aqua       = "73"   " Medium Aquamarine
    let s:apple      = "151"  " Granny Smith Apple
    let s:khaki      = "192"  " Light Khaki
    let s:gray       = "244"  " Gray=
    let s:dgray      = "248"  " Dark Gray
  endif
endif

"}}}
" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"}}}
" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
exe "let s:bg_none       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_background = ' ".s:vmode."bg=".s:background."'"
exe "let s:bg_window     = ' ".s:vmode."bg=".s:window    ."'"
exe "let s:bg_darkcolumn = ' ".s:vmode."bg=".s:darkcolumn."'"
exe "let s:bg_addbg      = ' ".s:vmode."bg=".s:addbg     ."'"
exe "let s:bg_addfg      = ' ".s:vmode."bg=".s:addfg     ."'"
exe "let s:bg_changebg   = ' ".s:vmode."bg=".s:changebg  ."'"
exe "let s:bg_changefg   = ' ".s:vmode."bg=".s:changefg  ."'"
exe "let s:bg_onyx       = ' ".s:vmode."bg=".s:onyx      ."'"
exe "let s:bg_jazzberry  = ' ".s:vmode."bg=".s:jazzberry ."'"
exe "let s:bg_brick      = ' ".s:vmode."bg=".s:brick     ."'"
exe "let s:bg_orange     = ' ".s:vmode."bg=".s:orange    ."'"
exe "let s:bg_sandy      = ' ".s:vmode."bg=".s:sandy     ."'"
exe "let s:bg_flavescent = ' ".s:vmode."bg=".s:flavescent."'"
exe "let s:bg_lemon      = ' ".s:vmode."bg=".s:lemon     ."'"
exe "let s:bg_lgray      = ' ".s:vmode."bg=".s:lgray     ."'"
exe "let s:bg_davgray    = ' ".s:vmode."bg=".s:davgray   ."'"
exe "let s:bg_lavender   = ' ".s:vmode."bg=".s:lavender  ."'"
exe "let s:bg_blue       = ' ".s:vmode."bg=".s:blue      ."'"
exe "let s:bg_aqua       = ' ".s:vmode."bg=".s:aqua      ."'"
exe "let s:bg_apple      = ' ".s:vmode."bg=".s:apple     ."'"
exe "let s:bg_khaki      = ' ".s:vmode."bg=".s:khaki     ."'"
exe "let s:bg_gray       = ' ".s:vmode."bg=".s:gray      ."'"
exe "let s:bg_dgray      = ' ".s:vmode."bg=".s:dgray     ."'"

exe "let s:fg_none       = ' ".s:vmode."fg=".s:none      ."'"
exe "let s:fg_background = ' ".s:vmode."fg=".s:background."'"
exe "let s:fg_window     = ' ".s:vmode."fg=".s:window    ."'"
exe "let s:fg_darkcolumn = ' ".s:vmode."fg=".s:darkcolumn."'"
exe "let s:fg_addbg      = ' ".s:vmode."fg=".s:addbg     ."'"
exe "let s:fg_addfg      = ' ".s:vmode."fg=".s:addfg     ."'"
exe "let s:fg_changebg   = ' ".s:vmode."fg=".s:changebg  ."'"
exe "let s:fg_changefg   = ' ".s:vmode."fg=".s:changefg  ."'"
exe "let s:fg_onyx       = ' ".s:vmode."fg=".s:onyx      ."'"
exe "let s:fg_jazzberry  = ' ".s:vmode."fg=".s:jazzberry ."'"
exe "let s:fg_brick      = ' ".s:vmode."fg=".s:brick     ."'"
exe "let s:fg_orange     = ' ".s:vmode."fg=".s:orange    ."'"
exe "let s:fg_sandy      = ' ".s:vmode."fg=".s:sandy     ."'"
exe "let s:fg_flavescent = ' ".s:vmode."fg=".s:flavescent."'"
exe "let s:fg_lemon      = ' ".s:vmode."fg=".s:lemon     ."'"
exe "let s:fg_lgray      = ' ".s:vmode."fg=".s:lgray     ."'"
exe "let s:fg_davgray    = ' ".s:vmode."fg=".s:davgray   ."'"
exe "let s:fg_lavender   = ' ".s:vmode."fg=".s:lavender  ."'"
exe "let s:fg_blue       = ' ".s:vmode."fg=".s:blue      ."'"
exe "let s:fg_aqua       = ' ".s:vmode."fg=".s:aqua      ."'"
exe "let s:fg_apple      = ' ".s:vmode."fg=".s:apple     ."'"
exe "let s:fg_khaki      = ' ".s:vmode."fg=".s:khaki     ."'"
exe "let s:fg_gray       = ' ".s:vmode."fg=".s:gray      ."'"
exe "let s:fg_dgray      = ' ".s:vmode."fg=".s:dgray     ."'"

exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

"TODO: Update GUI SETTINGS TOO
if has("gui_running")
  exe "let s:sp_none       = ' guisp=".s:none      ."'"
  exe "let s:sp_foreground = ' guisp=".s:dgray     ."'"
  exe "let s:sp_background = ' guisp=".s:background."'"
  exe "let s:sp_selection  = ' guisp=".s:davgray   ."'"
  exe "let s:sp_line       = ' guisp=".s:gray      ."'"
  exe "let s:sp_comment    = ' guisp=".s:onyx      ."'"
  exe "let s:sp_red        = ' guisp=".s:jazzberry ."'"
  exe "let s:sp_orange     = ' guisp=".s:orange    ."'"
  exe "let s:sp_yellow     = ' guisp=".s:sandy     ."'"
  exe "let s:sp_green      = ' guisp=".s:apple     ."'"
  exe "let s:sp_aqua       = ' guisp=".s:aqua      ."'"
  exe "let s:sp_blue       = ' guisp=".s:blue      ."'"
  exe "let s:sp_purple     = ' guisp=".s:lavender  ."'"
  exe "let s:sp_window     = ' guisp=".s:window    ."'"
  exe "let s:sp_addbg      = ' guisp=".s:addbg     ."'"
  exe "let s:sp_addfg      = ' guisp=".s:addfg     ."'"
  exe "let s:sp_changebg   = ' guisp=".s:changebg  ."'"
  exe "let s:sp_changefg   = ' guisp=".s:changefg  ."'"
else
  let s:sp_none       = ""
  let s:sp_foreground = ""
  let s:sp_background = ""
  let s:sp_selection  = ""
  let s:sp_line       = ""
  let s:sp_comment    = ""
  let s:sp_red        = ""
  let s:sp_orange     = ""
  let s:sp_yellow     = ""
  let s:sp_green      = ""
  let s:sp_aqua       = ""
  let s:sp_blue       = ""
  let s:sp_purple     = ""
  let s:sp_window     = ""
  let s:sp_addbg      = ""
  let s:sp_addfg      = ""
  let s:sp_changebg   = ""
  let s:sp_changefg   = ""
endif

"}}}
" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_onyx        .s:fmt_none
exe "hi! Conceal"       .s:fg_flavescent  .s:bg_none        .s:fmt_none
"		Conceal"
"		Cursor"
"		CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_onyx        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_onyx        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_brick       .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_brick       .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_davgray     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_none        .s:fmt_none
"		Incsearch"
exe "hi! LineNr"        .s:fg_davgray     .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_flavescent  .s:bg_none        .s:fmt_bold
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_apple       .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_apple       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_dgray       .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_lgray       .s:bg_dgray       .s:fmt_none
exe "hi! PmenuSel"      .s:fg_lgray       .s:bg_dgray       .s:fmt_revr
"		PmenuSbar"
"		PmenuThumb"
exe "hi! Question"      .s:fg_apple       .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_orange      .s:bg_dgray       .s:fmt_none
exe "hi! SpecialKey"    .s:fg_dgray       .s:bg_none        .s:fmt_none
exe "hi! SpellBad"      .s:fg_jazzberry   .s:bg_none        .s:fmt_undr
exe "hi! SpellCap"      .s:fg_blue        .s:bg_none        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_none        .s:fmt_undr
exe "hi! SpellRare"     .s:fg_lavender    .s:bg_none        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_davgray     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_davgray     .s:fmt_revr
exe "hi! TabLine"       .s:fg_lgray       .s:bg_darkcolumn  .s:fmt_revr
"		TabLineFill"
"		TabLineSel"
exe "hi! Title"         .s:fg_flavescent  .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_dgray       .s:fmt_none
"		VisualNos"
exe "hi! WarningMsg"    .s:fg_jazzberry   .s:bg_none        .s:fmt_none
"		WildMenu"

exe "hi! Normal"        .s:fg_lgray       .s:bg_none        .s:fmt_none

"}}}
" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_davgray     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_jazzberry   .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_aqua        .s:bg_none        .s:fmt_none
"		Character"
"		Number"
"		Boolean"
"		Float"

exe "hi! Identifier"      .s:fg_lavender    .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_sandy       .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_blue        .s:bg_none        .s:fmt_none
"		Conditional"
"		Repeat"
"		Label"
exe "hi! Operator"        .s:fg_brick       .s:bg_none        .s:fmt_none
"		Keyword"
"		Exception"

exe "hi! PreProc"         .s:fg_lemon       .s:bg_none        .s:fmt_none
"		Include"
"		Define"
"		Macro"
"		PreCondit"

exe "hi! Type"            .s:fg_brick       .s:bg_none        .s:fmt_none
"		StorageClass"
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
"		Typedef"

exe "hi! Special"         .s:fg_apple       .s:bg_none        .s:fmt_none
"		SpecialChar"
"		Tag"
"		Delimiter"
"		SpecialComment"
"		Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_undr

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_jazzberry   .s:bg_onyx        .s:fmt_revr

exe "hi! Todo"            .s:fg_brick       .s:bg_none        .s:fmt_bold

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_flavescent  .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"		diffOldFile
"		diffNewFile
"		diffFile
"		diffOnly
"		diffIdentical
"		diffDiffer
"		diffBDiffer
"		diffIsA
"		diffNoEOL
"		diffCommon
hi! link diffRemoved Constant
"		diffChanged
hi! link diffAdded Special
"		diffLine
"		diffSubname
"		diffComment

"}}}
" Legal:"{{{
" ----------------------------------------------------------------------------
" Copyright (c) 2011 Ethan Schoonover
" Copyright (c) 2009-2012 NanoTech
" Copyright (c) 2012 w0ng
" Copyright (c) 2012 Libbum
" 
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation files (the “Software”), to deal in the Soft‐
" ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software, and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice and this permission notice
" shall be included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

" }}}
