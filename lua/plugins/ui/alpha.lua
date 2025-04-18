return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
        local status, alpha = pcall(require, "alpha")
        if not status then
            vim.notify("没有找到 alpha")
            return
        end

        alpha.setup(require 'alpha.themes.startify'.config)
    end
};
