
return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- Ищем файлы в проекте
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    -- Ищем текст (grep) во всех файлах проекта
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    -- Ищем среди открытых буферов
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
    -- Смотрим историю хелпа
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help pages" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        -- Здесь можно настроить дефолтное поведение telescope
      }
    })
  end,
}
