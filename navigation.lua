-- Move to left split with ctrl h
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
-- Move to right split with ctrl l
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
-- Move to top split with ctrl k
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
-- Move to bottom split with ctrl j
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })

return {}
