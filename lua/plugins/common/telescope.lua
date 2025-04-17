-- 文件名搜索和文本内容搜索
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		-- 设置快捷键
        local status, keymaps = pcall(require, "keymaps")
        if not status then
            vim.notify("没有找到 keymaps")
            return
        end
		keymaps.telescopeKeymap()

		extensions = {
			flash = {
				pick = function(prompt_bufnr)
                    local status, telescope = pcall(require, "telescope.actions.state")
                    if not status then
                        vim.notify("没有找到 telescope")
                        return
                    end

					telescope.get_current_picker(prompt_bufnr):set_selection(1)
				end,
			},
		}
	end,
}
