return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		skip_confirm_for_simple_edits = false,
	},
	event = "BufEnter",
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "-", "<CMD>Oil --float .<CR>", { desc = "Open current directory" })
		vim.keymap.set("n", "<Leader>m", "<CMD>Oil --float .<CR>", { desc = "Open current directory" })
	end,
}
