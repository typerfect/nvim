return {
    'rcarriga/nvim-notify',
    config = function()
        local status, notify = pcall(require, "notify")
        if not status then
            vim.notify("没有找到 notify")
            return
        end

        vim.notify = notify
    end
}
