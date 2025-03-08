return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function lsp_client_names()
            local clients = vim.lsp.get_clients()
            if #clients > 0 then
                local client_names = {}
                for _, client in ipairs(clients) do
                    table.insert(client_names, client.name)
                end
                return table.concat(client_names, ", ")
            end
            return ""
        end

        require("lualine").setup({
            options = {
                component_separators = "",
                icons_enabled = true,
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                lualine_b = { "filename", "branch" },
                lualine_c = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        sections = { "error", "warn", "info", "hint" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                    },
                },

                lualine_x = {
                    {},
                },

                lualine_y = {
                    lsp_client_names,
                    {
                        "filetype",
                        colored = false,
                        icon_only = true,
                        icon = { align = "right" },
                    },
                },
                lualine_z = {
                    { "location", separator = { right = "" }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = {},
        })
    end,
}
