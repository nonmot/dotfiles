return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
    config = function()
        -- nvim-cmp の設定
        local cmp = require("cmp") -- nvim-cmp のメインモジュールをロード
        local luasnip = require("luasnip") -- LuaSnip のモジュールをロード
        require("luasnip/loaders/from_vscode").lazy_load() -- VSCode スタイルのスニペットをロード

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- 補完候補のドキュメントを上にスクロール
                ["<C-f>"] = cmp.mapping.scroll_docs(4), -- 補完候補のドキュメントを下にスクロール
                ["<C-Space>"] = cmp.mapping.complete(), -- 手動で補完候補を表示
                ["<C-e>"] = cmp.mapping.abort(), -- 補完を中断して閉じる
                -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 補完確定 (現在選択中の候補を使用)
                ["<CR>"] = cmp.mapping({
                  i = function(fallback)
                    if cmp.visible() and cmp.get_active_entry() then
                      cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                    else
                      fallback()
                    end
                  end,
                  s = cmp.mapping.confirm({ select = true }),
                  c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" }
                }, {
                { name = "buffer" }, -- バッファの内容を補完候補に含める
                { name = "cmdline" }, -- バッファの内容を補完候補に含める
                {
                        name = 'path',
                        option = {
                            pathMappings = {
                                ['@'] = '${folder}/src'
                            },
                        },
                },
            }),
        })
    end,
}
