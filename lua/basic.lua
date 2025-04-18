local opt = vim.opt

-- ================= 编码 ==================
opt.encoding = "UTF-8"
opt.fileencoding = "utf-8"

-- ================= 缩进tab ==================
-- 将tab键转换为空格
opt.tabstop = 4       -- number of visual spaces per TAB
opt.softtabstop = 4   -- number of spacesin tab when editing
opt.shiftwidth = 4    -- insert 4 spaces on a tab       >>  <<的时候移动的宽度
opt.expandtab = true  -- tabs are spaces, mainly because of python
opt.autoindent = true --自动缩进

-- ================= 搜索 ==================
opt.incsearch = true  -- 边输入边搜索
opt.hlsearch = true   -- 搜索高亮
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- ================= UI config ==================
opt.number = true     -- show absolute number
--[[ opt.relativenumber = true -- 相对行号 ]]
opt.cursorline = true -- 高亮光标所在行
opt.splitbelow = true
opt.splitright = true -- split window 从下边和右边出现
-- we are experienced, wo don't need the "-- INSERT --" mode hint
opt.showmode = false

-- jkhl 移动时光标周围保留8行
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.signcolumn = "yes"   -- 显示左侧图标指示列
opt.colorcolumn = "100"  -- 右侧参考线，超过表示代码太长了，考虑换行
opt.cmdheight = 1        --2        -- 命令行高为2，提供足够的显示空间

opt.termguicolors = true -- 开启终端真颜色
opt.background = "dark"

opt.showtabline = 2 -- 显示tabline

-- 不可见字符的显示，这里只把空格显示为一个点
opt.list = true
--[[ opt.listchars = "space:·" ]]
opt.listchars = "tab:┃ ,trail:▫"
opt.fillchars = {
    --[[ vert = '│', ]]
}

-- ================= 其他配置 ==================
opt.autochdir = true                -- 自动切换目录
opt.autoread = true                 -- 当文件被外部程序修改时，自动加载

opt.wrap = false                    -- 禁止自动换行
opt.whichwrap = "<,>,[,]"           -- 光标在行首尾时<Left><Right>可以跳到下一行

opt.hidden = true                   -- 允许隐藏被修改过的buffer

opt.mouse = "a"                     -- 鼠标支持
opt.clipboard:append("unnamedplus") -- 使用系统剪切板

-- 禁止创建备份文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.updatetime = 300 -- smaller updatetime
opt.timeoutlen = 500 -- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置

-- 自动补全不自动选中
opt.completeopt = "menu,menuone,noselect,noinsert"
opt.wildmenu = true -- 补全增强
opt.pumheight = 10  -- 补全最多显示10行

-- Dont' pass messages to |ins-completin menu|
--[[ vim.o.shortmess = vim.o.shortmess .. 'c' ]]
--
-- ================= END ==================
