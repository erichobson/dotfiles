--          ╭─────────────────────────────────────────────────────────╮
--          │                        lazy.nvim                        │
--          │           https://github.com/folke/lazy.nvim            │
--          ╰─────────────────────────────────────────────────────────╯
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local result = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln("Failed to clone lazy.nvim: " .. result)
    end
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("lazy").setup({
    spec = { { import = "plugins" } },
    checker = { enabled = true },
})
