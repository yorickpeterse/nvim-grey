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

      local top = self.layout_config.prompt_position == 'top'

      layout.prompt.borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }

      if top then
        layout.results.borderchars =
          { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
      else
        layout.results.borderchars =
          { ' ', ' ', '─', ' ', ' ', ' ', ' ', ' ' }
      end

      if top then
        layout.results.line = layout.results.line - 1
      else
        layout.results.line = layout.results.line + 1
      end

      if layout.preview then
        layout.prompt.width = layout.prompt.width + layout.preview.width + 2
        layout.preview.line = layout.results.line
        layout.preview.height = layout.results.height
        layout.preview.width = layout.preview.width + 1
        layout.preview.col = layout.preview.col - 1

        if top then
          layout.preview.borderchars =
            { '─', ' ', ' ', '│', '┬', ' ', ' ', ' ' }
        else
          layout.preview.borderchars =
            { ' ', ' ', '─', '│', ' ', ' ', ' ', '┴' }
        end
      end

      return layout
    end
  end,
})
