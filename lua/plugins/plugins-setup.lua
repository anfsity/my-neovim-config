-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

-- themes config  
  use 'shaunsingh/nord.nvim'
  use 'rose-pine/neovim'
  use 'sainnhe/sonokai'
  use "olimorris/onedarkpro.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }



  use {
    'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
  }
  use {
    'nvim-tree/nvim-tree.lua',  -- 文档树
    requires = {
      'nvim-tree/nvim-web-devicons', -- 文档树图标
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use "HiPhish/rainbow-delimiters.nvim" -- 配合treesitter，不同括号颜色区分
  use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }
    -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
  })
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号
  use "mg979/vim-visual-multi"

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

-- remove it 
  -- use {
  --   'xeluxee/competitest.nvim',
  --   requires = 'MunifTanjim/nui.nvim',
    -- config = function() require('competitest').setup() end
  -- }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'mg979/vim-visual-multi'
  use 'folke/which-key.nvim'


  use 'nvim-tree/nvim-web-devicons'
  use 'echasnovski/mini.icons'

  use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'echasnovski/mini.nvim', opt = true },
    requires = { 'echasnovski/mini.icons', opt = true },
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('render-markdown').setup({})
    end,
  })
  if packer_bootstrap then
    require('packer').sync()
  end
end)
