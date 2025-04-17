-- 显示快捷键字典
return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons" },
	event = "VeryLazy",
	opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
	keys = {
        {
            "<leader>?",
            function()
                local status, whichkey = pcall(require, "which-key")
                if not status then
                    vim.notify("没有找到 whichkey")
                    return
                end

                whichkey.show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
