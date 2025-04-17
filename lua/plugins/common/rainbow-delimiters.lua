-- 彩虹分隔符插件
return {
	--
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy",
	config = function()
        local status, rainbow_delimiters = pcall(require, "rainbow-delimiters.setup")
        if not status then
            vim.notify("没有找到 rainbow-delimiters")
            return
        end

        rainbow_delimiters.setup {
            strategy = {
                [''] = 'rainbow-delimiters.strategy.global',
                vim = 'rainbow-delimiters.strategy.local',
            },
            query = {
               [''] = 110,
                lua = 210,
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
	end,
}
