return {
	"metalelf0/black-metal-theme-neovim",
	lazy = false,
	priority = 1000,
	config = function()
		require("black-metal").setup({
			theme = "windir",
		})
		require("black-metal").load()
	end,
}
-- return {
-- 	{
-- 		dir = "~/projects/aurora-skies", -- Replace with absolute path
-- 		name = "aurora-skies",
-- 		priority = 1000,
-- 		config = function()
-- 			-- Add error handling
-- 			local status_ok, _ = pcall(function()
-- 				-- Try to require the module
-- 				local aurora = require("aurora-skies")
-- 				-- Print to confirm it loaded
-- 				print("Aurora-skies module loaded successfully")
-- 				-- Try to set the colorscheme
-- 				vim.cmd("colorscheme aurora-skies")
-- 			end)
--
-- 			if not status_ok then
-- 				print("Failed to load aurora-skies. Check :messages for error details.")
-- 				-- Fallback to a default colorscheme
-- 				vim.cmd("colorscheme habamax")
-- 			end
-- 		end,
-- 	},
-- }
-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }
-- return {
--   "neanias/everforest-nvim",
--   version = false,
--   lazy = false,
--   priority = 1000, -- make sure to load this before all the other start plugins
--   -- Optional; default configuration will be used if setup isn't called.
-- 	config = function()
-- 		vim.cmd 'colorscheme everforest'
-- 	end,
-- }
--
-- return {
-- 	{
-- 		dir = "~/projects/base16", -- Replace with absolute path
-- 		name = "base16",
-- 		priority = 1000,
-- 		config = function()
-- 			local status_ok, _ = pcall(function()
-- 				local aurora = require("base16")
-- 				vim.cmd("colorscheme base16")
-- 			end)
--
-- 			if not status_ok then
-- 				print("Failed to load base16. Check :messages for error details.")
-- 				vim.cmd("colorscheme everforest")
-- 			end
-- 		end,
-- 	},
-- }

-- return {
-- 	"bluz71/vim-moonfly-colors",
-- 	name = "moonfly",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd 'colorscheme moonfly'
-- 	end,
-- }
