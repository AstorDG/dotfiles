-- Shows pending keybinds and what they do in a popup window
return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        keys = {},
      },
      -- Document existing key chains
      -- This can be added to for more categories of keybinds
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>r', group = 'Ba[R]bar' },
      },
      -- Define the window size
      win = {
        width = { min = 1.0 },
        height = { min = 5 },
      },
    },
  },
}
