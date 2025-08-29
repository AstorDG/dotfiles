-- Adds a tab bar with open buffers(files) at the top of neovim
-- gitsigns and web dev icons are dependencies so that they can appear next to buffer(file) names
-- keybinds are set to move between buffers(files), rearange them and close them
-- tab bar is offset by neo-tree in the sidebar_filetypes option
-- For more info check the readme in the repo it's pretty good. Deep wiki is also your friend
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  lazy = false,
  config = function()
    local map = vim.keymap.set
    map('n', '<A-,>', ':BufferPrevious<CR>', { noremap = true, silent = true, desc = 'Ba[R]Bar Buffer[P]revious' })
    map('n', '<A-.>', ':BufferNext<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar Buffer[N]ext' })
    map('n', '<leader>rmp', ':BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar [M]oveBuffer[P]revious' })
    map('n', '<leader>rmn', ':BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar [M]oveBuffer[N]ext' })
    map('n', '<leader>ri', ':BufferPin<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar p[I]n' })
    map('n', '<leader>rc', ':BufferClose<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar Buffer[C]lose' })
    map('n', '<leader>ra', ':BufferCloseAllButCurrent<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar BufferClose[A]llButCurrent' })
    require('barbar').setup {
      -- this is where options are set
      animation = true,
      focus_on_close = 'previous',
      highlight_visible = false,
      highlight_alternate = false,
      highlight_inactive_file_icons = false,
      icons = {
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
        separator = {
          left = '▎',
        },
      },
      sort = {
        ignore_case = true,
      },
      sort_by_name = true,
      sidebar_filetypes = {
        ['neo-tree'] = {
          event = 'bufwinleave',
        },
      },
      non_name_title = 'empty file',
    }

    local highlight = vim.api.nvim_set_hl
    highlight(0, 'BufferCurrentAdded', { link = 'buffercurrent' })
    highlight(0, 'BufferCurrentChanged', { link = 'buffercurrent' })
    highlight(0, 'BufferCurrentDeleted', { link = 'buffercurrent' })
    highlight(0, 'BufferVisibleAdded', { link = 'buffervisible' })
    highlight(0, 'BufferVisibleChanged', { link = 'buffervisible' })
    highlight(0, 'BufferVisibleDeleted', { link = 'buffervisible' })
    highlight(0, 'BufferInactiveAdded', { link = 'bufferalternate' })
    highlight(0, 'BufferInactiveChanged', { link = 'bufferalternate' })
    highlight(0, 'BufferInactiveDeleted', { link = 'bufferalternate' })
    highlight(0, 'BufferTabpageFill', { ctermbg = 'black' })
  end,
}
