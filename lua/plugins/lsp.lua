--- @type LazySpec
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

    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false;
        dependencies = {
            "neovim/nvim-lspconfig",
            { "mason-org/mason.nvim", opts = {} },
            "mason-org/mason.nvim",
        },
        opts = function ()
            require("configs.lsp")
            return {}
        end,
    }
}
