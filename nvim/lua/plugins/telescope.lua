return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local lga_actions = require("telescope-live-grep-args.actions")
        local action_layout = require("telescope.actions.layout")

        telescope.setup({
            defaults = {
                prompt_prefix = "🔍 ",
                selection_caret = "➤ ",
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<Esc>"] = actions.close,
                        ["<M-p>"] = action_layout.toggle_preview,
                        ["<C-u>"] = false,
                        ["<CR>"] = actions.select_default,
                    },
                    n = {
                        ["<Esc>"] = actions.close,
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                },
                file_ignore_patterns = { "node_modules", ".git/", "dist", "build" },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim",
                },
                layout_config = {
                    prompt_position = "top",
                    horizontal = {
                        preview_width = 0.55,
                    },
                    vertical = {
                        preview_height = 0.35,
                    },
                },
                sorting_strategy = "ascending",
            },
            pickers = {
                find_files = {
                    hidden = true,
                    follow = true,
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
                },
                oldfiles = {
                    only_cwd = true,
                },
                buffers = {
                    sort_mru = true,
                    mappings = {
                        i = {
                            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                        },
                        n = {
                            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                        },
                    },
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden", "--glob", "!.git/" }
                    end,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
                file_browser = {
                    -- Default configuration
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")
        telescope.load_extension("file_browser")
        telescope.load_extension("ui-select")
    end,

    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "Recent files",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "List buffers",
        },
        {
            "<leader>fg",
            function()
                require("telescope").extensions.live_grep_args.live_grep_args()
            end,
            desc = "Live grep with args",
        },
        {
            "<leader>fgf",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Git files",
        },
        {
            "<leader>fgc",
            function()
                require("telescope.builtin").git_commits()
            end,
            desc = "Git commits",
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Help tags",
        },
        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Fuzzy find in buffer",
        },
        {
            "<leader>fk",
            function()
                require("telescope.builtin").keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>fc",
            function()
                require("telescope.builtin").commands()
            end,
            desc = "Commands",
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "Grep string under cursor",
        },
        {
            "<leader>fd",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "List diagnostics",
        },
        {
            "<leader>fp",
            function()
                require("telescope.builtin").builtin()
            end,
            desc = "List all pickers",
        },
        {
            "<leader>fe",
            function()
                require("telescope").extensions.file_browser.file_browser()
            end,
            desc = "File Browser",
        },
    },
}
