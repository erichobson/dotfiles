return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = false,
            enable_diagnostics = true,

            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
                follow_current_file_enabled = true,
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = true,
            },

            window = {
                position = "bottom",
                width = 35,
                mappings = {
                    ["<CR>"] = "open",
                    ["<Tab>"] = "preview",
                    ["r"] = "refresh",
                    ["a"] = "add",
                    ["d"] = "delete",
                    ["R"] = "rename",
                },
            },

            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "",
                },
                git_status = {
                    symbols = {
                        added = "✚",
                        modified = "",
                        deleted = "✖",
                        renamed = "",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
        })
    end,
    keys = {
        {
            "<leader>e",
            "<CMD>Neotree toggle<CR>",
            mode = "n",
            desc = "Toggle Neotree",
        },
        {
            "<leader>r",
            "<CMD>Neotree focus<CR>",
            mode = "n",
            desc = "Focus Neotree",
        },
    },
}
