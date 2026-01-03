return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.config("markdown_oxide", {
			capabilities = capabilities,
		})

		local virtual_env_path = "."
		local virtual_env_dir = ".venv"

		local python_path = "python"
		if #vim.split(virtual_env_dir, "\n") == 1 then
			python_path = string.format("%s/%s/bin/python", virtual_env_path, virtual_env_dir)
		end

		vim.lsp.config("pyright", {
			capabilities = capabilities,
      root_markers = {
        ".git",
        "pyproject.toml",
        "pyrightconfig.json",
      },
			settings = {
				python = {
					pythonPath = python_path,
					venvPath = virtual_env_path,
					venv = vim.trim(virtual_env_dir),
					analysis = {
						typeCheckingMode = "strict",
					},
				},
			},
		})
		vim.lsp.config("ts_ls", {
			single_file_support = false,
			capabilities = capabilities,
		})
		vim.lsp.config("html", {
			capabilities = capabilities,
		})
		vim.lsp.config("cssls", {
			capabilities = capabilities,
		})
		vim.lsp.config("terraformls", {})
		vim.lsp.config("tailwindcss", {})
		vim.lsp.config("rust_analyzer", {})
	end,
}
