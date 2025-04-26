require'nvim-treesitter.configs'.setup {
  -- 确保安装的解析器
  sync_install = false,
  auto_install = true,
  ensure_installed = {"c", "cpp", "query", "vim", "lua", "vimdoc", "markdown", "markdown_inline"},
  -- 高亮配置
  highlight = {
    -- disable = {
    --   "vimdoc",
    -- },
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- 缩进配置
  indent = {
    enable = true,
  },
}
