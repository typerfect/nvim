return {
	-- 格式化插件
	--
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- lsp/nonels.lua
		-- 即使是采用了 none-ls, 这里也是获取 null-ls
		local status, null_ls = pcall(require, "null-ls")
		if not status then
			vim.notify("没有找到 null-ls")
			return
		end

		local formatting = null_ls.builtins.formatting
		null_ls.setup({
			sources = {
				-- Formatting ---------------------
				formatting.shfmt,
				-- StyLua
				formatting.stylua,
				-- go fmt
				formatting.goimports,
				-- rust fmt
				formatting.rustfmt,
				-- frontend
				formatting.prettier.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"css",
						"scss",
						"less",
						"html",
						"json",
						"yaml",
						"graphql",
						"astro",
						"markdown",
					},
					extra_filetypes = { "njk" },
					prefer_local = "node_modules/.bin",
				}),
			},
			-- 保存自动格式化
			on_attach = function(client)
				vim.cmd([[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false}) ]])
			end,
		})
	end,
}
