return {
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        -- C++
        'clangd',
        -- Go
        'gopls',
        -- Python
        'basedpyright',
        'ruff',
        -- Bash
        'bashls',
        -- Rust
        'rust_analyzer',
        -- Docker
        'dockerls',
        -- Lua
        'lua_ls',
      },
    },
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'shfmt',
        'prettier',
        'clang-format',
      },
    },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
}
