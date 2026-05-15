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
			folder = "Weekly",
			date_format = "%G/W%V",
			template = "template_weekly.md",
		},
		attachments = {
			img_folder = "Images",
		},
		mappings = {},
		templates = {
			folder = "Templates",
			substitutions = {
				last_week_link = function()
					return os.date("%G-W%V", os.time() + 32400 - 604800)
				end,
				next_week_link = function()
					return os.date("%G-W%V", os.time() + 32400 + 604800)
				end,
			},
		},
	},
}
