require "nvchad.options"

local o = vim.o
local opt = vim.opt
-------------------- options ---------------------

-- Common
o.cursorlineopt ='both'

o.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Indenting
-- o.expandtab = false
o.shiftwidth = 4
o.showmode = true
o.tabstop = 4
o.softtabstop = 4

