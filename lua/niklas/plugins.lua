-- Packer bootstrapping to automatically install on each system
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


require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'nvim-lua/plenary.nvim'
  
  -- Colorschemes
  use 'kaicataldo/material.vim'
  use 'folke/tokyonight.nvim'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-calc'
  use 'https://gitlab.com/msvechla/cmp-jira.git'
  use 'hrsh7th/nvim-cmp'
  use "onsails/lspkind-nvim"

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter-textobjects"}
  use {"RRethy/nvim-treesitter-textsubjects"}
  use {'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  -- Which-key
  use 'folke/which-key.nvim'


  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Editing
  use 'machakann/vim-sandwich'
  use 'jiangmiao/auto-pairs'
  use 'tommcdo/vim-exchange'

  -- Refactoring
  use {
	  "ThePrimeagen/refactoring.nvim",
	  requires = {
		  {"nvim-lua/plenary.nvim"},
		  {"nvim-treesitter/nvim-treesitter"}
	  },
	  config = function()
		  require('refactoring').setup({})
	  end,
  }

  -- Magic Regex
  use {'coot/EnchantedVim',
	  requires = {
		  {'coot/CRDispatcher'},

	  },
	  config = function ()
	  end,
  }

  -- Commenting
  use {
	  'numToStr/Comment.nvim',
  }

  -- Fuzzy Finding
  use { 'junegunn/fzf', run = './install --bin', }
  use { 'junegunn/fzf.vim' }
  use { 'ibhagwan/fzf-lua',
	  -- optional for icon support
	  requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Git
  use {'lewis6991/gitsigns.nvim',
  config = function()
	  require('gitsigns').setup()
  end
  }

  -- Hovering
  use {
	  "lewis6991/hover.nvim",
	  config = function()
		  require("hover").setup {
			  init = function()
				  -- Require providers
				  require('hover.providers.lsp')
				  require('hover.providers.jira')
				  require('hover.providers.gh')
				  -- require('hover.providers.man')
				  -- require('hover.providers.dictionary')
			  end,
			  preview_opts = {
				  border = nil
			  },
			  -- Whether the contents of a currently open hover window should be moved
			  -- to a :h preview-window when pressing the hover keymap.
			  preview_window = false,
			  title = true
		  }

		  -- Setup keymaps
		  vim.keymap.set("n", "<localleader>i", require("hover").hover, {desc = "hover.nvim"})
	  end
  }

  -- Tools
  use {"svermeulen/vim-subversive"}


  use {
	  "smjonas/live-command.nvim",
	  -- live-command supports semantic versioning via tags
	  -- tag = "1.*",
	  config = function()
		  require("live-command").setup {
			  commands = {
				  Norm = { cmd = "norm" },
			  },
		  }
	  end,
  }

  -- Interactive Coding
  use 'Olical/conjure'
  use 'PaterJason/cmp-conjure'
  use 'tpope/vim-dispatch'
  use 'clojure-vim/vim-jack-in'
  use 'radenling/vim-dispatch-neovim'

  -- Python
  -- use 'vim-scripts/indentpython.vim'
  

  -- FileTree
  use {'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua',
  config = function()
	  require 'nvim-tree'.setup()
  end}

  -- Testing
  use {
	  "nvim-neotest/neotest",
	  requires = {
		  "nvim-lua/plenary.nvim",
		  "nvim-treesitter/nvim-treesitter",
		  "antoinemadec/FixCursorHold.nvim",
		  "nvim-neotest/neotest-python",
		  "rouge8/neotest-rust",
	  },
	  config = function()
		  require("neotest").setup({
			  adapters = {
				  require("neotest-python")({
					  args = {"--capture", "tee-sys"}
				  }),
				  require("neotest-rust")
			  },
		  })
	  end
  }


   -- Visual Help
   use 'psliwka/vim-smoothie'

   -- Macro Debugging
   use 'rbong/vim-buffest'

   use {'stevearc/qf_helper.nvim',
   config = function()
	   require('qf_helper').setup()
   end
   }

   -- Tpope
   use 'tpope/vim-unimpaired'
   use 'tpope/vim-repeat'
   use 'tpope/vim-abolish'

   -- Git
   use {"tpope/vim-fugitive"}
   use {"tpope/vim-rhubarb"}
   use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

   -- S-Expressions
   use {
	   'guns/vim-sexp',
	   ft = 'clojure',
   }
   use 'bhurlow/vim-parinfer'

   -- Markdown
   use({
	   "iamcco/markdown-preview.nvim",
	   run = function() vim.fn["mkdp#util#install"]() end,
   })


   -- OrgMode
   use {
	   "nvim-neorg/neorg",
	   requires = "nvim-lua/plenary.nvim"
   }

   -- Rust
   use 'simrat39/rust-tools.nvim'

   -- EditorConfig
   use 'editorconfig/editorconfig-vim'

   -- Go
   use 'ray-x/go.nvim'
   use 'ray-x/guihua.lua'

   if packer_bootstrap then
	   require('packer').sync()
   end
end)


