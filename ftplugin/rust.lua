local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n", 
  "<localleader>a", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n", 
  "<localleader>k", 
  function()
    vim.cmd.RustLsp {'hover', 'actions'}
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n", 
  "<localleader>d", 
  function()
	  vim.lsp.buf.hover()
  end,
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n", 
  "<localleader>e", 
  function()
	  vim.cmd.RustLsp('renderDiagnostic')
  end,
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n", 
  "<localleader>t", 
  function()
	  vim.cmd.RustLsp('testables')
  end,
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  { silent = true, buffer = bufnr }
)
