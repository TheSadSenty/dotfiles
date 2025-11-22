return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format', 'ruff_organize_imports' },
      rust = { 'rustfmt' },
      bash = { 'shfmt' },
      yaml = { 'prettier' },
      css = { 'prettier' },
      markdown = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
      cpp = { 'clang-format' },
      go = { 'gofumpt' },
    },
  },
  config = function()
    local conform = require("conform")
    conform.setup()
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "[F]ormat buffer" })
  end,
}
