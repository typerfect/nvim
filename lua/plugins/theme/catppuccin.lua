return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local status, catppuccin = pcall(require, "catppuccin")
        if not status then
            vim.notify("没有找到 catppuccin")
            return
        end

        catppuccin.setup({

        })

        --enable theme in vim
        -- vim.cmd([[colorscheme catppuccin-latte]])
        -- vim.cmd([[colorscheme catppuccin-frappe]])
        vim.cmd([[colorscheme catppuccin-macchiato]])
        -- vim.cmd([[colorscheme catppuccin-mocha]])
    end,
}
