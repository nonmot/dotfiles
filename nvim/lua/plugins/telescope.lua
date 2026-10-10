-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- Telescope 0.1.x calls nvim-treesitter's removed `ft_to_lang` API.
		-- Keep previews working with Vim's regex highlighter instead.
		defaults = { preview = { treesitter = false } },
	},
}
