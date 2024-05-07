
require("lazy").setup({
	{'wbthomason/packer.nvim'},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{'lewis6991/impatient.nvim'},
	{'nvim-lua/plenary.nvim'},
	{'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').load_extension('metals')
		end
	},

	-- Colorschemes
	{'kaicataldo/material.vim'},
	{
		'folke/tokyonight.nvim',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
	{'lvimuser/lsp-inlayhints.nvim',
		config = function() 
			require("lsp-inlayhints").setup()
		end
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
	{'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			{'nvim-treesitter/nvim-treesitter'}, -- optional
			{'nvim-tree/nvim-web-devicons'}     -- optional
		}
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
		'barrett-ruth/live-server.nvim',
		build = 'pnpm add -g live-server',
		cmd = { 'LiveServerStart', 'LiveServerStop' },
		config = true
	},
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
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
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
	-- {'bhurlow/vim-parinfer'},
	{'eraserhd/parinfer-rust',
		build = "cargo build --release"
	},


	-- Rust
	{  'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		ft = { 'rust' },
		config = function()
			vim.g.rustaceanvim = {
				-- Plugin configuration
				-- tools = {},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						if vim.lsp.inlay_hint then	-- you can also put keymaps in here
							vim.lsp.inlay_hint.enable(bufnr, true)
						end
					end,
					},
				}
			end,
	},

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

	{ "rcarriga/nvim-dap-ui",
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
	config = function()
		require("dapui").setup()
	end

},

	-- Justfiles
	{'NoahTheDuke/vim-just'},

	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup()
			vim.keymap.set("n", "<localleader>ee", require("rest-nvim").run, {desc = "hover.nvim"})
		end,
	},

	{ "scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"mfussenegger/nvim-dap",
			config = function(self, opts)
				-- Debug settings if you're using nvim-dap
				local dap = require("dap")

				dap.configurations.scala = {
					{
						type = "scala",
						request = "launch",
						name = "RunOrTest",
						metals = {
							runType = "runOrTestFile",
							--args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
						},
					},
					{
						type = "scala",
						request = "launch",
						name = "Test Target",
						metals = {
							runType = "testTarget",
						},
					},
				}
			end
		},
	},
	ft = { "scala", "sbt", "java" },
	opts = function()
		local metals_config = require("metals").bare_config()

		-- Example of settings
		metals_config.settings = {
			showImplicitArguments = true,
		}

		-- *READ THIS*
		-- I *highly* recommend setting statusBarProvider to true, however if you do,
		-- you *have* to have a setting to display this in your statusline or else
		-- you'll not see any messages from metals. There is more info in the help
		-- docs about this
		metals_config.init_options.statusBarProvider = "on"

		-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
		metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

		metals_config.on_attach = function(client, bufnr)
			require("metals").setup_dap()
			function map(mode, key, result)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set(mode, key, result, bufopts)
			end


			require("dap").configurations.scala = {
				{
					type = "scala",
					request = "launch",
					name = "Run or Test Target",
					metals = {
						runType = "runOrTestFile",
					},
				},
				{
					type = "scala",
					request = "launch",
					name = "Test Target",
					metals = {
						runType = "testTarget",
					},
				},
			}

			-- LSP mappings
			map("n", "gD", vim.lsp.buf.definition)
			map("n", "K", vim.lsp.buf.hover)
			map("n", "gi", vim.lsp.buf.implementation)
			map("n", "gr", vim.lsp.buf.references)
			map("n", "gds", vim.lsp.buf.document_symbol)
			map("n", "gws", vim.lsp.buf.workspace_symbol)
			map("n", "<leader>cl", vim.lsp.codelens.run)
			map("n", "<leader>sh", vim.lsp.buf.signature_help)
			map("n", "<leader>rn", vim.lsp.buf.rename)
			map("n", "<leader>f", vim.lsp.buf.format)
			map("n", "<leader>ca", vim.lsp.buf.code_action)
			map("n", "<leader>ct", function()
				require("telescope").extensions.metals.commands()
			end
			)


			map("n", "<leader>ws", function()
				require("metals").hover_worksheet()
			end)

			-- all workspace diagnostics
			map("n", "<leader>aa", vim.diagnostic.setqflist)

			-- all workspace errors
			map("n", "<leader>ae", function()
				vim.diagnostic.setqflist({ severity = "E" })
			end)

			-- all workspace warnings
			map("n", "<leader>aw", function()
				vim.diagnostic.setqflist({ severity = "W" })
			end)

			-- buffer diagnostics only
			map("n", "<leader>d", vim.diagnostic.setloclist)

			map("n", "[c", function()
				vim.diagnostic.goto_prev({ wrap = false })
			end)

			map("n", "]c", function()
				vim.diagnostic.goto_next({ wrap = false })
			end)

			-- Example mappings for usage with nvim-dap. If you don't use that, you can
			-- skip these
			map("n", "<leader>dc", function()
				require("dap").continue()
			end)

			map("n", "<leader>dr", function()
				require("dap").repl.toggle()
			end)

			map("n", "<leader>dK", function()
				require("dap.ui.widgets").hover()
			end)

			map("n", "<leader>dt", function()
				require("dap").toggle_breakpoint()
			end)


			map("n", "<leader>dso", function()
				require("dap").step_over()
			end)

			map("n", "<leader>dsi", function()
				require("dap").step_into()
			end)

			map("n", "<leader>dl", function()
				require("dap").run_last()
			end)
		end

		return metals_config
	end,
	config = function(self, metals_config)
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end
}

	


})


