return {
    "EdenEast/nightfox.nvim",
    config = function()
        local status, nightfox = pcall(require, "nightfox")
        if not status then
            vim.notify("没有找到 nightfox")
            return
        end

        nightfox.setup({})

        --enable theme in lua
        -- require("dayfox").load()

        --enable theme in vim
        -- vim.cmd([[colorscheme Dawnfox]])
        -- vim.cmd([[colorscheme Dayfox]])
        -- vim.cmd([[colorscheme Duskfox]])
        vim.cmd([[colorscheme Nordfox]])
        -- vim.cmd([[colorscheme Terafox]])
        -- vim.cmd([[colorscheme Carbonfox]])
        -- vim.cmd([[colorscheme Nightfox]])
    end,
}
