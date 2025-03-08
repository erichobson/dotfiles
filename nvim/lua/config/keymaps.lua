local M = {}

-- Helper function for mapping keys
local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

function M.setup()
    -- Save and Quit (Fixed to use proper command syntax)
    map("n", "<leader>w", ":w<CR>", "Save Buffer")
    map("n", "<leader>q", ":q<CR>", "Quit Buffer")
    map("n", "<leader>wa", ":wall<CR>", "Save All Buffers")
    map("n", "<leader>wq", ":wq<CR>", "Save and Quit")
    map("n", "<leader>qa", ":qa<CR>", "Quit All")
    map("n", "<leader>Q", ":q!<CR>", "Force Quit")

    -- Buffer Navigation and Management
    local buffer_maps = {
        ["<S-h>"] = { ":bprevious<CR>", "Previous Buffer" },
        ["<S-l>"] = { ":bnext<CR>", "Next Buffer" },
        ["<leader>c"] = { ":bdelete<CR>", "Close Buffer" },
        ["<leader>bl"] = { ":buffers<CR>", "List Buffers" },
        ["<leader>bo"] = { ":%bd|e#|bd#<CR>", "Close Other Buffers" },
        ["<leader><leader>"] = { "<C-^>", "Switch to Last Buffer" },
    }

    for key, value in pairs(buffer_maps) do
        map("n", key, value[1], value[2])
    end

    -- Window Management
    local window_maps = {
        ["<C-h>"] = {
            function()
                require("focus").split_command("h")
            end,
            "Create or move to split (h)",
        },

        ["<C-j>"] = {
            function()
                require("focus").split_command("j")
            end,
            "Create or move to split (j)",
        },

        ["<C-k>"] = {
            function()
                require("focus").split_command("k")
            end,
            "Create or move to split (k)",
        },

        ["<C-l>"] = {
            function()
                require("focus").split_command("l")
            end,
            "Create or move to split (l)",
        },
    }

    for key, value in pairs(window_maps) do
        map("n", key, value[1], value[2])
    end

    -- Tab Management
    local tab_maps = {
        ["<leader>tn"] = { ":tabnew<CR>", "New Tab" },
        ["<leader>tx"] = { ":tabclose<CR>", "Close Current Tab" },
        ["<leader>tl"] = { ":tabnext<CR>", "Next Tab" },
        ["<leader>th"] = { ":tabprevious<CR>", "Previous Tab" },
        ["<leader>wt"] = { "<C-w>T", "Move Window to New Tab" },
    }

    for key, value in pairs(tab_maps) do
        map("n", key, value[1], value[2])
    end

    -- Search and Replace
    local search_maps = {
        ["<leader>h"] = { ":nohlsearch<CR>", "Clear Search Highlighting" },
        ["n"] = { "nzzzv", "Next Search Result Centered" },
        ["N"] = { "Nzzzv", "Previous Search Result Centered" },
    }

    for key, value in pairs(search_maps) do
        map("n", key, value[1], value[2])
    end
    map("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], "Search Selected Text")
    map("v", "<leader>r", [[y:%s/<C-r>"//g<Left><Left>]], "Replace Selected Text Globally")

    -- Text Editing
    local edit_maps = {
        ["J"] = { "mzJ`z", "Join Lines and Keep Cursor Position" },
        ["Q"] = { "<nop>", "Disable Ex Mode" },
        ["%"] = { "%", "Go to Matching Pair" },
        ["<leader>="] = { "gg=G``", "Auto-Indent Entire File" },
        ["<leader>a"] = { "ggVG", "Select All Text" },
    }

    for key, value in pairs(edit_maps) do
        map("n", key, value[1], value[2])
    end
    map("v", "<", "<gv", "Shift Left and Reselect")
    map("v", ">", ">gv", "Shift Right and Reselect")

    -- Navigation
    map("n", "H", "^", "Go to Beginning of Line")
    map("n", "L", "$", "Go to End of Line")
    map("n", "j", "gj", "Move Down by Display Line")
    map("n", "k", "gk", "Move Up by Display Line")

    -- Spell Checking
    local spell_maps = {
        ["<leader>ss"] = { ":setlocal spell!<CR>", "Toggle Spell Check" },
        ["<leader>s="] = { "z=", "Correct Misspelled Word" },
        ["<leader>sn"] = { "]s", "Next Misspelled Word" },
        ["<leader>sp"] = { "[s", "Previous Misspelled Word" },
    }

    for key, value in pairs(spell_maps) do
        map("n", key, value[1], value[2])
    end

    -- Clipboard Operations
    local clip_maps = {
        ["<leader>P"] = { [["+p]], "Paste from System Clipboard After Cursor" },
        ["<leader>p"] = { [["+P]], "Paste from System Clipboard Before Cursor" },
        ["<leader>Y"] = { [["+yg_]], "Yank to End of Line to System Clipboard" },
        ["<leader>rp"] = {
            ":let @+ = expand('%')<CR>",
            "Copy Relative File Path",
        },
        ["<leader>fp"] = {
            ":let @+ = expand('%:p')<CR>",
            "Copy Full File Path",
        },
        ["<leader>D"] = { [["+dd]], "Delete Line to System Clipboard" },
    }

    for key, value in pairs(clip_maps) do
        map("n", key, value[1], value[2])
    end

    -- Quickfix Navigation
    map("n", "]q", ":cnext<CR>", "Next Quickfix Item")
    map("n", "[q", ":cprev<CR>", "Previous Quickfix Item")
    map("n", "<leader>qo", ":copen<CR>", "Open Quickfix Window")
    map("n", "<leader>qc", ":cclose<CR>", "Close Quickfix Window")
end

return M
