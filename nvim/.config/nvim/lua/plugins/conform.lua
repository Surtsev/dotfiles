return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Примеры настройки:
      lua = { "stylua" }, -- Для Lua: stylua
      javascript = { "prettierd", "prettier", stop_after_first = true }, -- Для JS: prettierd или prettier
      python = { "black" }, -- Для Python: black
      go = { "gofumpt", "goimports" }, -- Для Go: сначала gofumpt, затем goimports
      rust = { "rustfmt" }, -- Для Rust: rustfmt
      php = { "phpcsfixer" }, -- Для PHP: php-cs-fixer
      c = { "clang-format" }, -- Для C/C++: clang-format
      -- Добавляйте другие типы и форматтеры по необходимости
    },
    -- Настройка форматтеров по умолчанию
    default_format_opts = {
      lsp_format = "fallback", -- Использовать LSP, если отдельный форматтер не настроен
    },
  },
}
