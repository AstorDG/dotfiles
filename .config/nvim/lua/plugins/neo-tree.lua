-- Renders a file tree and allows you to browse it
-- The documentation is pretty good but for annoyoing bugs as deepwiki

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['P'] = { 'toggle_preview', use_float = true, use_image_nvim = true, title = 'Neo-tree preview' },
        },
      },
    },
  },
  config = function()
    require('neo-tree').setup {
      window = {
        position = 'left',
        width = 0.15,
      },
      close_if_last_window = true,
      sort_case_insensitive = true,
    }
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.cmd 'Neotree toggle'
      end,
    })
  end,
}
