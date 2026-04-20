local opt = vim.opt

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true     
opt.swapfile = false     
opt.termguicolors = true 

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true


-- ============================================
-- Настройки прозрачности
-- ============================================

-- Включаем прозрачный фон (основная настройка)
opt.termguicolors = true

-- Делаем фон полностью прозрачным
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })  -- для неактивных окон

-- Дополнительно: прозрачность для других элементов интерфейса
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })      -- колонка с знаками
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })     -- символы ~ в конце файла
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })         -- невидимые символы
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })      -- колонка для сверток
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })          -- номера строк
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })    -- номер текущей строки
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })      -- подсветка строки с курсором
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })     -- колонка для лимита строк

-- Для статусной строки (если используете)
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

-- Для боковых панелей (например, NvimTree)
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
