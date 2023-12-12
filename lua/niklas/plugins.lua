
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
	{'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'hrsh7th/cmp-calc'},         -- Optional
			{'hrsh7th/cmp-cmdline'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},


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
	{"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim",        -- optional
		"ibhagwan/fzf-lua",              -- optional
	},
	config = true},

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

	-- Trailblazer faster marks
	{'LeonHeidelbach/trailblazer.nvim',
		config=function()
			require("trailblazer").setup()
		end,
	},
	{"shortcuts/no-neck-pain.nvim", version = "*"},
	-- Copilot
	{'github/copilot.vim'},

	-- Firenvim
	{'glacambre/firenvim',

	-- Lazy load firenvim
	-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
	cond = not not vim.g.started_by_firenvim,
	build = function()
		require("lazy").load({ plugins = "firenvim", wait = true })
		vim.fn["firenvim#install"](0)
	end
	},

	-- Justfiles
	{'NoahTheDuke/vim-just'},

	{"rest-nvim/rest.nvim",
	dependencies = "nvim-lua/plenary.nvim" ,
	config = function()
		require("rest-nvim").setup({
			-- Open request results in a horizontal split
			result_split_horizontal = false,
			-- Keep the http file buffer above|left when split horizontal|vertical
			result_split_in_place = false,
			-- Skip SSL verification, useful for unknown certificates
			skip_ssl_verification = false,
			-- Encode URL before making request
			encode_url = true,
			-- Highlight request on run
			highlight = {
				enabled = true,
				timeout = 150,
			},
			result = {
				-- toggle showing URL, HTTP info, headers at top the of result window
				show_url = true,
				-- show the generated curl command in case you want to launch
				-- the same request via the terminal (can be verbose)
				show_curl_command = false,
				show_http_info = true,
				show_headers = true,
				-- executables or functions for formatting response body [optional]
				-- set them to false if you want to disable them
				formatters = {
					json = "jq",
					html = function(body)
						return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
					end
				},
			},
			-- Jump to request line on run
			jump_to_request = false,
			env_file = '.env',
			custom_dynamic_variables = {},
			yank_dry_run = true,
		})
		vim.keymap.set("n", "<localleader>ee", require("rest-nvim").run, {desc = "hover.nvim"})
	end
	}
	


})


