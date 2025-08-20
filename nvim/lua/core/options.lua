local opt = vim.opt

-- Line number
opt.number = true

-- Tab and indent
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard 
opt.clipboard = "unnamedplus"

-- swapfile
opt.swapfile = false

-- window
opt.termguicolors = true
opt.winblend = 0
opt.pumblend = 0

-- Leader
vim.g.mapleader = ' '

-- Comment
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove("r")
        vim.opt_local.formatoptions:remove("o")
    end
})

-- Completion
vim.o.wildmode = 'longest:full,full'
vim.o.wildmenu = true

-- Colorscheme
vim.cmd[[colorscheme tokyonight]]
vim.cmd[[
  highlight NvimTreeNormal guibg=none
  highlight NvimTreeNormalNC guibg=none
]]
