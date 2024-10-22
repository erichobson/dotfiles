--          ╭─────────────────────────────────────────────────────────╮
--          │                      lualine.nvim                       │
--          │      https://github.com/nvim-lualine/lualine.nvim       │
--          ╰─────────────────────────────────────────────────────────╯

-- local function search_result()
--     if vim.v.hlsearch == 0 then
--         return ""
--     end
--     local last_search = vim.fn.getreg("/")
--     if not last_search or last_search == "" then
--         return ""
--     end
--     local searchcount = vim.fn.searchcount({ maxcount = 9999 })
--     return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
-- end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                component_separators = "",
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                lualine_b = {
                    "filename",
                    "branch",
                },
                lualine_c = {
                    -- "%=",
                    -- { search_result },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        source = { "nvim" },
                        sections = { "error" },
                    },
                    {
                        "diagnostics",
                        source = { "nvim" },
                        sections = { "warn" },
                    },
                },
                lualine_y = {
                    "filetype",
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
                lualine_y = {},
                lualine_z = { "location" },
            },
            extensions = {
                "lazy",
                "mason",
                "neo-tree",
            },
        })
    end,
}
