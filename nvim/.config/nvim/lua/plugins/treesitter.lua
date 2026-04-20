
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Команда для обновления парсеров языков
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust", "go", "python" }, -- Языки, которые будут автоматически установлены
      auto_install = true, -- Автоматически устанавливать парсер, если видит неизвестный язык
      highlight = {
        enable = true, -- Включаем улучшенную подсветку синтаксиса
      },
    })
  end,
}
