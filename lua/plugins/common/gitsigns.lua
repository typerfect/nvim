-- git提示
return {
	--
	"lewis6991/gitsigns.nvim",

	config = function()
        local status, gitsigns = pcall(require, "gitsigns")
        if not status then
            vim.notify("没有找到 gitsigns")
            return
        end

		gitsigns.setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		})
	end,
}
