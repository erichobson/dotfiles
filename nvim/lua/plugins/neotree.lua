return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',       -- Common utilities
        'nvim-tree/nvim-web-devicons', -- File icons
        'MunifTanjim/nui.nvim',        -- UI component library
        '3rd/image.nvim',
    },
    config = function()
        require('neo-tree').setup({

            close_if_last_window = true,    -- Close Neo-tree if it's the last window
            popup_border_style = 'NC',  -- Border style of the Neo-tree window
            enable_git_status = true,       -- Show git status icons
            enable_diagnostics = true,      -- Show diagnostics icons

            -- Filesystem configuration
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,   -- Show hidden files
                    hide_gitignored = false, -- Hide gitignored files
                    never_show = {
                        '.DS_Store',
                        'thumbs.db'
                    },                                  -- Never show files
                },
                follow_current_file_enabled = true,             -- Follow the current file in the tree
                hijack_netrw_behavior = 'open_default', -- Replace netrw with Neo-tree
                use_libuv_file_watcher = true,          -- Use libuv for file watching
            },

            -- Window settings
            window = {
                position = 'left',     -- Neo-tree window position
                width = 30,            -- Width of the Neo-tree window
                mappings = {
                    ['<CR>'] = 'open', -- Open file or directory
                    ['l'] = 'open',
                    ['h'] = 'close_node',
                    ['<Tab>'] = 'preview', -- Preview file or directory
                    ['r'] = 'refresh',     -- Refresh the tree
                    ['a'] = 'add',         -- Add a new file or directory
                    ['d'] = 'delete',      -- Delete a file or directory
                    ['R'] = 'rename',      -- Rename a file or directory
                },
            },

            -- Default component settings
            default_component_configs = {
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = '',
                    default = '',
                },
                git_status = {
                    symbols = {
                        added = '✚',
                        modified = '',
                        deleted = '✖',
                        renamed = '',
                        untracked = '',
                        ignored = '',
                        unstaged = '',
                        staged = '',
                        conflict = '',
                    },
                },
            },
        })

        -- Keybindings to toggle Neo-tree
        Map('n', '<leader>e', '<CMD>Neotree toggle<CR>', 'Toggle Neotree')
        Map('n', '<leader>r', '<CMD>Neotree focus<CR>', 'Focus NeoTree')
    end,
}
