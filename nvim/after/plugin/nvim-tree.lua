local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    return
end

local config_status, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
nvim_tree.setup {
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = ""
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌"
                }
            }
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    view = {
        width = 30,
        side = "right",
        mappings = {
            list = { {
                key = { "l", "<CR>", "o" },
                cb = tree_cb "edit"
            }, {
                key = "h",
                cb = tree_cb "close_node"
            }, {
                key = "v",
                cb = tree_cb "vsplit"
            } }
        }
    }
}
