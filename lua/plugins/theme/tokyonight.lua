return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
        local status, tokyonight = pcall(require, "tokyonight")
        if not status then
            vim.notify("没有找到 tokyonight")
            return
        end

		tokyonight.setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			-- style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			-- style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			-- style = "day", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			-- light_style = "day", -- The theme is used when the background is set to light
			transparent = false, -- Enable this to disable setting the background color
		})

		--enable theme in lua
		tokyonight.load()

		--enable theme in vim
		-- vim.cmd([[colorscheme tokyonight-moon]])
		-- vim.cmd([[colorscheme tokyonight-storm]])
		-- vim.cmd([[colorscheme tokyonight-night]])
		-- vim.cmd([[colorscheme tokyonight-day]])
	end,
}
