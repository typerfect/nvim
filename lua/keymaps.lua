-- ================= 设置变量 ==================
-- 设置leader键
vim.g.mapleader = " "

-- 设置变量
local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- ================= 插入模式 ==================
keymap("i", "jk", "<ESC>", opt)

-- -- insert 模式下，跳到行首行尾
keymap("i", "<C-h>", "<ESC>I", opt)
keymap("i", "<C-l>", "<ESC>A", opt)

-- ================= 视觉模式 ==================
-- 单行或多行移动
keymap("v", "J", ":m '>+1<CR>gv=gv", opt)
keymap("v", "K", ":m '<-2<CR>gv=gv", opt)
-- visual模式下缩进代码
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)
-- 在visual 模式里粘贴不要复制
keymap("v", "p", '"_dP', opt)

-- ================= 正常模式 ==================
-- -----------窗口管理
-- 取消 s 默认功能
keymap("n", "s", "", opt)
-- 窗口分屏
keymap("n", "sv", ":vsp<CR>", opt) -- 垂直分屏
keymap("n", "sh", ":sp<CR>", opt)  -- 水平分屏
keymap("n", "sc", "<C-w>c", opt)   -- 关闭当前
keymap("n", "so", "<C-w>o", opt)   -- 关闭其他

-- ctl + hjkl  窗口之间跳转
keymap("n", "<C-h>", "<C-w>h", opt)
keymap("n", "<C-j>", "<C-w>j", opt)
keymap("n", "<C-k>", "<C-w>k", opt)
keymap("n", "<C-l>", "<C-w>l", opt)

-- -----------浏览
---- 上下j,k太慢了,shift+j/k进行4行移动
keymap("n", "<S-j>", "4j", opt)
keymap("n", "<S-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
keymap("n", "<C-u>", "9k", opt)
keymap("n", "<C-d>", "9j", opt)

-- -----------其他设置
--取消高亮
keymap("n", "<leader>nh", ":nohl<CR>", opt)

--退出键
keymap("n", "q", ":q<CR>", opt)
keymap("n", "qq", ":q!<CR>", opt)
keymap("n", "Q", ":qa!<CR>", opt)

--重新加载
-- keymap("n", "<leader>r", ":luafile $MYVIMRC<CR>", opt)

-- dw删除当前光标所在单词
keymap("n", "dw", "diw", opt)

-- ================= 插件快捷键 ==================
local pluginKeys = {}

-- ----------- lsp 快捷键设置
pluginKeys.lspKeymap = function()
    -- rename
    -- keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    keymap("n", "<leader>r", "<cmd>Lspsaga  rename<CR>", opt)

    -- code action
    --keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)

    -- go to xx
    -- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    keymap("n", "gd", ":Lspsaga goto_definition<CR>", opt)
    -- keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    keymap("n", "gh", ":Lspsaga hover_doc<CR>", opt)
    keymap("n", "gf", ":Lspsaga finder def+ref<CR>", opt)
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)

    --格式化快捷键，虽然开启了自动格式化
    keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)

    -- 浮动终端窗口
    keymap("n", "<leader>t", ":Lspsaga term_toggle<CR>", opt)

    -- diagnostic
    --keymap("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    keymap("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    keymap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

    keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt)
end

-- ----------- nvim-cmp自动补全快捷键
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

pluginKeys.cmpKeymap = function(cmp, luasnip)
    return {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    cmp.confirm()
                end
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- 下一个
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
        }),

        -- 下一个
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- 上一个
        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- 取消
        ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "s" }),
        --出现补全
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s" }),
    }
end

pluginKeys.cmpCmdlineKeymap = function(cmp)
    return {
        ["<Tab>"] = {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete()
                end
            end,
        },
        -- ["<Tab>"] = {
        --     c = function(fallback)
        --         if cmp.visible() then
        --             cmp.select_next_item()
        --         else
        --             fallback()
        --         end
        --     end,
        -- },
        ["<S-Tab>"] = {
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete()
                end
            end,
        },
        ["<C-j>"] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
        },
        ["<C-k>"] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        },
        ["<C-e>"] = {
            c = cmp.mapping.abort(),
        },
        ["<CR>"] = {
            c = cmp.mapping.confirm({ select = false }),
        },
    }
end

-- ----------- nvim-tree 文档树快捷键设置
pluginKeys.nvimTreeKeymap = function()
    keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
end

-- ----------- bufferline 文档树快捷键设置
pluginKeys.bufferlineKeymap = function()
    --切换buffer, 使用shift + l/h
    keymap("n", "<S-L>", ":bnext<CR>", opt)
    keymap("n", "<S-H>", ":bprevious<CR>", opt)
    -- 关闭buffer
    keymap("n", "<C-c>", ":Bdelete<CR>", opt)
end

-- ----------- telescope 快捷键设置
pluginKeys.telescopeKeymap = function()
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opt)
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opt)
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opt)
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opt)
end

-- ----------- SymbolsOutline 快捷键设置
pluginKeys.SymbolsOutlineKeymap = function()
    keymap("n", "<leader>s", ":SymbolsOutline<CR>", opt)
end

-- ----------- xx 快捷键设置
-- ----------- xx 快捷键设置

return pluginKeys
