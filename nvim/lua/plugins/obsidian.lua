local vault_path = vim.loop.os_getenv("OBSIDIAN_DIR")
local personal_path = vim.loop.os_getenv("OBSIDIAN_PERSONAL_DIR")

local workspaces = {
	{
		name = "main",
		path = vault_path,
	},
}

if personal_path then
	table.insert(workspaces, {
		name = "personal",
		path = personal_path,
	})
end

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	event = { "BufReadPre *.md", "BufNewFile *.md" },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		ui = {
			enable = true,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				["!"] = { char = "", hl_group = "ObsidianImportant" },
				["-"] = { char = "", hl_group = "ObsidianImportant" },
			},
		},
		workspaces = workspaces,
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
					return os.date("%Y-%m-%d", os.time() + 32400 - 86400)
				end,
				tomorrow_link = function()
					return os.date("%Y-%m-%d", os.time() + 32400 + 86400)
				end,
			},
		},
	},
}
