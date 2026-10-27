-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<escape>")
vim.keymap.set("i", "kj", "<escape>")
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<leader>ghi", ":InlineDiff toggle <CR>")
