return {
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		config = function()
			require("lspsaga").setup({})

			local map = vim.keymap.set

			-- Show diagnostics in line with lspsaga
			map("n", "gl", ":Lspsaga show_line_diagnostics<cr>", { desc = "Show line diagnostics" })
			map("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>", { desc = "Prev diagnostic" })
			map("n", "]d", ":Lspsaga diagnostic_jump_next<cr>", { desc = "Next diagnostic" })
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
