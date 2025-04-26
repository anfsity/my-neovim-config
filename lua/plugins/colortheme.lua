
-- vim.g.sonokai_style = 'default'
-- vim.g.sonokai_style = 'atlantis'
-- vim.g.sonokai_style = 'andromeda' -- 示例：选择 andromeda 风格
vim.g.sonokai_style = 'shusia'
-- vim.g.sonokai_style = 'maia'
-- vim.g.sonokai_style = 'espresso'

vim.g.sonokai_transparent_background = 1

-- vim.cmd.colorscheme "catppuccin-mocha"
local status_ok, _ = pcall(vim.cmd, "colorscheme sonokai") 

