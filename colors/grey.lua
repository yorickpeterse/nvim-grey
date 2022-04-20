-- Name:         Grey
-- Description:  A low-contrast light theme for NeoVim
-- Author:       Yorick Peterse <yorick@yorickpeterse.com>
-- Maintainer:   Yorick Peterse <yorick@yorickpeterse.com>
-- Website:      https://gitlab.com/yorickpeterse/nvim-grey
-- License:      MPL 2.0

local o = vim.o
local g = vim.g
local api = vim.api

vim.cmd('hi clear')

if g.syntax_on == 1 then
  vim.cmd('syntax reset')
end

o.background = 'light'
g.colors_name = 'grey'

local background = '#f2f2f2'
local black = '#000000'
local blue = '#1e6fcc'
local green = '#216609'
local lgreen = '#dfeacc'
local lred = '#f2d3cd'
local red = '#cc3e28'
local grey = '#777777'
local dgrey = '#555555'
local lgrey1 = '#dddddd'
local lgrey2 = '#eaeaea'
local lgrey3 = '#aaaaaa'
local lgrey4 = '#eeeeee'
local yellow = '#bf8f00'
local lyellow1 = '#f9e595'
local lyellow2 = '#f9efc7'
local orange = '#a55000'
local purple = '#5c21a5'
local white = '#ffffff'
local cyan = '#158c86'

g.terminal_color_0 = black
g.terminal_color_1 = red
g.terminal_color_2 = green
g.terminal_color_3 = yellow
g.terminal_color_4 = blue
g.terminal_color_5 = purple
g.terminal_color_6 = cyan
g.terminal_color_7 = lgrey3

g.terminal_color_8 = dgrey
g.terminal_color_9 = red
g.terminal_color_10 = green
g.terminal_color_11 = yellow
g.terminal_color_12 = blue
g.terminal_color_13 = purple
g.terminal_color_14 = cyan
g.terminal_color_15 = lgrey3

local function hi(group, options)
  api.nvim_set_hl(0, group, options)
end

local function link(source, target)
  api.nvim_set_hl(0, source, { link = target })
end

-- This highlight group can be used when one wants to disable a highlight group
-- using `winhl`
hi('Disabled', {})

-- These highlight groups can be used for statuslines, for example when
-- displaying ALE warnings and errors.
hi('WhiteOnOrange', { fg = white, bg = orange })
hi('WhiteOnYellow', { fg = white, bg = yellow })
hi('WhiteOnRed', { fg = white, bg = red })
hi('BlackOnLightYellow', { fg = black, bg = lyellow1 })
hi('Yellow', { fg = yellow, bold = true })
hi('LightRedBackground', { bg = lred })
hi('WhiteOnBlue', { fg = white, bg = blue })

hi('Bold', { fg = black, bold = true })
hi('ColorColumn', { bg = lgrey4 })
hi('Comment', { fg = grey })
hi('Conceal', {})
hi('Constant', { fg = black })
hi('Cursor', { bg = black })
hi('Visual', { bg = lgrey1 })
hi('CursorLine', { bg = lgrey4 })
hi('CursorLineNR', { fg = black, bold = true })
hi('Directory', { fg = purple })
hi('ErrorMsg', { fg = red, bold = true })
hi('FoldColumn', { fg = lgrey1, bg = background })
hi('Identifier', { fg = black })
hi('IncSearch', { bg = lyellow1 })
hi('Include', { fg = black, bold = true })
hi('Keyword', { fg = black, bold = true })
hi('LineNr', { fg = black })
hi('Macro', { fg = orange })
hi('MatchParen', { bold = true })
hi('MoreMsg', { fg = black })
hi('NonText', { fg = lgrey3 })
hi('EndOfBuffer', { fg = background, bg = background })
hi('Normal', { fg = black, bg = background })
hi('NormalFloat', { fg = black, bg = background })
hi('Number', { fg = blue })
hi('Operator', { fg = black })
hi('Pmenu', { fg = black, bg = lgrey2 })
hi('PmenuSel', { fg = black, bg = lgrey1, bold = true })
hi('PmenuThumb', { bg = lgrey1 })
hi('PmenuSbar', { bg = lgrey2 })
hi('PreProc', { fg = black })
hi('Question', { fg = black })
hi('QuickFixLine', { bg = lgrey2, bold = true })
hi('Regexp', { fg = orange })
hi('Symbol', { fg = orange })
hi('Search', { bg = lyellow1 })
hi('Special', { fg = black })
hi('SpellBad', { fg = red, bold = true, underline = true })
hi('SpellCap', { fg = purple, underline = true })
hi('SpellLocal', { fg = green, underline = true })
hi('SpellRare', { fg = purple, underline = true })
hi('StatusLine', { fg = black, bg = lgrey1 })
hi('StatusLineNC', { fg = black, bg = lgrey4 })
hi('String', { fg = green })
hi('TabLine', { fg = dgrey, bg = lgrey1 })
hi('TabLineFill', { fg = black, bg = lgrey1 })
hi('TabLineSel', { fg = black, bg = background, bold = true })
hi('Title', { fg = black, bold = true })
hi('Todo', { fg = grey, bold = true })
hi('Underlined', { underline = true })
hi('VertSplit', { fg = lgrey1 })
hi('WarningMsg', { fg = yellow, bold = true })
hi('InstanceVariable', { fg = purple })

link('Boolean', 'Keyword')
link('Character', 'String')
link('Error', 'ErrorMsg')
link('Folded', 'Comment')
link('Label', 'Keyword')
link('PreCondit', 'Macro')
link('SignColumn', 'FoldColumn')
link('SpecialKey', 'Number')
link('Statement', 'Keyword')
link('StorageClass', 'Keyword')
link('Type', 'Constant')
link('WildMenu', 'PmenuSel')

-- ALE
hi('ALEError', { fg = red, bold = true })
hi('ALEErrorSign', { fg = red, bold = true })
hi('ALEWarning', { fg = yellow, bold = true })
hi('ALEWarningSign', { fg = yellow, bold = true })

-- CSS
link('cssClassName', 'Keyword')
link('cssColor', 'Number')
link('cssIdentifier', 'Keyword')
link('cssImportant', 'Keyword')
link('cssProp', 'Identifier')
link('cssTagName', 'Keyword')

-- Diffs
hi('DiffAdd', { bg = lgreen })
hi('DiffChange', {})
hi('DiffDelete', { fg = red })
hi('DiffText', { bg = lyellow2 })
hi('diffFile', { fg = black, bold = true })
hi('diffLine', { fg = blue })
link('diffAdded', 'DiffAdd')
link('diffChanged', 'DiffChange')
link('diffRemoved', 'DiffDelete')
link('dotKeyChar', 'Operator')

-- diffview.nvim
hi('DiffviewFilePanelFileName', { fg = black })
hi('DiffviewFilePanelPath', { fg = purple })
hi('DiffviewCursorLine', { bg = lgrey1 })
hi('DiffviewDiffAddAsDelete', { bg = lred })
hi('DiffviewDiffDelete', { fg = lgrey1 })

-- Fugitive
hi('FugitiveblameTime', { fg = blue })
hi('FugitiveblameHash', { fg = purple })
link('gitCommitOverflow', 'ErrorMsg')
link('gitCommitSummary', 'String')

-- HAML
hi('hamlClass', { fg = black })
hi('hamlId', { fg = black })
hi('hamlTag', { fg = black, bold = true })
link('hamlDocType', 'Comment')

-- hop.nvim
hi('HopNextKey', { fg = red, bold = true })
hi('HopNextKey1', { fg = yellow })
hi('HopNextKey2', { fg = yellow })
hi('HopUnmatched', {})

-- HTML
hi('htmlTag', { fg = black, bold = true })
link('htmlArg', 'Identifier')
link('htmlLink', 'Directory')
link('htmlLink', 'Directory')
link('htmlScriptTag', 'htmlTag')
link('htmlSpecialTagName', 'htmlTag')
link('htmlTagName', 'htmlTag')

-- Inko
hi('inkoCommentBold', { fg = grey, bold = true })
hi('inkoCommentItalic', { fg = grey, italic = true })
hi('inkoCommentTitle', { fg = grey, bold = true })
link('inkoCommentInlineUrl', 'Number')
link('inkoInstanceVariable', 'InstanceVariable')
link('inkoKeywordArgument', 'Regexp')

-- Java
link('javaAnnotation', 'Directory')
link('javaCommentTitle', 'javaComment')
link('javaDocParam', 'Todo')
link('javaDocTags', 'Todo')
link('javaExternal', 'Keyword')
link('javaStorageClass', 'Keyword')

-- Javascript
link('JavaScriptNumber', 'Number')
link('javaScriptBraces', 'Operator')
link('javaScriptFunction', 'Keyword')
link('javaScriptIdentifier', 'Keyword')
link('javaScriptMember', 'Identifier')

-- JSON
link('jsonKeyword', 'String')

-- Lua
link('luaFunction', 'Keyword')

-- LSP
hi('DiagnosticUnderlineError', { underline = true, sp = red })
hi('DiagnosticUnderlineWarn', { underline = true, sp = yellow })
link('LspDiagnosticsUnderlineError', 'DiagnosticUnderlineError')
link('LspDiagnosticsUnderlineWarning', 'DiagnosticUnderlineWarn')

-- Floating highlights are a bit too distracting, so they are disabled
hi('DiagnosticFloatingError', { fg = black, bg = background })
hi('DiagnosticFloatingWarn', { fg = black, bg = background })
hi('DiagnosticFloatingInfo', { fg = black, bg = background })
hi('DiagnosticFloatingHint', { fg = black, bg = background })

hi('DiagnosticError', { fg = red, bold = true })
hi('DiagnosticWarn', { fg = yellow, bold = true })
hi('DiagnosticInfo', { fg = blue, bold = true })
hi('DiagnosticHint', { fg = grey, bold = true })

-- Make
link('makeTarget', 'Function')

-- Markdown
link('markdownCode', 'markdownCodeBlock')
link('markdownCodeBlock', 'Comment')
link('markdownListMarker', 'Keyword')
link('markdownOrderedListMarker', 'Keyword')

-- netrw
link('netrwClassify', 'Identifier')

-- Perl
link('perlPackageDecl', 'Identifier')
link('perlStatementInclude', 'Statement')
link('perlStatementPackage', 'Statement')
link('podCmdText', 'Todo')
link('podCommand', 'Comment')
link('podVerbatimLine', 'Todo')

-- Ruby
link('rubyAttribute', 'Identifier')
link('rubyClass', 'Keyword')
link('rubyClassVariable', 'rubyInstancevariable')
link('rubyConstant', 'Constant')
link('rubyDefine', 'Keyword')
link('rubyFunction', 'Function')
link('rubyInstanceVariable', 'InstanceVariable')
link('rubyMacro', 'Identifier')
link('rubyModule', 'rubyClass')
link('rubyRegexp', 'Regexp')
link('rubyRegexpCharClass', 'Regexp')
link('rubyRegexpDelimiter', 'Regexp')
link('rubyRegexpQuantifier', 'Regexp')
link('rubyRegexpSpecial', 'Regexp')
link('rubyStringDelimiter', 'String')
link('rubySymbol', 'Symbol')

-- Rust
link('rustCommentBlockDoc', 'Comment')
link('rustCommentLineDoc', 'Comment')
link('rustFuncCall', 'Identifier')
link('rustModPath', 'Identifier')

-- Python
link('pythonOperator', 'Keyword')

-- SASS
link('sassClass', 'cssClassName')
link('sassId', 'cssIdentifier')

-- Shell
link('shFunctionKey', 'Keyword')

-- SQL
link('sqlKeyword', 'Keyword')

-- Typescript
link('typescriptBraces', 'Operator')
link('typescriptEndColons', 'Operator')
link('typescriptExceptions', 'Keyword')
link('typescriptFuncKeyword', 'Keyword')
link('typescriptFunction', 'Function')
link('typescriptIdentifier', 'Identifier')
link('typescriptLogicSymbols', 'Operator')

-- Telescope
hi('TelescopeSelection', { bg = lgrey1, bold = true })
hi('TelescopeMatching', { fg = yellow, bold = true })
hi('TelescopeBorder', { fg = lgrey1 })
hi('TelescopePromptPrefix', { fg = black, bold = true })

-- Treesitter
hi('TSStringEscape', { fg = green, bold = true })
hi('TSStrong', { bold = true })
hi('TSEmphasis', { italic = true })
hi('TSUnderline', { underline = true })
hi('TSURI', { fg = cyan, underline = true })
hi('TSNote', { fg = yellow, bold = true })
hi('TSField', {})

link('TSSymbol', 'Symbol')
link('TSStringRegex', 'Regexp')
link('TSConstMacro', 'Macro')
link('TSNamespace', 'Constant')
link('TSWarning', 'Todo')
link('TSNote', 'Todo')
link('TSDanger', 'Todo')
link('TSKeywordOperator', 'Keyword')
link('TSTypeBuiltin', 'Keyword')
link('TSProperty', 'TSField')

-- Ruby uses "TSLabel" for instance variables, for some reason. See
-- https://github.com/tree-sitter/tree-sitter-ruby/issues/184 for more details.
link('rubyTSLabel', 'InstanceVariable')

-- TOML
--
-- tomlTSTypeBuiltin is used for section titles (e.g. `[dependencies]`), while
-- tomlTSProperty is used for key-value pairs. These rules ensure the syntax is
-- consistent with https://github.com/cespare/vim-toml.
hi('tomlTSTypeBuiltin', { fg = black, bold = true })
hi('tomlTSProperty', { fg = black })

-- Vimscript
link('VimCommentTitle', 'Todo')
link('VimIsCommand', 'Constant')
link('vimGroup', 'Constant')
link('vimHiGroup', 'Constant')

-- XML
link('xmlAttrib', 'Identifier')
link('xmlTag', 'Identifier')
link('xmlTagName', 'Identifier')

-- YAML
link('yamlPlainScalar', 'String')

-- YARD
link('yardComment', 'Comment')
link('yardType', 'Todo')
link('yardTypeList', 'Todo')
