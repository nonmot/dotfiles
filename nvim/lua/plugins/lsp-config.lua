return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lspconfig.clangd.setup{
            capabilities = capabilities
        }
        lspconfig.markdown_oxide.setup {
            capabilities = capabilities
        }

        local virtual_env_path = vim.trim(vim.fn.system('poetry config virtualenvs.path'))
        local virtual_env_dir = vim.trim(vim.fn.system('poetry env list')):gsub('%s*%([^)]*%)', '')

        local python_path = 'python'
        if #vim.split(virtual_env_dir, '\n') == 1 then
            python_path = string.format('%s/%s/bin/python', virtual_env_path, virtual_env_dir)
        end

        lspconfig.pyright.setup {
            capabilities = capabilities,
            settings = {
                python = {
                    pythonPath = python_path,
                    venvPath = virtual_env_path,
                    venv = vim.trim(virtual_env_dir),
                }
            }
        }
        lspconfig.ts_ls.setup {
            capabilities = capabilities,
        }
        lspconfig.html.setup {
            capabilities = capabilities,
        }
        lspconfig.cssls.setup {
            capabilities = capabilities,
        }
        lspconfig.terraform_lsp.setup {
        }
    end,
}
