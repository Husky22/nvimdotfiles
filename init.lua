-- Vim Basics
-- ====================
-- Leader Key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.python3_host_prog = "~/.virtualenvs/neovim/bin/python3.9"



vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false


-- Buffer Switch
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':b#<CR>', {silent=true, noremap=true})


-- Deactivate Highlight with Esc
vim.api.nvim_set_keymap('', '<esc>', '<esc>:noh<CR><esc>', {silent=true, noremap=true})


-- j/k dont skip wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', {silent=true, noremap=true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {silent=true, noremap=true})


-- Keep selection after indenting
vim.api.nvim_set_keymap('v', '>', '>gv', {silent=true, noremap=true})
vim.api.nvim_set_keymap('v', '<', '<gc', {silent=true, noremap=true})


-- UndoDir
vim.opt.undodir = vim.fn.expand("~/.vim/undo-dir")
vim.opt.undofile = true

-- Faster Loading
require 'impatient'.enable_profile()


-- Reload all my lua files even though they are cached
function _G.reload_nvim_conf()
  for name,_ in pairs(package.loaded) do
    if name:match('^niklas') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end 

vim.api.nvim_create_user_command('ReloadConfig', 'lua reload_nvim_conf()', {})


-- Load Packer Plugins
require 'niklas.plugins'


-- Colorschemes Setup
require 'niklas.colorscheme'


-- Load Lsp
require 'niklas.lsp'


-- Load which-key
require 'niklas.whichkey'


-- Load lualine
require 'niklas.lualine'


-- Load Treesitter Config
require 'niklas.treesitter'


-- Load keymaps
require 'niklas.keymaps'


-- Load configs
require 'niklas.configs'


-- Load Macros
require 'niklas.macros'
