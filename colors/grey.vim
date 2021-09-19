" Name:         Grey
" Description:  A low-contrast light theme for NeoVim
" Author:       Yorick Peterse <yorick@yorickpeterse.com>
" Maintainer:   Yorick Peterse <yorick@yorickpeterse.com>
" Website:      https://gitlab.com/yorickpeterse/nvim-grey
" License:      MPL 2.0

set background=light

hi clear

if exists('g:syntax_on')
  syntax reset
endif

let g:colors_name = 'grey'

" Function for creating a highlight group
"
" We use this function so we can use variables in our highlight groups, instead
" of having to repeat the same color codes in a bunch of places.
function! s:Hi(group, fg_name, bg_name, gui, ...)
  if a:fg_name == 'NONE'
    let fg = a:fg_name
  else
    let fg = s:colors[a:fg_name]
  endif

  if a:bg_name == 'NONE'
    let bg = a:bg_name
  else
    let bg = s:colors[a:bg_name]
  endif

  if empty(a:gui)
    let style = 'NONE'
  else
    let style = a:gui
  endif

  if a:0 == 1 && !empty(a:1)
    let sp = s:colors[a:1]
  else
    let sp = 'NONE'
  endif

  exe 'hi ' . a:group . ' guifg=' . fg . ' guibg=' . bg . ' gui=' . style . ' guisp=' . sp
endfunction

" A temporary command is used to make it easier/less verbose to define highlight
" groups. This command is removed at the end of this file.
command! -nargs=+ Hi call s:Hi(<f-args>)

let s:colors = {
\  'background': '#f2f2f2',
\  'black': '#000000',
\  'blue': '#1e6fcc',
\  'green': '#216609',
\  'lgreen': '#dfeacc',
\  'lred': '#f2d3cd',
\  'red': '#cc3e28',
\  'grey': '#777777',
\  'dgrey': '#555555',
\  'lgrey1': '#dddddd',
\  'lgrey2': '#eaeaea',
\  'lgrey3': '#aaaaaa',
\  'lgrey4': '#eeeeee',
\  'yellow': '#bf8f00',
\  'lyellow1': '#f9e595',
\  'lyellow2': '#f9efc7',
\  'orange': '#a55000',
\  'purple': '#5c21a5',
\  'white': '#ffffff',
\  'cyan': '#158c86'
\ }

let g:terminal_color_0 = s:colors['black']
let g:terminal_color_1 = s:colors['red']
let g:terminal_color_2 = s:colors['green']
let g:terminal_color_3 = s:colors['yellow']
let g:terminal_color_4 = s:colors['blue']
let g:terminal_color_5 = s:colors['purple']
let g:terminal_color_6 = s:colors['cyan']
let g:terminal_color_7 = s:colors['lgrey3']

let g:terminal_color_8 = s:colors['dgrey']
let g:terminal_color_9 = s:colors['red']
let g:terminal_color_10 = s:colors['green']
let g:terminal_color_11 = s:colors['yellow']
let g:terminal_color_12 = s:colors['blue']
let g:terminal_color_13 = s:colors['purple']
let g:terminal_color_14 = s:colors['cyan']
let g:terminal_color_15 = s:colors['lgrey3']

" Set up all highlight groups.
"
" We use the custom Hi command for this. The syntax of this command is as
" follows:
"
"     Hi NAME FG BG GUI GUISP
"
" Where NAME is the highlight name, FG the foreground color, BG the background
" color, and GUI the settings for the `gui` option (e.g. bold). Since Hi is a
" command and not a function, quotes shouldn't be used. To refer to a color,
" simply use its name (e.g. "black").

" This highlight group can be used when one wants to disable a highlight group
" using `winhl`
Hi Disabled NONE NONE NONE

" These highlight groups can be used for statuslines, for example when
" displaying ALE warnings and errors.
Hi WhiteOnOrange white orange NONE
Hi WhiteOnYellow white yellow NONE
Hi WhiteOnRed white red NONE
Hi BlackOnLightYellow black lyellow1 NONE
Hi Yellow yellow NONE bold
Hi LightRedBackground NONE lred NONE
Hi WhiteOnBlue white blue NONE

Hi Bold black NONE bold
Hi ColorColumn NONE lgrey4 NONE
Hi Comment grey NONE NONE
Hi Conceal NONE NONE NONE
Hi Constant black NONE NONE
Hi Cursor NONE lgrey1 NONE
Hi CursorLine NONE lgrey4 NONE
Hi CursorLineNR black NONE bold
Hi Directory purple NONE NONE
Hi ErrorMsg red NONE bold
Hi FoldColumn lgrey1 background NONE
Hi Identifier black NONE NONE
Hi IncSearch NONE lyellow1 NONE
Hi Include black NONE bold
Hi Keyword black NONE bold
Hi LineNr black NONE NONE
Hi Macro orange NONE NONE
Hi MatchParen NONE NONE bold
Hi MoreMsg black NONE NONE
Hi NonText lgrey3 NONE NONE
Hi EndOfBuffer background background NONE
Hi Normal black background NONE
Hi NormalFloat black background NONE
Hi Number blue NONE NONE
Hi Operator black NONE NONE
Hi Pmenu black lgrey2 NONE
Hi PmenuSel black lgrey1 bold
Hi PmenuThumb NONE lgrey1 NONE
Hi PmenuSbar NONE lgrey2 NONE
Hi PreProc black NONE NONE
Hi Question black NONE NONE
Hi QuickFixLine NONE lgrey2 bold
Hi Regexp orange NONE NONE
Hi Symbol orange NONE NONE
Hi Search NONE lyellow1 NONE
Hi Special black NONE NONE
Hi SpellBad red NONE bold,undercurl
Hi SpellCap purple NONE undercurl
Hi SpellLocal green NONE undercurl
Hi SpellRare purple NONE undercurl
Hi StatusLine black lgrey1 NONE
Hi StatusLineNC black lgrey1 NONE
Hi String green NONE NONE
Hi TabLine dgrey lgrey1 NONE
Hi TabLineFill black lgrey1 NONE
Hi TabLineSel black background bold
Hi Title black NONE bold
Hi Todo grey NONE bold
Hi Underlined NONE NONE underline
Hi VertSplit lgrey1 NONE NONE
Hi WarningMsg orange NONE bold
Hi InstanceVariable purple NONE NONE

hi! link Boolean Keyword
hi! link Character String
hi! link Error ErrorMsg
hi! link Folded Comment
hi! link Label Keyword
hi! link PreCondit Macro
hi! link SignColumn FoldColumn
hi! link SpecialKey Number
hi! link Statement Keyword
hi! link StorageClass Keyword
hi! link Type Constant
hi! link Visual Cursor
hi! link WildMenu PmenuSel

" ALE
Hi ALEError red NONE bold
Hi ALEErrorSign red NONE bold
Hi ALEWarning orange NONE bold
Hi ALEWarningSign orange NONE bold

" CSS
hi! link cssClassName Keyword
hi! link cssColor Number
hi! link cssIdentifier Keyword
hi! link cssImportant Keyword
hi! link cssProp Identifier
hi! link cssTagName Keyword

" Diffs
Hi DiffAdd NONE lgreen NONE
Hi DiffChange NONE NONE NONE
Hi DiffDelete red NONE NONE
Hi DiffText NONE lyellow2 NONE
Hi diffFile black NONE bold
Hi diffLine blue NONE NONE
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete
hi! link dotKeyChar Operator

" diffview.nvim
Hi DiffviewFilePanelFileName black NONE NONE
Hi DiffviewFilePanelPath purple NONE NONE
Hi DiffviewCursorLine NONE lgrey1 NONE
Hi DiffviewDiffAddAsDelete NONE lred NONE

" Fugitive
Hi FugitiveblameTime blue NONE NONE
Hi FugitiveblameHash purple NONE NONE
hi! link gitCommitOverflow ErrorMsg
hi! link gitCommitSummary String

" HAML
Hi hamlClass black NONE NONE
Hi hamlId black NONE NONE
Hi hamlTag black NONE bold
hi! link hamlDocType Comment

" hop.nvim
Hi HopNextKey red NONE bold
Hi HopNextKey1 yellow NONE NONE
Hi HopNextKey2 yellow NONE NONE
hi! clear HopUnmatched

" HTML
Hi htmlTag black NONE bold
hi! link htmlArg Identifier
hi! link htmlLink Directory
hi! link htmlScriptTag htmlTag
hi! link htmlSpecialTagName htmlTag
hi! link htmlTagName htmlTag

" Inko
Hi inkoCommentBold grey NONE bold
Hi inkoCommentItalic grey NONE italic
Hi inkoCommentTitle grey NONE bold
hi! link inkoCommentInlineUrl Number
hi! link inkoInstanceVariable InstanceVariable
hi! link inkoKeywordArgument Regexp

" Java
hi! link javaAnnotation Directory
hi! link javaCommentTitle javaComment
hi! link javaDocParam Todo
hi! link javaDocTags Todo
hi! link javaExternal Keyword
hi! link javaStorageClass Keyword

" Javascript
hi! link JavaScriptNumber Number
hi! link javaScriptBraces Operator
hi! link javaScriptFunction Keyword
hi! link javaScriptIdentifier Keyword
hi! link javaScriptMember Identifier

" JSON
hi! link jsonKeyword String

" Lua
hi! link luaFunction Keyword

" LSP
Hi DiagnosticUnderlineError NONE NONE undercurl red
Hi DiagnosticUnderlineWarn NONE NONE undercurl yellow
hi! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
hi! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn

" Make
hi! link makeTarget Function

" Markdown
hi! link markdownCode markdownCodeBlock
hi! link markdownCodeBlock Comment
hi! link markdownListMarker Keyword
hi! link markdownOrderedListMarker Keyword

" netrw
hi! link netrwClassify Identifier

" Perl
hi! link perlPackageDecl Identifier
hi! link perlStatementInclude Statement
hi! link perlStatementPackage Statement
hi! link podCmdText Todo
hi! link podCommand Comment
hi! link podVerbatimLine Todo

" Ruby
hi! link rubyAttribute Identifier
hi! link rubyClass Keyword
hi! link rubyClassVariable rubyInstancevariable
hi! link rubyConstant Constant
hi! link rubyDefine Keyword
hi! link rubyFunction Function
hi! link rubyInstanceVariable InstanceVariable
hi! link rubyMacro Identifier
hi! link rubyModule rubyClass
hi! link rubyRegexp Regexp
hi! link rubyRegexpCharClass Regexp
hi! link rubyRegexpDelimiter Regexp
hi! link rubyRegexpQuantifier Regexp
hi! link rubyRegexpSpecial Regexp
hi! link rubyStringDelimiter String
hi! link rubySymbol Symbol

" Rust
hi! link rustCommentBlockDoc Comment
hi! link rustCommentLineDoc Comment
hi! link rustFuncCall Identifier
hi! link rustModPath Identifier

" Python
hi! link pythonOperator Keyword

" SASS
hi! link sassClass cssClassName
hi! link sassId cssIdentifier

" Shell
hi! link shFunctionKey Keyword

" SQL
hi! link sqlKeyword Keyword

" Typescript
hi! link typescriptBraces Operator
hi! link typescriptEndColons Operator
hi! link typescriptExceptions Keyword
hi! link typescriptFuncKeyword Keyword
hi! link typescriptFunction Function
hi! link typescriptIdentifier Identifier
hi! link typescriptLogicSymbols Operator

" Telescope
Hi TelescopeSelection NONE lgrey1 bold
Hi TelescopeMatching yellow NONE bold
Hi TelescopeBorder lgrey1 NONE NONE
Hi TelescopePromptPrefix black NONE bold

" Treesitter
Hi TSStringEscape green NONE bold
Hi TSStrong NONE NONE bold
Hi TSEmphasis NONE NONE italic
Hi TSUnderline NONE NONE underline
Hi TSURI cyan NONE underline
Hi TSNote yellow NONE bold
Hi TSField NONE NONE NONE

hi! link TSSymbol Symbol
hi! link TSStringRegex Regexp
hi! link TSConstMacro Macro
hi! link TSNamespace Constant
hi! link TSWarning Todo
hi! link TSNote Todo
hi! link TSDanger Todo
hi! link TSKeywordOperator Keyword
hi! link TSTypeBuiltin Keyword
hi! link TSProperty TSField

" Ruby uses "TSLabel" for instance variables, for some reason. See
" https://github.com/tree-sitter/tree-sitter-ruby/issues/184 for more details.
hi! link rubyTSLabel InstanceVariable

" TOML
"
" tomlTSTypeBuiltin is used for section titles (e.g. `[dependencies]`), while
" tomlTSProperty is used for key-value pairs. These rules ensure the syntax is
" consistent with https://github.com/cespare/vim-toml.
Hi tomlTSTypeBuiltin black NONE bold
Hi tomlTSProperty black NONE nocombine

" Vimscript
hi! link VimCommentTitle Todo
hi! link VimIsCommand Constant
hi! link vimGroup Constant
hi! link vimHiGroup Constant

" XML
hi! link xmlAttrib Identifier
hi! link xmlTag Identifier
hi! link xmlTagName Identifier

" YAML
hi! link yamlPlainScalar String

" YARD
hi! link yardComment Comment
hi! link yardType Todo
hi! link yardTypeList Todo

delcommand Hi

" vim: et ts=2 sw=2
