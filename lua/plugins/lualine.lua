return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup({
        options = {
            icons_enabled = false,
            theme = "kanagawa",
            component_separators = '',
            section_separators = '',
            
            refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
        }
      })
    end,
}
}

