-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Отключаем курсив для распространенных групп подсветки синтаксиса
vim.api.nvim_set_hl(0, "Comment", { italic = false })
vim.api.nvim_set_hl(0, "@comment", { italic = false })
vim.api.nvim_set_hl(0, "@comment.note", { italic = false })
vim.api.nvim_set_hl(0, "@comment.warning", { italic = false })
vim.api.nvim_set_hl(0, "@comment.danger", { italic = false })
vim.api.nvim_set_hl(0, "@markup.italic", { italic = false }) -- Отключает *курсив в markdown*

vim.opt.winblend = 30
vim.opt.pumblend = 60
