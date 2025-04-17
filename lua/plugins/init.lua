return {
	-- ================= 主题 ==================
	-- { import = "plugins.theme.onedark" },
	{ import = "plugins.theme.tokyonight" },
	-- { import = "plugins.theme.nightfox" },

	-- ================= lsp ==================
	-- 有几个插件安装顺序很重要， 先mason, 然后lspconfig
	-- mason:服务端管理插件，提供服务端配置的ui界面和命令
	-- mason: mason和nvim-lspconfig的桥梁
	{ import = "plugins.lsp.mason" },
	-- -- lsp客户端插件
	{ import = "plugins.lsp.lspconfig" },
	-- -- 自动补全插件
	{ import = "plugins.lsp.cmp" },
	-- -- 语法高亮插件
	{ import = "plugins.lsp.treesitter" },
	-- -- lsp美化插件
	{ import = "plugins.lsp.lspsaga" },
	-- -- 格式化插件
	{ import = "plugins.lsp.none-ls" },
	-- 输入函数调用的时候，显示函数签名插件
	{ import = "plugins.lsp.lsp_signature" },

	-- ================= common ==================
	-- common
	{ import = "plugins.common" },

	-- ================= ui ==================
	{ import = "plugins.ui" },

	-- =================  ==================
}
-- ================= END ==================
