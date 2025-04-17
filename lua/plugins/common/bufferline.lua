-- buffer管理插件，可以像多个编辑器一样打开多个tab，可以快速进行切换
return {
	--
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"moll/vim-bbye",
	},

	config = function()
		vim.opt.termguicolors = true

        local status, bufferline = pcall(require, "bufferline")
        if not status then
            vim.notify("没有找到 bufferline")
            return
        end

		bufferline.setup({
			options = {
				-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",

				-- 侧边栏配置
				-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},

				-- 使用 nvim 内置 LSP
				diagnostics = "nvim_lsp",

				-- 可选，显示 LSP 报错图标
				-- ---@diagnostic disable-next-line: unused-local
				-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
				-- 	local s = " "
				-- 	for e, n in pairs(diagnostics_dict) do
				-- 		local sym = e == "error" and " " or (e == "warning" and " " or "")
				-- 		s = s .. n .. sym
				-- 	end
				-- 	return s
				-- end,
			},
		})

        local status, keymaps = pcall(require, "keymaps")
        if not status then
            vim.notify("没有找到 keymaps")
            return
        end
        keymaps.bufferlineKeymap()
	end,
}
