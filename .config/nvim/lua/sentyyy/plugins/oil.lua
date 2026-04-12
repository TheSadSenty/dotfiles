return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['cc'] = {
            desc = 'Copy filepath to system clipboard',
            callback = function()
              require('oil.actions').copy_entry_path.callback()
              vim.fn.setreg('+', vim.fn.getreg(vim.v.register))
              vim.notify('Copied full path', vim.log.levels.INFO, { title = 'Oil' })
            end,
          },
        },
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
          case_insensitive = true,
        },
        lsp_file_methods = {
          autosave_changes = true,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in current window' })
    end,
  },
}
