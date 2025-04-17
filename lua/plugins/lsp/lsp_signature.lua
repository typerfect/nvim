return {
	-- 输入函数调用的时候，提供函数签名提示
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function()
		local status, signature = pcall(require, "lsp_signature")
		if not status then
			vim.notify("没有找到 signature")
			return
		end

		signature.setup({})
	end,
}
