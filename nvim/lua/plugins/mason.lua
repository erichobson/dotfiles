--          ╭─────────────────────────────────────────────────────────╮
--          │                       mason.nvim                        │
--          │       https://github.com/williamboman/mason.nvim        │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "williamboman/mason.nvim",
    dependencies = {
        "Zeioth/mason-extra-cmds",
        opts = {},
    },
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
        "MasonUpdate",
        "MasonUpdateAll",
    },
    lazy = false,
    config = true,
}
