-- Function to map a key combination
function Map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- **Save and Quit**
Map("n", "<leader>w", "<cmd>update<CR>", "Save Buffer")
Map("n", "<leader>q", "<cmd>quit<CR>", "Quit Buffer")

-- **Buffer Navigation**
Map("n", "<S-h>", ":bprevious<CR>", "Previous Buffer")
Map("n", "<S-l>", ":bnext<CR>", "Next Buffer")
Map("n", "<leader>c", ":bdelete<CR>", "Close Buffer")
Map("n", "<leader>bl", ":buffers<CR>", "List Buffers")
Map("n", "<leader>bo", ":%bd|e#|bd#<CR>", "Close Other Buffers")
Map("n", "<leader>bh", ":bufdo bd<CR>", "Close Hidden Buffers")
Map("n", "<leader><leader>", "<C-^>", "Switch to Last Buffer")

-- **Window Management**
Map("n", "<leader>sv", "<C-w>v", "Vertical Split Window")
Map("n", "<leader>sh", "<C-w>s", "Horizontal Split Window")
Map("n", "<leader>se", "<C-w>=", "Equalize Window Sizes")
Map("n", "<leader>sx", ":close<CR>", "Close Current Split Window")
Map("n", "<leader>wm", "<C-w>_|<C-w>|", "Maximize Current Window")
Map("n", "<leader>we", "<C-w>=", "Equalize Window Sizes")

-- **Resize Windows**
Map("n", "<C-Up>", ":resize +2<CR>", "Increase Height")
Map("n", "<C-Down>", ":resize -2<CR>", "Decrease Height")
Map("n", "<C-Left>", ":vertical resize -2<CR>", "Decrease Width")
Map("n", "<C-Right>", ":vertical resize +2<CR>", "Increase Width")

-- **Navigate Windows**
Map("n", "<C-h>", "<C-w>h", "Move to the left window")
Map("n", "<C-j>", "<C-w>j", "Move to the window below")
Map("n", "<C-k>", "<C-w>k", "Move to the window above")
Map("n", "<C-l>", "<C-w>l", "Move to the right window")

-- **Move between split panes with Alt + Arrow keys**
Map("n", "<A-Up>", "<C-w>k", "Move to Upper Split")
Map("n", "<A-Down>", "<C-w>j", "Move to Lower Split")
Map("n", "<A-Left>", "<C-w>h", "Move to Left Split")
Map("n", "<A-Right>", "<C-w>l", "Move to Right Split")

-- **Tab Management**
Map("n", "<leader>tn", ":tabnew<CR>", "New Tab")
Map("n", "<leader>tx", ":tabclose<CR>", "Close Current Tab")
Map("n", "<leader>tl", ":tabnext<CR>", "Next Tab")
Map("n", "<leader>th", ":tabprevious<CR>", "Previous Tab")
Map("n", "<leader>wt", "<C-w>T", "Move Window to New Tab")

-- **Moving Lines Up and Down**
Map("n", "<A-j>", ":m .+1<CR>==", "Move Line Down")
Map("n", "<A-k>", ":m .-2<CR>==", "Move Line Up")
Map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move Selection Down")
Map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move Selection Up")

-- **Quickfix Navigation**
Map("n", "<C-n>", ":cnext<CR>", "Next Quickfix Item")
Map("n", "<C-p>", ":cprev<CR>", "Previous Quickfix Item")

-- **Search Enhancements**
Map("n", "<leader>h", ":nohlsearch<CR>", "Clear Search Highlighting")
Map("n", "n", "nzzzv", "Next Search Result Centered")
Map("n", "N", "Nzzzv", "Previous Search Result Centered")
Map("n", "<leader>rw", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace Word Under Cursor")
Map("v", "//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", "Search Selected Text")
Map("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", "Replace Word Under Cursor Globally")
Map("v", "<leader>r", 'y:%s/<C-r>"/', "Replace Selected Text Globally")

-- **Text Editing**
Map("n", "J", "mzJ`z", "Join Lines and Keep Cursor Position")
Map("n", "Q", "<nop>", "Disable Ex Mode")
Map("n", "<leader>d", "yyp", "Duplicate Current Line")
Map("n", "%", "%", "Go to Matching Pair")
Map("n", "<leader>=", "gg=G``", "Auto-Indent Entire File")
Map("n", "<leader>a", "ggVG", "Select All Text")
Map("v", "<", "<gv", "Shift Left and Reselect")
Map("v", ">", ">gv", "Shift Right and Reselect")

-- **Navigation Shortcuts**
Map("n", "H", "^", "Go to Beginning of Line")
Map("n", "L", "$", "Go to End of Line")
Map("n", "j", "gj", "Move Down by Display Line")
Map("n", "k", "gk", "Move Up by Display Line")

-- **Spell Checking**
Map("n", "<leader>ss", ":setlocal spell! spelllang=en_us<CR>", "Toggle Spell Check")
Map("n", "<leader>s=", "z=", "Correct Misspelled Word")
Map("n", "<leader>sn", "]s", "Next Misspelled Word")
Map("n", "<leader>sp", "[s", "Previous Misspelled Word")

-- **Clipboard Operations**
Map("n", "<leader>P", '"+p', "Paste from System Clipboard After Cursor")
Map("n", "<leader>p", '"+P', "Paste from System Clipboard Before Cursor")
Map("v", "<leader>y", '"+y', "Yank Selection to System Clipboard")
Map("n", "<leader>Y", '"+yg_', "Yank to End of Line to System Clipboard")
Map("n", "<leader>rp", ":let @+ = expand('%')<CR>", "Copy Relative File Path")

-- **Window Actions**
Map("n", "<leader>wa", ":wall<CR>", "Save All Buffers")

-- **LSP Mappings**
Map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", "Format Code")
Map("n", "<leader>ai", ":set autoindent!<CR>", "Toggle Auto-Indent")
Map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show Code Actions")
Map("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show Signature Help")

-- **Terminal Mode Enhancements**
Map("t", "<Esc>", [[<C-\><C-n>]], "Exit Terminal Mode")
Map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], "Move to Left Split")
Map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], "Move to Lower Split")
Map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], "Move to Upper Split")
Map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], "Move to Right Split")
