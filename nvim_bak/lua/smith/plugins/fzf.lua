return {
	-- Fuzzy Finder using fzf
	"ibhagwan/fzf-lua",
	event = "VimEnter",
	dependencies = {
		{ "echasnovski/mini.icons", version = false },
	},
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.85,
				width = 0.80,
				preview = {
					default = "bat", -- Use 'bat' for syntax highlighting, or 'builtin' if bat not installed
					border = "border",
					wrap = "nowrap",
					hidden = "nohidden",
					vertical = "down:45%",
					horizontal = "right:50%",
					layout = "flex",
					flip_columns = 120,
				},
			},
			files = {
				previewer = "bat",
			},
			grep = {
				previewer = "bat",
			},
			fzf_opts = {
				["--layout"] = "reverse",
			},
		})

		-- Register fzf-lua as the UI select handler
		require("fzf-lua").register_ui_select()

		local fzf = require("fzf-lua")

		-- Search keymaps
		vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", fzf.builtin, { desc = "[S]earch [S]elect fzf-lua" })
		vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })

		-- Fuzzy search in current buffer
		vim.keymap.set("n", "<leader>/", function()
			fzf.blines({
				winopts = {
					height = 0.4,
					width = 0.6,
					preview = {
						hidden = "hidden",
					},
				},
			})
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- Live grep in open files
		vim.keymap.set("n", "<leader>s/", function()
			fzf.live_grep({
				prompt = "Live Grep in Open Files❯ ",
				filespec = vim.tbl_map(
					function(buf)
						return vim.api.nvim_buf_get_name(buf)
					end,
					vim.tbl_filter(function(buf)
						return vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted")
					end, vim.api.nvim_list_bufs())
				),
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Search Neovim config files
		vim.keymap.set("n", "<leader>sn", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
