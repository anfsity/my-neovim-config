vim.diagnostic.config({
  virtual_text = true,
})

require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
  },
})

vim.opt.foldcolumn = '1';
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

require('ufo').setup({
provider_selector = function(bufnr, filetype, buftype)
-- 优先使用 LSP，然后 Treesitter，最后 indent
return {'lsp'}
end
})

local base_capabilities = require('cmp_nvim_lsp').default_capabilities()

local capabilities = vim.tbl_deep_extend('force', base_capabilities, {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
        -- 这里会自动合并 cmp_nvim_lsp 提供的其他 textDocument capabilities
    }
    -- 这里会自动合并 cmp_nvim_lsp 提供的 workspace capabilities
})


-- Lua配置
require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

-- C++配置
require("lspconfig").clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--completion-style=detailed",
    "--query-driver=/usr/bin/g++"
  },
  filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
  init_options = {
    fallbackFlags = {"-std=c++23"}
  },
}
