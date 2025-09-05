-- vscode format
require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

-- lua format
-- require("luasnip.loaders.from_lua").load()
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"
require("luasnip.loaders.from_lua").load { paths = vim.g.lua_snippets_path or "" }
require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }
