local status, telescope = pcall(require, "telescope")

if not status then
    print("Telescope is not installed")
end
local actions = require('telescope.actions')

local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

telescope.setup {

    defaults = {
        prompt_prefix = "⌕ ",
        selection_caret = "➜ ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git", "node_modules" },
        layout_config = {
            vertical = {
                width = 0.8
            }
            -- other layout configuration here
        }
        -- other defaults configuration here
    },
    picker = {
        find_files = {
            themes = "dropdown",
        },
        git_files = {
            themes = "dropdown",
            winblend = 10,
            height = 10
        }
    },

    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
        -- other configuration values here
    } }
require('telescope').load_extension('media_files')
