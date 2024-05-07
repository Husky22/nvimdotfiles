vim.opt.signcolumn = "yes"


local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
    rust_analyzer = lsp.noop,
  }
})

local cmp = require('cmp')
cmp.setup {
	sources = {
		{name = 'conjure'},
	}
}

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
	  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-d>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<C-f>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  })
})

lsp.skip_server_setup({'rust_analyzer'})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
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
end)

if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>uh", function() if vim.lsp.inlay_hint.is_enabled() then vim.lsp.inlay_hint.enable(0, false) else vim.lsp.inlay_hint.enable(0, true) end end, { desc = "Toggle Inlay Hints" })
end


lsp.setup()


vim.diagnostic.config({
	virtual_text = false,
	float = {
		show_header = true,
		source = 'if_many',
		focusable = false,
	},
})





