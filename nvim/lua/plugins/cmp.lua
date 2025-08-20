return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        -- nvim-cmp の設定
        local cmp = require("cmp") -- nvim-cmp のメインモジュールをロード
        local luasnip = require("luasnip") -- LuaSnip のモジュールをロード
        require("luasnip/loaders/from_vscode").lazy_load() -- VSCode スタイルのスニペットをロード

        cmp.setup({
            preselect = cmp.PreselectMode.None,
            snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- 補完候補のドキュメントを上にスクロール
                ["<C-f>"] = cmp.mapping.scroll_docs(4), -- 補完候補のドキュメントを下にスクロール
                ["<C-Space>"] = cmp.mapping.complete(), -- 手動で補完候補を表示
                ["<C-e>"] = cmp.mapping.abort(), -- 補完を中断して閉じる
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- 補完確定 (現在選択中の候補を使用)
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", keyword_length = 2 },
                { name = "nvim_lsp_signature_help", keyword_length = 2 },
                { name = "luasnip", keyword_length = 2 }
                }, {
                { name = "buffer", keyword_length = 2 }, -- バッファの内容を補完候補に含める
                { name = "cmdline", keyword_length = 2 }, -- バッファの内容を補完候補に含める
                { name = 'path', keyword_length = 2 },
            }),
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
            experimental = { ghost_text = true },
        })

        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        })
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "path" }, { name = "cmdline" } },
        })
    end,
}
