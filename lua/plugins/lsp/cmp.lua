-- 自动补全插件
return {
	--补全引擎框架
	"hrsh7th/nvim-cmp",

	dependencies = {
		--补全源
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		--使用luaSnip作为代码补全引擎
		--cmp_luasnip作为nvim-cmp补全框架和LuaSnip补全引擎的桥梁
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- 常见编程语言代码段
		"rafamadriz/friendly-snippets",
		-- 代码提示，显示分类的小图标支持
		"onsails/lspkind-nvim",
	},

	event = {
		"InsertEnter",
		"CmdlineEnter",
	},

	config = function()
		local status, lspkind = pcall(require, "lspkind")
		if not status then
			vim.notify("没有找到 lspkind")
			return
		end

		local status, cmp = pcall(require, "cmp")
		if not status then
			vim.notify("没有找到 cmp")
			return
		end

		local status, luasnip = pcall(require, "luasnip")
		if not status then
			vim.notify("没有找到 luasnip")
			return
		end

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			--指定 snippet引擎
			snippet = {
				expand = function(args)
					-- 以下插件作为前提：
					-- { 'L3MON4D3/LuaSnip' },
					-- { 'saadparwaiz1/cmp_luasnip' },
					luasnip.lsp_expand(args.body)
				end,
			},

			--补全源
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- 以下插件作为前提：
				-- { 'L3MON4D3/LuaSnip' },
				-- { 'saadparwaiz1/cmp_luasnip' },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
				{ name = "cmdline" },
			}),

			-- 使用lspkind-nvim显示类型图标
			formatting = {
				format = lspkind.cmp_format({
					with_text = true, -- do not show text alongside icons
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					before = function(entry, vim_item)
						-- Source 显示提示来源
						vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
						return vim_item
					end,
				}),
			},

			-- 快捷键绑定
			mapping = require("keymaps").cmpKeymap(cmp, luasnip),

			--启动ghost_Text，让cmp预先渲染出要补全的内容，非常方便
			experimental = {
				ghost_text = true,
			},
		})

		cmp.setup.cmdline(":", {
			--命令行模式使用path和cmdline源
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),

			--命令行模式下的快捷键
			mapping = require("keymaps").cmpCmdlineKeymap(cmp),
		})

		-- /查找模式下使用buf源
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		-- load vscode snippet (friendly-snippet)
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
