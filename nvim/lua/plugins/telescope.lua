--          ╭─────────────────────────────────────────────────────────╮
--          │                     telescope.nvim                      │
--          │    https://github.com/nvim-telescope/telescope.nvim     │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<Esc>"] = actions.close,
                    },
                },
                file_ignore_patterns = { "node_modules", ".git" },
                path_display = { "truncate" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        telescope.load_extension("fzf")
    end,

    keys = {
        {
            mode = { "n" },
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            mode = { "n" },
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            mode = { "n" },
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "List buffers",
        },
        {
            mode = { "n" },
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Help tags",
        },
        {
            mode = { "n" },
            "<leader>fgf",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Git files",
        },
        {
            mode = { "n" },
            "<leader>fr",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "Recent files",
        },
        {
            mode = { "n" },
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Fuzzy find in buffer",
        },
        {
            mode = { "n" },
            "<leader>fk",
            function()
                require("telescope.builtin").keymaps()
            end,
            desc = "Keymaps",
        },
        {
            mode = { "n" },
            "<leader>fc",
            function()
                require("telescope.builtin").commands()
            end,
            desc = "Commands",
        },
        {
            mode = { "n" },
            "<leader>fs",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "Grep string under cursor",
        },
        {
            mode = { "n" },
            "<leader>fd",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "List diagnostics",
        },
        {
            mode = { "n" },
            "<leader>fp",
            function()
                require("telescope.builtin").builtin()
            end,
            desc = "List pickers",
        },
    },
}
