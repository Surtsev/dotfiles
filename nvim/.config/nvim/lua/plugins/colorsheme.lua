return {
  -- 1. Указываем плагин с темой и её настройки
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Высокий приоритет, чтобы тема загрузилась раньше других
    opts = {
      transparent_mode = true, -- Включаем прозрачность
      -- при желании можно указать контраст: "soft", "medium" или "hard"
      -- contrast = "medium",
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      -- Принудительно загружаем тему, чтобы настройки применились сразу
      vim.cmd("colorscheme gruvbox")
    end,
  },
  -- 2. Указываем LazyVim использовать эту тему
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
