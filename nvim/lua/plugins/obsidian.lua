vim.opt_local.conceallevel = 2

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	-- lazy = true,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian",
			},
			{
				name = "training",
				path = "~/dev/fy25-training/e-learning",
			},
		},
		daily_notes = {
			folder = "Daily",
			date_format = "%Y/%m/%Y-%m-%d",
			template = "template_daily.md",
		},
		attachments = {
			img_folder = "Images",
		},
		mappings = {},
		templates = {
			folder = "Templates",
			substitutions = {
				yesterday_link = function()
					return os.date("Daily/%Y/%m/%Y-%m-%d", os.time() - 86400)
				end,
				tomorrow_link = function()
					return os.date("Daily/%Y/%m/%Y-%m-%d", os.time() + 86400)
				end,
			},
		},
	},
}
