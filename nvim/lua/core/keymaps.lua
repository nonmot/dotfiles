local set = vim.keymap.set
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })

-- Highlight
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

-- Peek definition
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })

-- buffer
vim.keymap.set("n", "<C-j>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":bprevious<CR>", { noremap = true, silent = true })

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Filer
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Aerial
set("n", "<Leader>a", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set(
	"n",
	"<leader>ff",
	builtin.find_files,
	{ desc = "Telescope find files. Lists files in your current working directory, respects .gitignore." }
)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
	desc = "Telescope live grep. Search for a string in your current working directory and get results live as you type, respects .gitignore. ",
})
vim.keymap.set(
	"n",
	"<leader>fb",
	builtin.buffers,
	{ desc = "Telescope buffers. Lists open buffers in current neovim instance." }
)
vim.keymap.set(
	"n",
	"<leader>fh",
	builtin.help_tags,
	{ desc = "Telescope help tags. Lists available help tags and opens a new window with the relevant help info on <cr>" }
)
