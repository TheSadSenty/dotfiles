return {
  'danymat/neogen',
  config = true,
  keys = {
    {
      '<leader>dg',
      function()
        local neogen = require 'neogen'
        local filetype = vim.bo.filetype

        if filetype == '' or filetype == nil then
          vim.notify('No filetype detected', vim.log.levels.WARN)
          return
        end

        local formats = {
          python = { 'google_docstrings', 'numpydoc', 'reST' },
        }

        local available_formats = formats[filetype]
        if not available_formats then
          neogen.generate()
          return
        end

        local function generate_with_format(format)
          neogen.generate {
            annotation_convention = { [filetype] = format },
          }
          vim.notify('Generated docs with: ' .. format, vim.log.levels.INFO)
        end

        if #available_formats == 1 then
          generate_with_format(available_formats[1].value)
          return
        end

        vim.ui.select(available_formats, {
          prompt = 'Select Neogen Format:',
        }, function(choice)
          if choice then
            generate_with_format(choice)
          end
        end)
      end,
      desc = '[D]oc [G]enerate with format picker',
    },
    {
      '<leader>dG',
      function()
        require('neogen').generate()
      end,
      desc = '[D]oc [G]enerate default',
    },
  },
  opts = {
    languages = {
      python = {
        template = {
          annotation_convention = 'google_docstrings',
        },
      },
      lua = {
        template = {
          annotation_convention = 'ldoc',
        },
      },
    },
  },
}
