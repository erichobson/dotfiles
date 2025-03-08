return {
    "saghen/blink.cmp",
    version = "*",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    build = "cargo build --release",

    opts = {
        keymap = {
            preset = "none",
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-Space>"] = { "show" },
            ["<C-e>"] = { "hide" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            -- ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            -- ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        sources = {
            default = function()
                local ft = vim.bo.filetype
                local success, node = pcall(vim.treesitter.get_node)
                local node_type = success and node and node:type()

                if ft == "lua" then
                    return { "lsp", "path" }
                elseif
                    success
                    and node
                    and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node_type)
                then
                    return { "buffer" }
                else
                    return { "lsp", "path", "snippets", "buffer" }
                end
            end,
        },

        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                },
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 300,
                treesitter_highlighting = true,
                window = {
                    border = "single",
                },
            },

            menu = {
                enabled = true,
                min_width = 60,
                auto_show = true,
            },

            ghost_text = {
                enabled = false,
            },
        },

        signature = {
            enabled = true,
            window = {
                border = "single",
            },
        },
    },
}
