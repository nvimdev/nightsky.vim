" Name:       nightsky.vim
" Version:    0.1.0
" Maintainer: glepnir <https://github.com/glepnir>
" License:    The MIT License (MIT)
"
" A minimal colour scheme for Vim and Neovim
hi clear

let g:colors_name = 'nightsky'
set background=dark
let s:background = &background

let s:p = #{
      \  bg : '#141821',
      \  bg_float: '#14131f',
      \  bg_dim : '#1c202e',
      \  bg_alt : '#222738',
      \  fg :     '#cccccc',
      \  fg_dim : '#989898',
      \  fg_alt : '#75715E',
      \  red :    '#ff5f59',
      \  wine:    '#B05279',
      \  orange : '#cc853d',
      \  yellow : '#ccad52',
      \  green :  '#9eb336',
      \  cyan :   '#52bccc',
      \  blue :   '#5c95e6',
      \  purple : '#9884c4',
      \  teal :   '#47b38f',
      \  none:    'NONE',
      \}

let g:terminal_color_0 = s:p.bg
let g:terminal_color_1 = s:p.red
let g:terminal_color_2 = s:p.green
let g:terminal_color_3 = s:p.yellow
let g:terminal_color_4 = s:p.blue
let g:terminal_color_5 = s:p.purple
let g:terminal_color_6 = s:p.cyan
let g:terminal_color_7 = s:p.fg
let g:terminal_color_8 = s:p.fg_dim
let g:terminal_color_9 = s:p.red
let g:terminal_color_10 = s:p.green
let g:terminal_color_11 = s:p.yellow
let g:terminal_color_12 = s:p.blue
let g:terminal_color_13 = s:p.purple
let g:terminal_color_14 = s:p.cyan
let g:terminal_color_15 = s:p.fg

for key in keys(s:p)
  let {'s:fg_' . key} = ' guifg='.s:p[key] .' gui=NONE '
  let {'s:bg_' . key} = ' guibg='.s:p[key]
endfor

exe 'hi Normal' . s:fg_fg . s:bg_bg
"signcolumn
exe 'hi SignColumn' . s:bg_bg
"buffer
hi LineNr guifg=#272d40
exe 'hi EndOfBuffer'. s:fg_bg . s:bg_none
exe 'hi Search'. s:fg_yellow . 'gui=reverse'
exe 'hi Visual' s:bg_bg_alt
exe 'hi ColorColumn'. s:bg_bg_alt
exe 'hi Whitespace'. s:fg_bg_alt
"window
exe 'hi VertSplit' . s:fg_bg_alt
exe 'hi Title' . s:fg_orange .'gui=bold'
"cursorline
exe 'hi Cursorline' .s:bg_bg_dim
exe 'hi CursorLineNr' . s:fg_fg
"pmenu
exe 'hi Pmenu ' . s:bg_bg_float .s:fg_fg_dim
exe 'hi PmenuSel guibg=#222038 ' . s:fg_teal
exe 'hi PmenuSbar guifg=#586e75'
exe 'hi PmenuKind ' . s:bg_bg_float . s:fg_yellow
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtra Pmenu
hi! link PmenuExtraSel PmenuSel
hi! link WildMenu Pmenu
"statusline
exe 'hi StatusLine' .s:fg_fg_dim . s:bg_bg_float. ' gui=bold cterm=none'
exe 'hi StatusLineNC' . s:fg_fg_dim .s:bg_bg_float
exe 'hi WinBar' .s:bg_none
exe 'hi WinBarNC' . s:bg_none
exe 'hi WinSeparator' . s:bg_bg . s:fg_bg_dim
"Error
exe 'hi Error' . s:fg_red . 'gui=bold guibg=NONE'
hi! link ErrorMsg Error
"Markup
exe 'hi TODO' . s:fg_cyan
exe 'hi Conceal' . s:fg_blue .. ' guibg=NONE'
hi! link  NonText Comment
"Float
exe 'hi FloatBorder' . s:fg_blue
exe 'hi NormalFloat' . s:bg_bg_float . s:fg_fg
"Fold
exe 'hi Folded' . s:fg_bg .'gui=bold'
hi! link FoldColumn SignColumn
"Spell
exe 'hi SpellBad' . s:fg_red
exe 'hi SpellCap' .  ' gui=undercurl guisp='. s:p.red
exe 'hi SpellRare' .  ' gui=undercurl guisp='.s:fg_purple
exe 'hi SpellLocal' .  ' gui=undercurl'
"Msg
exe 'hi WarningMsg' . s:fg_red
exe 'hi MoreMsg' . s:fg_green
"Internal
exe 'hi NvimInternalError' . s:fg_red
exe 'hi Directory' . s:fg_blue
"------------------------------------------------------
"-
"-@Langauge Relate
"-@Identifier
exe 'hi Identifier' . s:fg_blue
" various variable names
exe 'hi @variable' . s:fg_fg
" built-in variable names (e.g. `this`)
exe 'hi @variable.builtin' . s:fg_fg
" function paramter
exe 'hi @variable.paramter' . s:fg_fg
" link to field
exe 'hi @variable.member' . s:fg_cyan
exe 'hi Constant' . s:fg_orange
hi! link @constant.builtin   Constant
" constants defined by the preprocessor
hi! link @constant.macro Constant
"modules or namespaces
exe 'hi @namespace' . s:fg_cyan
"symbols or atoms
" ['@symbol'] = exe},
"------------------------------------------------------
"if else
exe 'hi Conditional' . s:fg_wine
"for while
hi! link Repeat Conditional
"-@fg_Keywords
exe 'hi Keyword' . s:fg_green
hi! link  @keyword.function Keyword
hi! link  @keyword.return   Keyword
hi! link  @keyword.operator Operator
hi! link  @keyword.import   PreProc
hi! link  @keyword.conditional  Conditional
hi! link  @keyword.repeat  Conditional
"for attribute
hi! link @attribute Keyword

exe 'hi Debug' . s:fg_orange
exe 'hi Label' . s:fg_purple
exe 'hi PreProc' . s:fg_purple
hi! link Include  PreProc
exe 'hi Exception' . s:fg_purple
exe 'hi Statement' . s:fg_purple
exe 'hi SpecialKey' . s:fg_orange
exe 'hi Special' . s:fg_orange
"------------------------------------------------------
"-@Types
exe 'hi Type' . s:fg_yellow
hi! link @type.builtin Type
"type definitions (e.g. `typedef` in C)
hi! link @type.definition Type
"type qualifiers (e.g. `const`)
hi! link @type.qualifier KeyWord
"modifiers that affect storage in memory or life-time like C `static`
hi! link @storageclass Keyword
exe 'hi @field' . s:fg_cyan
hi! link @property @field
"------------------------------------------------------
"-@Functions
exe 'hi Function' . s:fg_blue
"built-in functions
hi! link  @function.builtin Function
"function calls
hi! link @function.call Function
"preprocessor macros
hi! link @function.macro Function
hi! link @method Function
hi! link @method.call Function
" exe 'hi @constructor' . s:fg_n_orange
hi! link @parameter @variable
"------------------------------------------------------
"-@Literals
exe 'hi String' . s:fg_teal
exe 'hi Number' . s:fg_purple
hi! link Float Number
hi! link Boolean Constant
"
hi! link Define PreProc
exe 'hi Operator' . s:fg_fg_dim
hi Comment guifg=#3d4966
"------------------------------------------------------
"-@punctuation
exe 'hi @punctuation.bracket' . s:fg_fg_dim
exe 'hi @punctuation.delimiter' . s:fg_fg_dim
"------------------------------------------------------
"-@Tag
exe 'hi @tag.html' . s:fg_orange
hi! link  @tag.attribute.html @property
hi! link  @tag.delimiter.html @punctuation.delimiter
hi! link  @tag.javascript @tag.html
hi! link  @tag.attribute.javascript @tag.attribute.html
hi! link  @tag.delimiter.javascript @tag.delimiter.html
hi! link  @tag.typescript @tag.html
hi! link  @tag.attribute.typescript @tag.attribute.html
hi! link  @tag.delimiter.typescript @tag.delimiter.html
"------------------------------------------------------
"-@Markdown
exe 'hi @text.reference.markdown_inline' . s:fg_blue
"-@Diff
exe 'hi DiffAdd' . s:fg_teal  . ' guibg=NONE'
exe 'hi DiffChange' . s:fg_blue
exe 'hi DiffDelete' . s:fg_orange
exe 'hi DiffText' . s:fg_orange
hi! link @text.diff.add.diff DiffAdd
hi! link @text.diff.delete.diff DiffDelete
hi! link @text.diff.change.diff DiffChange
"------------------------------------------------------
"-@Diagnostic
exe 'hi DiagnosticError'. s:fg_red
exe 'hi DiagnosticWarn' . s:fg_yellow
exe 'hi DiagnosticInfo' . s:fg_blue
exe 'hi DiagnosticHint' . s:fg_cyan
hi! link  DiagnosticSignError DiagnosticError
hi! link  DiagnosticSignWarn DiagnosticWarn
hi! link  DiagnosticSignInfo DiagnosticInfo
hi! link  DiagnosticSignHint DiagnosticHint
exe 'hi DiagnosticUnderlineError' .  ' gui=undercurl guisp=' . s:p["red"]
exe 'hi DiagnosticUnderlineWarn' .  ' gui=undercurl  guisp=' . s:p["yellow"]
exe 'hi DiagnosticUnderlineInfo' .  ' gui=undercurl  guisp=' . s:p["blue"]
exe 'hi DiagnosticUnderlineHint' .  ' gui=undercurl  guisp=' . s:p["cyan"]
"-@plugin
exe 'hi GitGutterAdd' . s:fg_teal
exe 'hi GitGutterChange' . s:fg_blue
exe 'hi GitGutterDelete' . s:fg_red
exe 'hi GitGutterChangeDelete' . s:fg_red
"dashboard
exe 'hi DashboardHeader' . s:fg_green
hi! link DashboardFooter Comment
exe 'hi DashboardProjectTitle' . s:fg_yellow .' gui=bold'
exe 'hi DashboardProjectTitleIcon' . s:fg_purple
exe 'hi DashboardProjectIcon' . s:fg_blue
hi! link  DashboardMruTitle DashboardProjectTitle
hi! link  DashboardMruIcon DashboardProjectTitleIcon
exe 'hi DashboardFiles' . s:fg_fg_alt
hi! link DashboardShortCut Comment
hi! link DashboardShortCutIcon @field
"Telescope
exe 'hi TelescopePromptBorder' .s:bg_bg_alt . s:fg_bg_alt
exe 'hi TelescopePromptNormal' .s:bg_bg_alt . s:fg_orange
exe 'hi TelescopeResultsBorder' .s:bg_bg_alt . s:fg_bg_alt
exe 'hi TelescopePreviewBorder' .s:bg_bg_alt . s:fg_bg_alt
exe 'hi TelescopeResultsNormal' . s:fg_fg
exe 'hi TelescopeSelectionCaret' . s:fg_yellow
exe 'hi TelescopeMatching' . s:fg_yellow
"CursorWord
exe 'hi CursorWord' .s:bg_bg_alt
exe 'hi IndentLine' .s:fg_bg_alt
exe 'hi IndentLineCurrent' . ' guifg=#5a647e'
"Lspsaga
exe 'hi SagaVariable' . s:fg_green
"Rapid
exe 'hi RapidFinished' .s:fg_red . ' gui=bold'
exe 'hi RapidTake' .s:fg_purple . ' gui=bold'
exe 'hi RapidDate' .s:fg_purple . ' gui=bold'
exe 'hi RapidFile' . s:fg_blue . ' gui=bold'
exe 'hi RapidTargetPos' . s:fg_teal . ' gui=bold'

"lsp relate
exe 'hi LspSignatureActiveParameter' . s:fg_yellow . ' gui=underline'

hi! link cStorageClass Keyword

"netrw
hi! link netrwTreeBar Comment
