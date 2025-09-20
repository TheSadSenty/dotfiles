return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      current_line_blame = true,
      word_diff = false,

      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = 'Git navigate next hunk' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = 'Git navigate previous hunk' })

        -- Actions
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[G]it [s]tage hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[G]it [r]eset hunk' })

        map('v', '<leader>gs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = '[G]it [s]tage hunk' })

        map('v', '<leader>gr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = '[G]it [r]eset hunk' })

        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it [S]tage buffer' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[G]it [R]eset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[G]it [p]review hunk' })
        map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = '[G]it preview hunk [i]nline' })

        map('n', '<leader>gb', function()
          gitsigns.blame_line({ full = true })
        end, { desc = '[G]it [b]lame line' })

        map('n', '<leader>gf', gitsigns.diffthis, { desc = '[G]it di[f]f index' })

        map('n', '<leader>gF', function()
          gitsigns.diffthis('~')
        end, { desc = '[G]it di[F]f last commit' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Git [t]oggle current line [b]lame' })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Git [t]oggle [w]ord diff' })

      end
    }
  end
}
