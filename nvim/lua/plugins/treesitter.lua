return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        -- "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "html",
            "python",
            "dockerfile",
            "bash",
            "markdown",
            "markdown_inline",
            "regex",
            "vim",
            "yaml",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true,
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

-- return {
--     "nvim-treesitter/nvim-treesitter",
--     event = { "BufReadPost", "BufNewFile" },
--     dependencies = {
--         "nvim-treesitter/nvim-treesitter-textobjects",
--     },
--     build = ":TSUpdate",
--     opts = {
--         ensure_installed = {
--             -- Low level/System
--             "c",
--             "cpp",
--             "rust",
--             "go",
--
--             -- Web Dev
--             "html",
--             "css",
--             "javascript",
--             "typescript",
--             "tsx",
--             "json",
--
--             -- Scripting
--             "lua",
--             "python",
--             "bash",
--             "fish",
--
--             -- DevOps
--             "dockerfile",
--             "yaml",
--             "toml",
--
--             -- Documentation
--             "markdown",
--             "markdown_inline",
--             "regex",
--             "vim",
--             "vimdoc",
--         },
--
--         -- Install parsers synchronously (only applied to `ensure_installed`)
--         sync_install = false,
--
--         -- Automatically install missing parsers when entering buffer
--         auto_install = true,
--
--         highlight = {
--             enable = true,
--             additional_vim_regex_highlighting = false,
--         },
--
--         indent = {
--             enable = true,
--         },
--
--         -- Incremental selection based on the named nodes from the grammar
--         incremental_selection = {
--             enable = true,
--             keymaps = {
--                 init_selection = "gnn", -- start incremental selection
--                 node_incremental = "grn", -- increment to the upper named node
--                 scope_incremental = "grc", -- increment to the upper scope
--                 nmde_decremental = "grm", -- decrement to the previous node
--             },
--         },
--
--         -- Treesitter text objects
--         textobjects = {
--             select = {
--                 enable = true,
--                 lookahead = true, -- Automatically jump forward to textobj
--                 keymaps = {
--                     -- You can use the capture groups defined in textobjects.scm
--                     ["af"] = "@function.outer",
--                     ["if"] = "@function.inner",
--                     ["ac"] = "@class.outer",
--                     ["ic"] = "@class.inner",
--                     ["aa"] = "@parameter.outer",
--                     ["ia"] = "@parameter.inner",
--                     ["ab"] = "@block.outer",
--                     ["ib"] = "@block.inner",
--                     ["al"] = "@loop.outer",
--                     ["il"] = "@loop.inner",
--                     ["ai"] = "@conditional.outer",
--                     ["ii"] = "@conditional.inner",
--                     ["at"] = "@comment.outer",
--                 },
--                 selection_modes = {
--                     ["@parameter.outer"] = "v", -- charwise
--                     ["@function.outer"] = "V", -- linewise
--                     ["@class.outer"] = "<c-v>", -- blockwise
--                 },
--                 include_surrounding_whitespace = true,
--             },
--
--             -- Swap text objects
--             swap = {
--                 enable = true,
--                 swap_next = {
--                     ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
--                     ["<leader>nf"] = "@function.outer", -- swap function with next
--                 },
--                 swap_previous = {
--                     ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
--                     ["<leader>pf"] = "@function.outer", -- swap function with previous
--                 },
--             },
--
--             -- Move to next/previous text objects
--             move = {
--                 enable = true,
--                 set_jumps = true, -- whether to set jumps in the jumplist
--                 goto_next_start = {
--                     ["]f"] = "@function.outer",
--                     ["]c"] = "@class.outer",
--                     ["]i"] = "@conditional.outer",
--                     ["]l"] = "@loop.outer",
--                     ["]s"] = { query = "@local.scope", query_group = "locals" },
--                 },
--                 goto_next_end = {
--                     ["]F"] = "@function.outer",
--                     ["]C"] = "@class.outer",
--                 },
--                 goto_previous_start = {
--                     ["[f"] = "@function.outer",
--                     ["[c"] = "@class.outer",
--                     ["[i"] = "@conditional.outer",
--                     ["[l"] = "@loop.outer",
--                 },
--                 goto_previous_end = {
--                     ["[F"] = "@function.outer",
--                     ["[C"] = "@class.outer",
--                 },
--             },
--
--             -- LSP interop
--             lsp_interop = {
--                 enable = true,
--                 border = "none",
--                 floating_preview_opts = {},
--                 peek_definition_code = {
--                     ["<leader>df"] = "@function.outer",
--                     ["<leader>dF"] = "@class.outer",
--                 },
--             },
--         },
--     },
--     config = function(_, opts)
--         require("nvim-treesitter.configs").setup(opts)
--
--         -- Enable folding using treesitter
--         vim.opt.foldmethod = "expr"
--         vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--         vim.opt.foldenable = false -- Disable folding at startup
--
--         -- Enable repeatable movements
--         local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
--
--         -- Repeat movement with ; and ,
--         vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
--         vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
--
--         -- Make builtin f, F, t, T also repeatable with ; and ,
--         vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
--         vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
--         vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
--         vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
--     end,
-- }
