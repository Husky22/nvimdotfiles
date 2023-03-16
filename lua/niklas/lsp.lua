
-- LSP + Mason Setup
require("mason").setup()

vim.opt.completeopt = {'menu','menuone','noselect'}

luasnip = require'luasnip'

-- nvim-cmp setup
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-f>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = {
		{ name = 'nvim_lsp', max_item_count=15 },
		{ name = 'orgmode' },
		{ name = 'gh_issues' },
		{ name = 'cmp_jira' },
		{ name = 'conjure' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'calc' },
		{ name = 'path' },
		{ name = 'buffer', keyword_length = 3 },
		-- { name = 'ultisnips' }, -- For ultisnips users.
	},
	formatting= {
		format = require 'lspkind'.cmp_format{
			mode = 'symbol_text',
			ellipsis_char = '...',
			maxwidth = 50,
			menu = {
				nvim_lsp = "[lsp]",
				luasnip = "[snip]",
				buffer = "[buf]",
				nvim_lua = "[api]",
				gh_issues = "[issues]",
			},
		},
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

vim.diagnostic.config({
	virtual_text = false,
	float = {
		show_header = true,
		source = 'if_many',
		focusable = false,
	},
})

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Mappings.
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<localleader>k', vim.lsp.buf.hover , bufopts)
    vim.keymap.set('n', '<localleader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<localleader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<localleader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<localleader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<localleader>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<localleader>do', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<localleader>f", vim.lsp.buf.format, bufopts)
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['pyright'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require('lspconfig')['pylsp'].setup {
	-- capabilities = capabilities,
	-- on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {enabled = false},
				pyflakes = {enabled = false},
			},
		},
	},
}

require('lspconfig')['elmls'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require('lspconfig')['rust_analyzer'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = on_attach
    },
})

-- Jira completion capability
require("cmp_jira").setup({
	filetypes = {"gitcommit"},
	jira = {
		email = "niklas@intravisiongroup.com",
		url = "https://intravisiongroup.atlassian.net",
		jql = "assignee=%s+and+resolution=unresolved",
	}

})

-- Setup snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- Tab as jump key
vim.keymap.set("i", '<Tab>', function()
	return luasnip.expand_or_jumpable() == true and luasnip.expand_or_jump() or '<Tab>'
end,
{expr = true, silent = true})
