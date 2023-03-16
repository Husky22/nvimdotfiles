
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<CR>',
			scope_incremental = '<CR>',
			node_incremental = '<TAB>',
			node_decremental = '<S-TAB>',
		},
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = {query = "@function.inner", desc = "Select inner part of function region"},
				["ia"] = {query = "@parameter.inner", desc = "Select inner part of parameter region"},
				["aa"] = {query = "@parameter.outer", desc = "Select outer part of parameter region"},
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
		},
	},
})
