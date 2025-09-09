vim.opt_local.conceallevel = 2

valut_path = vim.loop.os_getenv("OBSIDIAN_DIR")

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		ui = {},
		workspaces = {
			{
				name = "main",
				path = valut_path,
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
