return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "day",
		transparent = true,
		on_highlights = function(hl, _)
			hl.NvimTreeNormal = { bg = "none" }
			hl.NvimTreeNormalNC = { bg = "none" }
			hl.NvimTreeWinSeparator = { fg = "none", bg = "none" }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}
