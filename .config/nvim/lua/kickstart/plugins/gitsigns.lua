return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk_inline<CR>', { desc = '[G]it preview [h]unk' })
    vim.keymap.set('n', '<leader>gk', ':Gitsigns prev_hunk<CR>', { desc = '[G]it previous hunk' })
    vim.keymap.set('n', '<leader>gj', ':Gitsigns next_hunk<CR>', { desc = '[G]it next hunk' })
    vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = '[G]it [r]eset hunk' })
  end,
}
