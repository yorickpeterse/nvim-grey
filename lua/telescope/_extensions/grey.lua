local strats = require('telescope.pickers.layout_strategies')
local setup_called = false

return require('telescope').register_extension({
  setup = function(ext_conf, conf)
    -- Per https://github.com/nvim-telescope/telescope.nvim/issues/2473, this
    -- function is called multiple times, but we don't want that.
    if setup_called then
      return
    end

    setup_called = true

    strats.grey = function(self, max_columns, max_lines, layout_config)
      local layout =
        strats.horizontal(self, max_columns, max_lines, layout_config)

      layout.prompt.borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
      layout.results.borderchars = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }

      layout.results.line = layout.results.line - 1
      layout.results.height = layout.results.height + 1

      if layout.preview then
        layout.prompt.width = layout.prompt.width + layout.preview.width + 2
        layout.preview.line = layout.preview.line + 2
        layout.preview.height = layout.preview.height - 2
        layout.preview.width = layout.preview.width + 1
        layout.preview.col = layout.preview.col - 1
        layout.preview.title = ''
        layout.preview.borderchars =
          { '─', ' ', ' ', '│', '┬', ' ', ' ', ' ' }
      end

      return layout
    end
  end,
})
