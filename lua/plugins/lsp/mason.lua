return {
	-------------------------------------------------
	--mason管理lsp服务端, 提供简单的ui和一些方便的命令
	{
		"williamboman/mason.nvim",
		config = function()
			local status, mason = pcall(require, "mason")
			if not status then
				vim.notify("没有找到 mason")
				return
			end

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	-------------------------------------------------
	-- mason lspconfig是mason和lspconfig之间的桥梁
	{
		"williamboman/mason-lspconfig.nvim",

		config = function()
			local status, mason_lspconfig = pcall(require, "mason-lspconfig")
			if not status then
				vim.notify("没有找到 mason-lspconfig")
				return
			end

			mason_lspconfig.setup({
				automatic_installation = true,
				ensure_installed = { "lua_ls", "gopls", "pyright", "rust_analyzer" },
			})
		end,
	},
}
-- ================= END ==================
