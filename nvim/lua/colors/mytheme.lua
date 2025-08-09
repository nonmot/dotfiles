vim.o.background = "dark"
vim.g.color_name = "mytheme"

local set = vim.api.nvim_set_hl

set(0,"Normal",{ fg = "#d4d4d4", bg = "none" })
set(0,"Comment",{ fg = "#6a9955", italic = true })
set(0,"Keyword",{ fg = "#569cd6", bold = true })
set(0,"Function",{ fg = "#dcdcaa" })
set(0,"String",{ fg = "#ce9178" })
set(0,"Type",{ fg = "#4ec9b0" })
set(0,"Constant",{ fg = "#b5cea8" })
set(0,"Identifier",{ fg = "#9cdcfe" })
set(0,"Statement",{ fg = "#c586c0" })
set(0,"NormalNC",{ bg = "none" })
set(0,"NormalSB",{ bg = "none" })
--
-- gray
set(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
set(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
set(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
set(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
set(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
set(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
set(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
set(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
set(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
set(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
set(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
