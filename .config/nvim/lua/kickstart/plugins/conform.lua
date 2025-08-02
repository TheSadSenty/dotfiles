return {
  'stevearc/conform.nvim',
  enabled = false,
  opts = {
    notify_on_error = true,
    format_after_save = {
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format', 'ruff_fix', 'ruff_organize_imports' },
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
}
