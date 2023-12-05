-- Name:         Grey
-- Description:  A low-contrast light theme for NeoVim
-- Author:       Yorick Peterse <yorick@yorickpeterse.com>
-- Maintainer:   Yorick Peterse <yorick@yorickpeterse.com>
-- Website:      https://github.com/yorickpeterse/nvim-grey
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
local grey_bg_light = '#ececec'
local black = '#000000'
local blue = '#1561b8'
local green = '#1C5708'
local light_green = '#dfeacc'
local light_red = '#f2d3cd'
local red = '#c4331d'
local grey = '#5e5e5e'
local light_grey = '#e3e3e3'
local border = '#cccccc'
local highlight = '#eeeeee'
local yellow = '#bf8f00'
local light_yellow = '#f9e595'
local bright_yellow = '#f9efc7'
local orange = '#a55000'
local purple = '#5c21a5'
local white = '#ffffff'
local cyan = '#007872'

g.terminal_color_0 = black
g.terminal_color_1 = red
g.terminal_color_2 = green
g.terminal_color_3 = yellow
g.terminal_color_4 = blue
g.terminal_color_5 = purple
g.terminal_color_6 = cyan
g.terminal_color_7 = grey

g.terminal_color_8 = black
g.terminal_color_9 = red
g.terminal_color_10 = green
g.terminal_color_11 = yellow
g.terminal_color_12 = blue
g.terminal_color_13 = purple
g.terminal_color_14 = cyan
g.terminal_color_15 = grey

local highlights = {
  -- This highlight group can be used when one wants to disable a highlight
  -- group using `winhl`
  Disabled = {},
  -- These highlight groups can be used for statuslines, for example when
  -- displaying ALE warnings and errors.
  BlackOnLightYellow = { fg = black, bg = light_yellow },
  LightRedBackground = { bg = light_red },
  WhiteOnBlue = { fg = white, bg = blue },
  WhiteOnOrange = { fg = white, bg = orange },
  WhiteOnRed = { fg = white, bg = red },
  WhiteOnYellow = { fg = white, bg = yellow },
  Yellow = { fg = yellow, bold = true },
  Bold = { fg = black, bold = true },
  Boolean = { link = 'Keyword' },
  Character = { link = 'String' },
  ColorColumn = { bg = highlight },
  Comment = { fg = grey },
  Conceal = {},
  Constant = { fg = black },
  Cursor = { bg = black },
  -- This is to work around https://github.com/neovim/neovim/issues/9800.
  CursorLine = { ctermfg = 'black' },
  CursorLineNr = { fg = black, bold = true },
  Directory = { fg = purple },
  EndOfBuffer = { fg = background, bg = background },
  Error = { link = 'ErrorMsg' },
  ErrorMsg = { fg = red, bold = true },
  FoldColumn = { fg = light_grey, bg = background },
  Folded = { link = 'Comment' },
  Identifier = { fg = black },
  IncSearch = { bg = light_yellow },
  Include = { fg = black, bold = true },
  InstanceVariable = { fg = purple },
  Keyword = { fg = black, bold = true },
  Label = { link = 'Keyword' },
  LineNr = { fg = grey },
  Macro = { fg = orange },
  MatchParen = { bold = true },
  MoreMsg = { fg = black },
  ModeMsg = { fg = black, bold = true },
  MsgSeparator = { fg = border },
  NonText = { fg = grey },
  Normal = { fg = black, bg = background },
  NormalFloat = { fg = black, bg = grey_bg_light },
  Number = { fg = blue },
  Operator = { fg = black },
  Pmenu = { fg = black, bg = grey_bg_light },
  PmenuSbar = { bg = grey_bg_light },
  PmenuSel = { bg = light_grey, bold = true },
  PmenuThumb = { bg = light_grey },
  PreCondit = { link = 'Macro' },
  PreProc = { fg = black },
  Question = { fg = black },
  QuickFixLine = { bg = highlight, bold = true },
  Regexp = { fg = orange },
  Search = { bg = light_yellow },
  SignColumn = { link = 'FoldColumn' },
  Special = { fg = black },
  SpecialKey = { link = 'Number' },
  SpellBad = { fg = red, bold = true, underline = true },
  SpellCap = { fg = purple, underline = true },
  SpellLocal = { fg = green, underline = true },
  SpellRare = { fg = purple, underline = true },
  Statement = { link = 'Keyword' },
  StatusLine = { fg = black, bg = background },
  StatusLineNC = { fg = black, bg = grey_bg_light },
  StatusLineTab = { fg = black, bg = background, bold = true },
  WinBar = { fg = black, bold = true },
  WinBarNc = { fg = black, bold = true },
  WinBarFill = { fg = border },
  StorageClass = { link = 'Keyword' },
  String = { fg = green },
  Symbol = { fg = orange },
  TabLine = { fg = black, bg = light_grey },
  TabLineFill = { fg = black, bg = border },
  TabLineSel = { fg = black, bg = background, bold = true },
  Title = { fg = black, bold = true },
  Todo = { fg = grey, bold = true },
  Type = { link = 'Constant' },
  Underlined = { underline = true },
  VertSplit = { fg = border },
  Visual = { bg = light_grey },
  WarningMsg = { fg = yellow, bold = true },
  Whitespace = { fg = border },
  WildMenu = { link = 'PmenuSel' },
  -- ALE
  ALEError = { fg = red, bold = true },
  ALEErrorSign = { fg = red, bold = true },
  ALEWarning = { fg = yellow, bold = true },
  ALEWarningSign = { fg = yellow, bold = true },
  -- CSS
  cssClassName = { link = 'Keyword' },
  cssColor = { link = 'Number' },
  cssIdentifier = { link = 'Keyword' },
  cssImportant = { link = 'Keyword' },
  cssProp = { link = 'Identifier' },
  cssTagName = { link = 'Keyword' },
  -- Diffs
  DiffAdd = { bg = light_green },
  DiffChange = { bg = highlight },
  DiffDelete = { fg = red },
  DiffText = { bg = bright_yellow },
  diffAdded = { link = 'DiffAdd' },
  diffChanged = { link = 'DiffChange' },
  diffFile = { fg = black, bold = true },
  diffLine = { fg = blue },
  diffRemoved = { link = 'DiffDelete' },
  -- dressing.nvim
  FloatTitle = { fg = black, bg = grey_bg_light, bold = true },
  FloatBorder = { fg = grey_bg_light, bg = grey_bg_light },
  -- Dot/Graphviz
  dotKeyChar = { link = 'Operator' },
  -- diffview.nvim
  DiffviewCursorLine = { bg = highlight },
  DiffviewDiffAddAsDelete = { bg = light_red },
  DiffviewDiffDelete = { fg = light_grey },
  DiffviewDiffDeleteDim = { fg = light_grey },
  DiffviewFilePanelFileName = { fg = black },
  DiffviewFilePanelPath = { fg = purple },
  DiffviewFilePanelRootPath = { fg = purple },
  DiffviewFilePanelTitle = { fg = black, bold = true },
  DiffviewStatusModified = { fg = yellow, bold = true },
  DiffviewStatusAdded = { fg = green, bold = true },
  DiffviewStatusCopied = { fg = green, bold = true },
  DiffviewStatusDeleted = { fg = red, bold = true },
  -- Flash
  FlashBackdrop = { link = 'None' },
  FlashLabel = { fg = red, bold = true },
  -- Fugitive
  FugitiveblameHash = { fg = purple },
  FugitiveblameTime = { fg = blue },
  gitCommitOverflow = { link = 'ErrorMsg' },
  gitCommitSummary = { link = 'String' },

  -- Gitsigns
  GitSignsAdd = { fg = green },
  GitSignsDelete = { fg = red },
  GitSignsChange = { fg = grey },

  -- HAML
  hamlClass = { fg = black },
  hamlDocType = { link = 'Comment' },
  hamlId = { fg = black },
  hamlTag = { fg = black, bold = true },
  -- hop.nvim
  HopNextKey = { fg = red, bold = true },
  HopNextKey1 = { fg = yellow },
  HopNextKey2 = { fg = yellow },
  HopUnmatched = {},
  -- HTML
  htmlArg = { link = 'Identifier' },
  htmlLink = { link = 'Directory' },
  htmlScriptTag = { link = 'htmlTag' },
  htmlSpecialTagName = { link = 'htmlTag' },
  htmlTag = { fg = black, bold = true },
  htmlTagName = { link = 'htmlTag' },
  htmlItalic = { italic = true },
  htmlBold = { bold = true },
  -- Inko
  inkoCommentBold = { fg = grey, bold = true },
  inkoCommentInlineUrl = { link = 'Number' },
  inkoCommentItalic = { fg = grey, italic = true },
  inkoCommentTitle = { fg = grey, bold = true },
  inkoInstanceVariable = { link = 'InstanceVariable' },
  inkoKeywordArgument = { link = 'Regexp' },
  -- Java
  javaAnnotation = { link = 'Directory' },
  javaCommentTitle = { link = 'javaComment' },
  javaDocParam = { link = 'Todo' },
  javaDocTags = { link = 'Todo' },
  javaExternal = { link = 'Keyword' },
  javaStorageClass = { link = 'Keyword' },
  -- Javascript
  JavaScriptNumber = { link = 'Number' },
  javaScriptBraces = { link = 'Operator' },
  javaScriptFunction = { link = 'Keyword' },
  javaScriptIdentifier = { link = 'Keyword' },
  javaScriptMember = { link = 'Identifier' },
  -- JSON
  jsonKeyword = { link = 'String' },
  -- Lua
  luaFunction = { link = 'Keyword' },
  -- LSP
  DiagnosticUnderlineError = { underline = true, sp = red },
  DiagnosticUnderlineWarn = { underline = true, sp = yellow },
  LspDiagnosticsUnderlineError = { link = 'DiagnosticUnderlineError' },
  LspDiagnosticsUnderlineWarning = { link = 'DiagnosticUnderlineWarn' },
  DiagnosticFloatingError = { fg = red, bg = grey_bg_light, bold = true },
  DiagnosticFloatingHint = { fg = black, bg = grey_bg_light, bold = true },
  DiagnosticFloatingInfo = { fg = blue, bg = grey_bg_light, bold = true },
  DiagnosticFloatingWarn = { fg = yellow, bg = grey_bg_light, bold = true },
  DiagnosticError = { fg = red, bold = true },
  DiagnosticHint = { fg = grey, bold = true },
  DiagnosticInfo = { fg = blue, bold = true },
  DiagnosticWarn = { fg = yellow, bold = true },
  -- Make
  makeTarget = { link = 'Function' },
  -- Markdown
  markdownCode = { link = 'markdownCodeBlock' },
  markdownCodeBlock = { link = 'Comment' },
  markdownListMarker = { link = 'Keyword' },
  markdownOrderedListMarker = { link = 'Keyword' },
  markdownUrl = { fg = blue },
  -- netrw
  netrwClassify = { link = 'Identifier' },
  -- Neogit
  NeogitCursorLine = { link = 'CursorLine' },
  NeogitGraphRed = { fg = red },
  NeogitGraphWhite = { fg = black },
  NeogitGraphYellow = { fg = yellow },
  NeogitGraphGreen = { fg = green },
  NeogitGraphCyan = { fg = cyan },
  NeogitGraphBlue = { fg = blue },
  NeogitGraphPurple = { fg = purple },
  NeogitGraphGray = { fg = grey },
  NeogitGraphOrange = { fg = orange },
  NeogitGraphBoldRed = { fg = red, bold = true },
  NeogitGraphBoldWhite = { fg = black, bold = true },
  NeogitGraphBoldYellow = { fg = yellow, bold = true },
  NeogitGraphBoldGreen = { fg = green, bold = true },
  NeogitGraphBoldCyan = { fg = cyan, bold = true },
  NeogitGraphBoldBlue = { fg = blue, bold = true },
  NeogitGraphBoldPurple = { fg = purple, bold = true },
  NeogitGraphBoldGray = { fg = grey, bold = true },
  NeogitGraphBoldOrange = { fg = orange, bold = true },
  NeogitCommitViewHeader = { fg = yellow, bold = true },
  NeogitFilePath = { fg = purple },
  NeogitHunkHeader = { link = 'Normal' },
  NeogitHunkHeaderHighlight = { link = 'NeogitHunkHeader' },
  NeogitDiffContext = { link = 'Normal' },
  NeogitDiffContextHighlight = { link = 'Normal' },
  NeogitDiffAdd = { link = 'DiffAdd' },
  NeogitDiffAddHighlight = { link = 'NeogitDiffAdd' },
  NeogitDiffDelete = { link = 'DiffDelete' },
  NeogitDiffDeleteHighlight = { link = 'NeogitDiffDelete' },
  NeogitDiffHeader = { fg = black, bold = true },
  NeogitDiffHeaderHighlight = { link = 'NeogitDiffHeader' },
  -- Perl
  perlPackageDecl = { link = 'Identifier' },
  perlStatementInclude = { link = 'Statement' },
  perlStatementPackage = { link = 'Statement' },
  podCmdText = { link = 'Todo' },
  podCommand = { link = 'Comment' },
  podVerbatimLine = { link = 'Todo' },
  -- Ruby
  rubyAttribute = { link = 'Identifier' },
  rubyClass = { link = 'Keyword' },
  rubyClassVariable = { link = 'rubyInstancevariable' },
  rubyConstant = { link = 'Constant' },
  rubyDefine = { link = 'Keyword' },
  rubyFunction = { link = 'Function' },
  rubyInstanceVariable = { link = 'InstanceVariable' },
  rubyMacro = { link = 'Identifier' },
  rubyModule = { link = 'rubyClass' },
  rubyRegexp = { link = 'Regexp' },
  rubyRegexpCharClass = { link = 'Regexp' },
  rubyRegexpDelimiter = { link = 'Regexp' },
  rubyRegexpQuantifier = { link = 'Regexp' },
  rubyRegexpSpecial = { link = 'Regexp' },
  rubyStringDelimiter = { link = 'String' },
  rubySymbol = { link = 'Symbol' },
  -- Rust
  rustCommentBlockDoc = { link = 'Comment' },
  rustCommentLineDoc = { link = 'Comment' },
  rustFuncCall = { link = 'Identifier' },
  rustModPath = { link = 'Identifier' },
  -- pounce.nvim
  PounceAccept = { fg = red, bold = true },
  PounceAcceptBest = { fg = red, bold = true },
  PounceMatch = { bg = light_yellow },
  PounceUnmatched = {},
  PounceGap = { link = 'None' },
  -- Python
  pythonOperator = { link = 'Keyword' },
  -- SASS
  sassClass = { link = 'cssClassName' },
  sassId = { link = 'cssIdentifier' },
  -- Shell
  shFunctionKey = { link = 'Keyword' },
  -- SQL
  sqlKeyword = { link = 'Keyword' },
  -- Typescript
  typescriptBraces = { link = 'Operator' },
  typescriptEndColons = { link = 'Operator' },
  typescriptExceptions = { link = 'Keyword' },
  typescriptFuncKeyword = { link = 'Keyword' },
  typescriptFunction = { link = 'Function' },
  typescriptIdentifier = { link = 'Identifier' },
  typescriptLogicSymbols = { link = 'Operator' },
  -- Telescope
  TelescopeBorder = { fg = border, bg = grey_bg_light },
  TelescopeMatching = { fg = yellow, bold = true },
  TelescopePromptNormal = { fg = black, bg = grey_bg_light },
  TelescopePromptBorder = { fg = border, bg = grey_bg_light },
  TelescopePromptPrefix = { fg = black, bold = true },
  TelescopeSelection = { bg = light_grey, bold = true },
  TelescopeTitle = { fg = black, bg = grey_bg_light, bold = true },
  TelescopeNormal = { fg = black, bg = grey_bg_light },
  -- Treesitter
  TSEmphasis = { italic = true },
  TSField = {},
  TSStringEscape = { fg = green, bold = true },
  TSStrong = { bold = true },
  TSURI = { fg = cyan, underline = true },
  TSUnderline = { underline = true },
  TSConstMacro = { link = 'Macro' },
  TSDanger = { link = 'Todo' },
  TSKeywordOperator = { link = 'Keyword' },
  TSNamespace = { link = 'Constant' },
  TSNote = { link = 'Todo' },
  TSProperty = { link = 'TSField' },
  TSStringRegex = { link = 'Regexp' },
  TSSymbol = { link = 'Symbol' },
  TSTypeBuiltin = { link = 'Keyword' },
  TSWarning = { link = 'Todo' },
  -- Ruby uses "TSLabel" for instance variables, for some reason. See
  -- https://github.com/tree-sitter/tree-sitter-ruby/issues/184 for more
  -- details.
  rubyTSLabel = { link = 'InstanceVariable' },
  -- TOML
  --
  -- tomlTSTypeBuiltin is used for section titles (e.g. `[dependencies]`), while
  -- tomlTSProperty is used for key-value pairs. These rules ensure the syntax
  -- is consistent with https://github.com/cespare/vim-toml.
  tomlTSProperty = { fg = black },
  tomlTSTypeBuiltin = { fg = black, bold = true },
  -- Vimscript
  VimCommentTitle = { link = 'Todo' },
  VimIsCommand = { link = 'Constant' },
  vimGroup = { link = 'Constant' },
  vimHiGroup = { link = 'Constant' },
  -- XML
  xmlAttrib = { link = 'Identifier' },
  xmlTag = { link = 'Identifier' },
  xmlTagName = { link = 'Identifier' },
  -- YAML
  yamlPlainScalar = { link = 'String' },
  -- YARD
  yardComment = { link = 'Comment' },
  yardType = { link = 'Todo' },
  yardTypeList = { link = 'Todo' },
}

for group, opts in pairs(highlights) do
  api.nvim_set_hl(0, group, opts)
end
