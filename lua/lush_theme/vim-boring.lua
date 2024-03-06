--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  local white = hsl("#ffffff");
  local black = hsl("#000000");
  -- https://emilis.info/other/extended_tango
  --            1               2               3               4               5               6               7               8
  local alum = {hsl("#2e3436"), hsl("#555753"), hsl("#888a85"), hsl("#babdb6"), hsl("#d3d7cf"), hsl("#ecf0eb"), hsl("#f7f8f5"), hsl("#f7f8f5").lighten(25), hsl("#f7f8f5").lighten(50)};
  local yell = {hsl("#291e00"), hsl("#725000"), hsl("#c4a000"), hsl("#edd400"), hsl("#fce94f"), hsl("#fffc9c"), hsl("#feffd0"), hsl("#feffd0").lighten(25), hsl("#feffd0").lighten(50)};
  local oran = {hsl("#301700"), hsl("#8c3700"), hsl("#ce5c00"), hsl("#f57900"), hsl("#fcaf3e"), hsl("#ffd797"), hsl("#fff0d7"), hsl("#fff0d7").lighten(25), hsl("#fff0d7").lighten(50)};
  local choc = {hsl("#271700"), hsl("#503000"), hsl("#8f5902"), hsl("#c17d11"), hsl("#e9b96e"), hsl("#efd0a7"), hsl("#faf0d7"), hsl("#faf0d7").lighten(25), hsl("#faf0d7").lighten(50)};
  local cham = {hsl("#173000"), hsl("#2a5703"), hsl("#4e9a06"), hsl("#73d216"), hsl("#8ae234"), hsl("#b7f774"), hsl("#e4ffc7"), hsl("#e4ffc7").lighten(25), hsl("#e4ffc7").lighten(50)};
  local blue = {hsl("#00202a"), hsl("#0a3050"), hsl("#204a87"), hsl("#3465a4"), hsl("#729fcf"), hsl("#97c4f0"), hsl("#daeeff"), hsl("#daeeff").lighten(25), hsl("#daeeff").lighten(50)};
  local plum = {hsl("#170720"), hsl("#371740"), hsl("#5c3566"), hsl("#75507b"), hsl("#ad7fa8"), hsl("#e0c0e4"), hsl("#fce0ff"), hsl("#fce0ff").lighten(25), hsl("#fce0ff").lighten(50)};
  local red =  {hsl("#270000"), hsl("#600000"), hsl("#a40000"), hsl("#cc0000"), hsl("#ef2929"), hsl("#f78787"), hsl("#ffcccc"), hsl("#ffcccc").lighten(25), hsl("#ffcccc").lighten(50)};

  local dull = alum[4];  -- ~ white.darken(40);
  local deep = alum[2];  -- ~ white.darken(70);
  local todo = oran[5];
  local dullred = red[1];
  local darkred = red[2].lighten(10);
  local darkyellow = yell[2];
  local darkblue = blue[2];
  local darkviol = plum[2];
  local darkgreen = cham[2].darken(15);
  local dimviol = plum[3];
  local justred = red[5];
  local lightviol = plum[6];
  local lighterred = red[8];
  local lighteryellow = yell[8];
  local lightergreen = cham[8];
  local lightestred = red[9];
  local lightestyellow = yell[9];
  local lightestgreen = cham[9];
  local lightestorange = oran[9];
  local lightestblue = blue[9];
  local lightestviol = plum[9];
  local lightestalum = alum[9];

  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups

    Normal            { bg=black, fg=white }, -- Normal text

    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    CurSearch         { fg=white, bg=dimviol }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory         { fg=lightviol }, -- Directory names (and other special names in listings)
    DiffAdd           { fg=lightergreen }, -- Diff mode: Added line |diff.txt|
    DiffChange        { fg=lighteryellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete        { fg=lighterred}, -- Diff mode: Deleted line |diff.txt|
    DiffText          { bg=darkred }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg          { fg=justred }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    Folded            { bg=deep }, -- Line used for closed folds
    FoldColumn        { bg=deep }, -- 'foldcolumn'
    SignColumn        { bg=deep }, -- Column where |signs| are displayed
    IncSearch         { bg=dimviol, fg=white }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute        { bg=dullred, fg=white }, -- |:substitute| replacement text highlighting
    LineNr            { Normal }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove       { Normal }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow       { Normal }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr      { Normal }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen        { fg=lightviol }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    NonText           { fg=deep }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalFloat    { }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    FloatTitle        { fg=deep }, -- Title of floating windows.
    -- NormalNC       {that }, -- normal text in non-current windows
    Pmenu             { bg=white, fg=black }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search            { fg=white, bg=deep }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey        { fg=dull }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title             { fg=dull }, -- Titles for output from ":set all", ":autocmd" etc.
    -- Visual         { }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg        { fg=darkyellow }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment           { fg=dull }, -- Any comment

    Constant          { fg=dull }, -- (*) Any constant
    String            { fg=dull }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier        { Normal }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

   Statement          { Normal }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc           { }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type              { Normal }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special           { gui="underline" }, -- (*) Any special symbol
    SpecialChar       { gui="italic" }, --   Special character in a constant
    Tag               { gui="underline" }, --   You can use CTRL-] on this
    Delimiter         { Normal }, --   Character that needs attention
    SpecialComment    { gui="underline" }, --   Special things inside a comment (e.g. '\n')
    Debug             { gui="underline" }, --   Debugging statements

    Underlined        { fg=white, gui="underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error             { bg=darkred }, -- Any erroneous construct
    Todo              { fg=todo }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError               { fg=darkred } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn                { fg=darkyellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo                { fg=dimviol } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint                { fg=darkblue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk                  { fg=darkgreen } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError      { gui="underline", sp=darkred } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn       { gui="underline", sp=darkyellow } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo       { gui="underline", sp=darkviol } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint       { gui="underline", sp=darkblue } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk         { gui="underline", sp=darkgreen } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    sym"@text.title"           { Normal }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    sym"@constant.builtin"     { Normal }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    sym"@function.builtin"     { Normal }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    sym"@constructor"          { Normal }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    -- misc

    NoiceVirtualText           { fg=dimviol },

    diffFile                   { fg=dull },
    diffIndexLine              { fg=dull },
    diffLine                   { fg=dull },
    diffNewFile                { fg=dull },
    diffOldFile                { fg=dull },

    -- vimagit
    diffAdded                  { DiffAdd },
    diffRemoved                { DiffDelete },

    -- rainbow delimiters
    RainbowDelimiterRed        { fg=lightestred },
    RainbowDelimiterYellow     { fg=lightestyellow },
    RainbowDelimiterBlue       { fg=lightestblue },
    RainbowDelimiterOrange     { fg=lightestorange },
    RainbowDelimiterGreen      { fg=lightestgreen },
    RainbowDelimiterViolet     { fg=lightestviol },
    RainbowDelimiterCyan       { fg=lightestalum },
}


end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
