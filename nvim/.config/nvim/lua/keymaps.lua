local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })

map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })

map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })


