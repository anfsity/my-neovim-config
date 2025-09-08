require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "<A-h>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<A-l>", "<End>", { desc = "move end of line" })
map("n", "F", "%", { desc = "jump between match-pair" })


-- use windows like keymaps 
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "file save" })
map({ "n" }, "<C-a>", "ggVG", { desc = "select all file" })
map({ "n", "i", "v" }, "<C-z>", "<cmd> undo <cr>", { desc = "history undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd> redo <cr>", { desc = "history redo" })
map("n", "<C-/>", "gcc", { desc = "comment toggle", remap = true })
map("i", "<C-/>", "<Esc>gcc^i", { desc = "comment toggle", remap = true })


-- visual studio code like keymaps

map("n", "gb", "<C-o>", { desc = "jump back" })
map("n", "gh", "<cmd> lua vim.lsp.buf.hover() <cr>", { desc = "LSP hover" })map("n", "ge", "<cmd> lua vim.diagnostic.open_float() <cr>", { desc = "LSP show diagnostics" })
map("n", "ge", "<cmd> lua vim.diagnostic.open_float() <cr>", { desc = "LSP show diagnostics" })

map({ "n", "i" }, "<A-j>", "<cmd> :m +1 <cr>", { desc = "move one line down "})
map({ "n", "i" }, "<A-k>", "<cmd> :m -2 <cr>", { desc = "move one line up "})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
