vim.opt_local.conceallevel = 2

personal_valut_path = "/Users/aa549998/Library/Mobile Documents/iCloud~md~obsidian/Documents/My Vault"

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
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
				path = personal_valut_path,
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
