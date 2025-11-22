vim.g.mapleader = ' '

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>df', '"_dd', { desc = '[D]elete line [F]orever' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set('n', '<leader>st', function()
  vim.cmd.new()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end, { desc = 'New [s]plit [t]erminal' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<leader>ov', ':Vexplore<CR>', { desc = '[O]pen new buffer in [v]ertica split' })
vim.keymap.set('n', '<leader>oh', ':Vexplore<CR>', { desc = '[O]pen new buffer in [h]orizontal split' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--Tabs
vim.keymap.set('n', '<leader>nt', ':tab split<CR>', { desc = '[N]ew [t]ab' })
vim.keymap.set('n', '<leader>h', ':-tabnext<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>l', ':+tabnext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>H', ':-tabmove<CR>', { desc = 'Move current tab to the left' })
vim.keymap.set('n', '<leader>L', ':+tabmove<CR>', { desc = 'Move current tab to the right' })
