return {
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking text",
		group = vim.api.nvim_create_augroup("custom-hihglight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	}),
}
