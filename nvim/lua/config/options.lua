local M = {}

function M.setup()
    local opt = vim.opt

    ------------------------------------------
    -- Basic Editor Behavior
    ------------------------------------------
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    opt.mouse = "a"
    opt.updatetime = 250
    opt.timeoutlen = 300
    opt.backspace = { "indent", "eol", "start" }
    opt.showcmd = false
    opt.showmode = false

    -- File Encoding and Formats
    opt.encoding = "utf-8"
    opt.fileformats = { "unix", "dos", "mac" }

    -- Clipboard
    opt.clipboard = "unnamedplus"

    ------------------------------------------
    -- UI and Visual Elements
    ------------------------------------------
    opt.termguicolors = true
    opt.cursorline = true
    opt.signcolumn = "yes"
    opt.showmatch = true
    opt.cmdheight = 1
    opt.pumheight = 10
    opt.conceallevel = 1
    opt.title = true
    opt.titlestring = "%<%F%=%l/%L - nvim"

    -- Line Numbers and Display
    opt.number = true
    opt.relativenumber = true
    opt.wrap = true
    opt.linebreak = true
    opt.showbreak = "↪ "
    opt.list = true
    opt.listchars = {
        tab = "» ",
        trail = "·",
        nbsp = "␣",
        extends = "›",
        precedes = "‹",
    }

    -- Scrolling and Viewport
    opt.scrolloff = 6
    opt.sidescrolloff = 4
    opt.smoothscroll = true
    opt.viewoptions:append("cursor")

    ------------------------------------------
    -- Window and Buffer Management
    ------------------------------------------
    opt.splitright = true
    opt.splitbelow = true
    opt.splitkeep = "cursor"
    opt.hidden = true
    opt.autoread = true

    opt.fillchars = {
        eob = " ",
        fold = " ",
        foldopen = "v",
        foldclose = ">",
        foldsep = " ",
        vert = "│",
        horiz = "─",
    }

    ------------------------------------------
    -- Indentation and Formatting
    ------------------------------------------
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.autoindent = true
    opt.smartindent = true
    opt.breakindent = true
    opt.cpoptions:append("_")

    ------------------------------------------
    -- Search and Replace
    ------------------------------------------
    opt.ignorecase = true
    opt.smartcase = true
    opt.hlsearch = true
    opt.incsearch = true
    opt.inccommand = "split"

    if vim.fn.executable("rg") == 1 then
        opt.grepprg = "rg --vimgrep --no-heading --smart-case"
        opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
    end

    ------------------------------------------
    -- File Handling and Backup
    ------------------------------------------
    opt.backup = false
    opt.writebackup = true
    opt.swapfile = true
    opt.directory = vim.fn.stdpath("data") .. "/swap//"
    vim.fn.mkdir(vim.fn.stdpath("data") .. "/swap", "p")
    opt.autowrite = true

    -- Persistent undo settings
    opt.undofile = true
    opt.undodir = vim.fn.expand("~/.local/share/nvim/undo//")
    vim.fn.mkdir(vim.fn.expand("~/.local/share/nvim/undo"), "p")
    opt.undolevels = 10000
    opt.undoreload = 10000

    ------------------------------------------
    -- Completion and Menus
    ------------------------------------------
    opt.wildmenu = true
    opt.wildmode = { "longest", "list", "full" }
    opt.completeopt = { "menu", "menuone", "noselect" }
    opt.shortmess:append("c")

    ------------------------------------------
    -- Code Folding
    ------------------------------------------
    opt.foldenable = true
    opt.foldlevelstart = 99
    opt.foldmethod = "expr"
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    opt.foldtext =
        [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
    opt.foldnestmax = 3

    ------------------------------------------
    -- Performance Optimization
    ------------------------------------------
    opt.lazyredraw = false
    opt.redrawtime = 1500
    opt.ttyfast = true
    opt.maxmempattern = 10000

    ------------------------------------------
    -- Session and View Options
    ------------------------------------------
    opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    ------------------------------------------
    -- Diff Options
    ------------------------------------------
    opt.diffopt:append("algorithm:patience,indent-heuristic,linematch:60")

    ------------------------------------------
    -- Spell Checking
    ------------------------------------------
    opt.spell = false
    opt.spelllang = { "en_us" }
    opt.spellsuggest = "best,9"

    ------------------------------------------
    -- Diagnostics Configuration
    ------------------------------------------
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "●",
                [vim.diagnostic.severity.WARN] = "●",
                [vim.diagnostic.severity.INFO] = "●",
                [vim.diagnostic.severity.HINT] = "●",
            },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "if_many",
            header = "",
            prefix = "",
        },
        virtual_text = {
            spacing = 4,
            prefix = "■",
            format = function(diagnostic)
                if diagnostic.severity == vim.diagnostic.severity.ERROR then
                    return string.format("%s", diagnostic.message)
                end
                return diagnostic.message
            end,
        },
    })
end

return M
