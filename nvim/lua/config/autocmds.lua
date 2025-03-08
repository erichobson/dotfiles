local M = {}

function M.setup()
    local function augroup(name)
        return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
    end

    -- Window Management
    vim.api.nvim_create_autocmd("VimResized", {
        group = augroup("window_management"),
        command = "wincmd =",
        desc = "Auto-equalize splits when resizing Neovim",
    })

    -- FileType-specific Settings
    vim.api.nvim_create_autocmd("FileType", {
        group = augroup("filetype_settings"),
        pattern = "*", -- Apply to all filetypes
        callback = function()
            vim.opt_local.expandtab = true
            vim.opt_local.shiftwidth = 4
            vim.opt_local.tabstop = 4
        end,
        desc = "Set indent settings for specific filetypes",
    })

    -- Spell Checking
    vim.api.nvim_create_autocmd("FileType", {
        group = augroup("spell_check"),
        pattern = { "gitcommit", "markdown", "text", "pandoc" },
        callback = function()
            vim.opt_local.spell = true
            vim.opt_local.spelllang = { "en_us" }
        end,
        desc = "Enable spell checking for text-heavy filetypes",
    })

    -- QuickFix Improvements
    vim.api.nvim_create_autocmd("FileType", {
        group = augroup("quickfix"),
        pattern = { "help", "startuptime", "qf", "lspinfo", "fugitive", "git" },
        callback = function()
            vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
        end,
        desc = "Close certain windows with q",
    })

    -- Comment Prevention
    vim.api.nvim_create_autocmd("FileType", {
        group = augroup("format_options"),
        pattern = "*",
        callback = function()
            vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }
        end,
        desc = "Prevent automatic comment insertion",
    })

    -- QuickFix Auto-open
    vim.api.nvim_create_autocmd("QuickFixCmdPost", {
        group = augroup("quickfix_open"),
        pattern = "[^l]*",
        callback = function()
            if #vim.fn.getqflist() > 0 then
                vim.cmd("copen")
            end
        end,
        desc = "Automatically open quickfix if there are items",
    })

    -- Create Directory if it Doesn't Exist
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = augroup("mkdir"),
        callback = function()
            local dir = vim.fn.expand("<afile>:p:h")
            if vim.fn.isdirectory(dir) == 0 then
                vim.fn.mkdir(dir, "p")
            end
        end,
        desc = "Create directory if it doesn't exist",
    })

    -- Force write undo history
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = augroup("mkundo"),
        pattern = "*",
        callback = function()
            if vim.o.undofile then
                vim.cmd("silent! mkundo")
            end
        end,
        desc = "Force write undo history",
    })
end

return M
