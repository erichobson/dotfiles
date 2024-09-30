return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
        -- Disable default virtual text diagnostics
        vim.diagnostic.config({
            virtual_text = false,
        })

        -- Setup lsp_lines
        require("lsp_lines").setup()

        -- Keymap to toggle lsp_lines
        vim.api.nvim_set_keymap(
            "n",
            "<leader>l",
            ':lua require("lsp_lines").toggle()<CR>',
            { noremap = true, silent = true }
        )
    end,
}
