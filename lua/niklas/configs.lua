-- Vim Sandwich use Surround keymaps
vim.cmd[[runtime macros/sandwich/keymap/surround.vim]]

-- Vim Magic
vim.cmd[[
let g:VeryMagic = 0
]]
-- vim.cmd[[
-- 	let g:VeryMagic = 0
-- 	nnoremap / /\v
-- 	nnoremap ? ?\v
-- 	vnoremap / /\v
-- 	vnoremap ? ?\v
-- 	noremap // //
-- 	noremap ?? ??
--
-- 	let g:VeryMagicSubstituteNormalise = 1
-- 	let g:VeryMagicSubstitute = 1
-- 	let g:VeryMagicGlobal = 1
-- 	let g:VeryMagicVimGrep = 1
-- 	let g:VeryMagicSearchArg = 1
-- 	let g:VeryMagicFunction = 1
-- 	let g:VeryMagicHelpgrep = 1
-- 	let g:VeryMagicRange = 1
-- 	let g:VeryMagicEscapeBackslashesInSearchArg = 1
-- 	let g:SortEditArgs = 1
-- ]]

-- Only one statusline
-- vim.cmd[[set laststatus=3]]
--
--


-- Conjure Rust
vim.g['conjure#extract#tree_sitter#enabled'] = true

require("go").setup()

vim.g.copilot_enabled = false
