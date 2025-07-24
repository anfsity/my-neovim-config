vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- insert mode --
-- vim.keymap.set("i", "<capslock>", "<ESC>")


-- vision mode --
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "向下移动选中内容", silent = true })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "向上移动选中内容", silent = true })
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "全选文件", silent = true })-- 窗口管理

vim.keymap.set('n', '<Leader>c', '<Cmd>bdelete<CR>', { desc = 'Close current buffer' })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "垂直分屏", silent = true })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "水平分屏", silent = true })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "取消搜索高亮", silent = true })


-- 文件操作
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "保存文件" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "退出窗口" })


-- plugins -- 
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- swap buffer --
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")

