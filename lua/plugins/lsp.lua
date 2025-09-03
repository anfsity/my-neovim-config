-- @type LazySpec
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function ()
        require("configs.lsp")
    end,

    {
        "mason-org/mason.nvim",
        lazy = false,
    },
}
