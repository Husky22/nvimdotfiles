local bind = vim.keymap.set
local remap = {remap = true}
local stdopt = {noremap = true, silent = true}

---------------------------------
-- Refactor
---------------------------------

-- Remaps for the refactoring operations currently offered by the plugin
bind("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
bind("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
bind("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
bind("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
bind("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
bind("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
bind("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

bind(
	"n",
	"<leader>rp",
	":lua require('refactoring').debug.printf({below = false})<CR>",
	{ noremap = true }
)
bind("n", "<leader>rv", ":lua require('refactoring').debug.print_var({ normal = true })<CR>", stdopt)
-- Remap in visual mode will print whatever is in the visual selection
bind("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>", stdopt)

-- Cleanup function: this remap should be made in normal mode
bind("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", stdopt)


bind("n", "<leader>c<leader>", ":lua require('Comment.api').toggle.linewise.current()<CR>", stdopt)
bind("v", "<leader>c<leader>", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", stdopt)

---------------------------------
-- Change Window
---------------------------------
bind("n", "<C-h>", "<C-w>h", stdopt)
bind("n", "<C-l>", "<C-w>l", stdopt)


---------------------------------
-- FZF Path completion
---------------------------------
local fzf_path_fn = function ()
	vim.fn['fzf#vim#complete#path']('fd')
end

bind("i", "<C-x><C-f>", fzf_path_fn, { noremap = true, expr = true})



---------------------------------
-- Select Last Pasted Text
---------------------------------
bind("n", "gp", '`['.. vim.fn.strpart(vim.fn.getregtype(), 0, 1)..'`]', {silent = true, desc = "VISUAL select last changed area"})


---------------------------------
-- Very Magic
---------------------------------
bind('n', '/', '/\\v', { noremap = true })
bind('v', '/', '/\\v', { noremap = true })
bind('n', '?', '?\\v', { noremap = true })
bind('v', '?', '?\\v', { noremap = true })



---------------------------------
-- NeoTest
---------------------------------
bind('n', '<leader>Tf', ":lua require('neotest').run.run()<CR>", { silent = true, desc = "Run nearest test" })
bind('n', '<leader>Ta', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { silent = true, desc = "Run tests in file" })
bind('n', '<leader>Ts', ":lua require('neotest').run.stop()<CR>", { silent = true, desc = "Stop test" })
bind('n', '<leader>To', ":lua require('neotest').output.open({enter = true})<CR>", { silent = true, desc = "Open test results" })


---------------------------------
-- QF Helper
---------------------------------
bind('n', '<C-N>', ':QNext<CR>', {silent = true})
bind('n', '<C-P>', ':QPrev<CR>', {silent = true})

vim.g.copilot_no_tab_map = true
bind("i", "<C-g>", 'copilot#Accept("<CR>")', {noremap=true, silent = true, expr = true, replace_keycodes = false})


