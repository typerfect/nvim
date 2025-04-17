-- 文件浏览器，可以在侧边栏快速选择文件，非常方便管理文件
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- disable netrw at the very start of your init.lua
		-- 默认不开启nvim-tree
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- OR setup with some options
        local status, nvim_tree = pcall(require, "nvim-tree")
        if not status then
            vim.notify("没有找到 nvim-tree")
            return
        end
        --
		nvim_tree.setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				-- 文件浏览器展示位置，左侧：left, 右侧：right
				side = "left",
				-- 行号是否显示
				number = false,
				relativenumber = false,
				signcolumn = "yes", -- 显示图标
				width = 30,
				-- mappings = {
				-- 	list = {
				-- 		-- 定义快捷键
				-- 		-- { key = "%", action = "create" },
				-- 		-- { key = "d", action = "create" },
				-- 		-- { key = "R", action = "rename" },
				-- 		-- { key = "D", action = "remove" },
				-- 	},
				-- },
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				-- 不显示隐藏的文件
				dotfiles = true,

				-- 不显示.git目录中的内容
				custom = {
					".git/",
				},
				-- 显示.gitignore
				exclude = {
					".gitignore",
				},
				--以图标显示git状态
				-- git = {
				-- 	enable = true,
				-- },
			},
		})

		-- 设置快捷键
        local status, keymaps = pcall(require, "keymaps")
        if not status then
            vim.notify("没有找到 keymaps")
            return
        end
		keymaps.nvimTreeKeymap()
	end,
}
