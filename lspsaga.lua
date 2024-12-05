local map = vim.keymap.set
map("n", "<leader>rn", ":Lspsaga rename<cr>", { desc = "Lspsaga Rename" })
map("n", "<leader>ca", ":Lspsaga code_action<cr>", { desc = "Lspsaga Code action" })
map("n", "<leader>cd", ":Lspsaga peek_definition<cr>", { desc = "Peek definition" })
map("n", "<S-k>", ":Lspsaga hover_doc<cr>", { desc = "Hover doc" })

map("n", "gd", ":Lspsaga goto_definition<cr>", { desc = "Go to definition" })
map("n", "<leader>co", ":Lspsaga outline<cr>", { desc = "Outline" })

-- Show diagnostics in line with lspsaga
map("n", "gl", ":Lspsaga show_line_diagnostics<cr>", { desc = "Show line diagnostics" })
map("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>", { desc = "Prev diagnostic" })
map("n", "]d", ":Lspsaga diagnostic_jump_next<cr>", { desc = "Next diagnostic" })

return {
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
