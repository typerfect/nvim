return {
	"navarasu/onedark.nvim",
	config = function()
		local status, onedark = pcall(require, "onedark")
		if not status then
			vim.notify("没有找到 onedark")
			return
		end

		onedark.setup({
			--dark, darker, cool, deep, warm, warmer
			-- style = "darker",
			--[[ style = "dark", ]]
			-- cool用的时候，函数有的时候颜色没有重点显示
			-- style = "cool",
			-- style = "deep",
			-- style = "warm",
			style = "warmer",
		})

		--enable theme in lua
		onedark.load()

		--enable theme in vim
		-- vim.cmd([[colorscheme onedark]])
	end,
}
