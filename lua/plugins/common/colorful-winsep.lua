-- 打开多个窗口的时候，在当前焦点窗口周围显示紫色边框
return {
	--
	"nvim-zh/colorful-winsep.nvim",
	lazy = true,
	event = "WinNew",
	config = function()
        local status, winsep = pcall(require, "colorful-winsep")
        if not status then
            vim.notify("没有找到 winsep")
            return
        end

		winsep.setup()
	end,
}
