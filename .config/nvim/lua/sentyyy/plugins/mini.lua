return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup()

    statusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.move').setup {
      mappings = {
        left = 'H',
        right = 'L',
        down = 'J',
        up = 'K',
      },
    }
  end,
}
