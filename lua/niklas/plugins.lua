
require("lazy").setup({
	{'wbthomason/packer.nvim'},
	{'lewis6991/impatient.nvim'},
	{'nvim-lua/plenary.nvim'},

	-- Colorschemes
	{'kaicataldo/material.vim'},
	{
		'folke/tokyonight.nvim',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	-- LSP
	{'williamboman/mason.nvim'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-nvim-lsp-signature-help'},
	{'hrsh7th/cmp-nvim-lua'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/cmp-calc'},
	{'https://gitlab.com/msvechla/cmp-jira.git'},
	{'hrsh7th/nvim-cmp'},
	{'onsails/lspkind-nvim'},

	-- Snippets
	{'L3MON4D3/LuaSnip'},
	{'saadparwaiz1/cmp_luasnip'},
	{'rafamadriz/friendly-snippets'},

	-- Treesitter
	{'nvim-treesitter/nvim-treesitter-textobjects'},
	{'RRethy/nvim-treesitter-textsubjects'},
	{'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},

	-- Which-key
	{'folke/which-key.nvim'},


	-- Statusline
	{'nvim-lualine/lualine.nvim'},

	-- Editing
	{'machakann/vim-sandwich'},
	{'jiangmiao/auto-pairs'},
	{'tommcdo/vim-exchange'},


	-- Magic Regex
	{'coot/EnchantedVim',
		dependencies = {
			{'coot/CRDispatcher'},

		},
	},

	-- Commenting
	{ 'numToStr/Comment.nvim'},

	-- Fuzzy Finding
	{ 'junegunn/fzf', run = './install --bin', },
	{ 'junegunn/fzf.vim' },
	{ 'ibhagwan/fzf-lua',
		-- optional for icon support
		dependencies = { 'kyazdani42/nvim-web-devicons' },
	},

	-- Git
	{'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},

	-- Hovering
	{
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
	},

	-- Tools
	{"svermeulen/vim-subversive"},


	{
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
	},

	-- Interactive Coding
	{'Olical/conjure'},
	{'PaterJason/cmp-conjure'},
	{'tpope/vim-dispatch'},
	{'clojure-vim/vim-jack-in'},
	{'radenling/vim-dispatch-neovim'},

	-- Python
	-- use 'vim-scripts/indentpython.vim'


	-- FileTree
	{'kyazdani42/nvim-web-devicons'},
	{'kyazdani42/nvim-tree.lua',
		config = function()
			require 'nvim-tree'.setup()
		end,
	},

	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
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
	},


	-- Visual Help
	{'psliwka/vim-smoothie'},

	-- Macro Debugging
	{'rbong/vim-buffest'},

	{'stevearc/qf_helper.nvim',
		config = function()
			require('qf_helper').setup()
		end,
	},

	-- Tpope
	{'tpope/vim-unimpaired'},
	{'tpope/vim-repeat'},
	{'tpope/vim-abolish'},

	-- Git
	{'tpope/vim-fugitive'},
	{'tpope/vim-rhubarb'},
	{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },

	-- S-Expressions
	{ 'guns/vim-sexp',
		ft = 'clojure',
	},
	{'bhurlow/vim-parinfer'},


	-- Rust
	{'simrat39/rust-tools.nvim',
		ft = 'rust',
	},

	-- EditorConfig
	{ 'editorconfig/editorconfig-vim'},

	-- Go
	{ 'ray-x/go.nvim',
		ft = 'go',
	},
	{ 'ray-x/guihua.lua'},

})


