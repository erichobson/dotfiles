-- Function to map a key combination
function Map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

Map("n", "<leader>w", "<cmd>update<cr>", "Save Buffer")
Map("n", "<leader>q", "<cmd>quit<cr>", "Quit Buffer")

Map("n", "<C-h>", "<C-w>h", "Move to the window to the left")
Map("n", "<C-j>", "<C-w>j", "Move to the window below")
Map("n", "<C-k>", "<C-w>k", "Move to the window above")
Map("n", "<C-l>", "<C-w>l", "Move to the window to the right")
