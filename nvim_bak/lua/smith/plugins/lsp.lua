return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		servers = {
			pylsp = {},
			zls = {},
			gopls = {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = "*.go",
						callback = function()
							local params = vim.lsp.util.make_range_params()
							params.context = { only = { "source.organizeImports" } }
							local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
							for _, res in pairs(result or {}) do
								for _, r in pairs(res.result or {}) do
									if r.edit then
										vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
									end
								end
							end
						end,
					})
				end,
			},
			ts_ls = {},
			svelte = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "gopls", "ts_ls", "svelte", "zls" },
		})

		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Global LSP keymaps setup function
		local function setup_lsp_keymaps(bufnr)
			local fzf = require("fzf-lua")
			local options = { buffer = bufnr, noremap = true, silent = true }

			-- LSP Navigation with fzf-lua
			vim.keymap.set("n", "<leader>gd", function()
				fzf.lsp_definitions({ jump1 = true })
			end, vim.tbl_extend("force", options, { desc = "[G]oto [D]efinition" }))

			vim.keymap.set("n", "<leader>gr", function()
				fzf.lsp_references({ jump1 = true, ignore_current_line = true })
			end, vim.tbl_extend("force", options, { desc = "[G]oto [R]eferences" }))

			vim.keymap.set("n", "<leader>gi", function()
				fzf.lsp_implementations({ jump1 = true })
			end, vim.tbl_extend("force", options, { desc = "[G]oto [I]mplementation" }))

			vim.keymap.set("n", "<leader>gt", function()
				fzf.lsp_typedefs({ jump1 = true })
			end, vim.tbl_extend("force", options, { desc = "[G]oto [T]ype Definition" }))

			vim.keymap.set(
				"n",
				"<leader>gD",
				vim.lsp.buf.declaration,
				vim.tbl_extend("force", options, { desc = "[G]oto [D]eclaration" })
			)

			vim.keymap.set("n", "<leader>ds", function()
				fzf.lsp_document_symbols()
			end, vim.tbl_extend("force", options, { desc = "[D]ocument [S]ymbols" }))

			vim.keymap.set("n", "<leader>ws", function()
				fzf.lsp_workspace_symbols()
			end, vim.tbl_extend("force", options, { desc = "[W]orkspace [S]ymbols" }))

			vim.keymap.set("n", "<leader>dd", function()
				fzf.diagnostics_document()
			end, vim.tbl_extend("force", options, { desc = "[D]ocument [D]iagnostics" }))

			vim.keymap.set("n", "<leader>dw", function()
				fzf.diagnostics_workspace()
			end, vim.tbl_extend("force", options, { desc = "[W]orkspace [D]iagnostics" }))

			vim.keymap.set(
				"n",
				"[d",
				vim.diagnostic.goto_prev,
				vim.tbl_extend("force", options, { desc = "Go to previous [D]iagnostic" })
			)

			vim.keymap.set(
				"n",
				"]d",
				vim.diagnostic.goto_next,
				vim.tbl_extend("force", options, { desc = "Go to next [D]iagnostic" })
			)

			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				vim.tbl_extend("force", options, { desc = "Hover Documentation" })
			)

			vim.keymap.set(
				"n",
				"<C-k>",
				vim.lsp.buf.signature_help,
				vim.tbl_extend("force", options, { desc = "Signature Help" })
			)

			vim.keymap.set(
				"n",
				"<leader>rn",
				vim.lsp.buf.rename,
				vim.tbl_extend("force", options, { desc = "[R]e[n]ame" })
			)

			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				vim.tbl_extend("force", options, { desc = "[C]ode [A]ction" })
			)

			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, vim.tbl_extend("force", options, { desc = "[F]ormat buffer" }))
		end

		-- Setup LSP attach autocmd
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				setup_lsp_keymaps(ev.buf)
			end,
		})

		for server, config in pairs(opts.servers) do
			config.capabilities = capabilities
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
