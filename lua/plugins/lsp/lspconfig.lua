return {
    -- nvim-lspconfig: lsp客户端插件
    "neovim/nvim-lspconfig",
    config = function()
        -- Setup language servers.
        local status, lspconfig = pcall(require, "lspconfig")
        if not status then
            vim.notify("没有找到 lspconfig")
            return
        end

        --attention: nvim 0.11+
        -- 配置启动并连接lua的语言服务器
        vim.lsp.enable('lua_ls')
        vim.lsp.config('lua_ls', {

        })
        -- 配置启动并连接go的语言服务器
        vim.lsp.enable('gopls')
        vim.lsp.config('gopls', {

        })
        -- 配置启动并连接python的语言服务器
        vim.lsp.enable('pyright')
        vim.lsp.config('pyright', {

        })
        -- 配置启动并连接rust的语言服务器
        vim.lsp.enable('rust_analyzer')
        vim.lsp.config('rust_analyzer', {
        })

        -- LspAttach的时候，设置对应buffer的快捷键
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function()
                require("keymaps").lspKeymap()
            end,
        })
    end,
}
-- ================= END ==================
