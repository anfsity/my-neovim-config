local M = {}

--- @type table
M.nvim_tree = {
    filters = {
        dotfiles = false,
        git_ignored = false,
        custom = { "\\.git", "\\.cache" },
    },

    renderer = {
        root_folder_label = ":~:s?$?/..?",
    },

}

return M
