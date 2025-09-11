-- -- Sets Catppuccin as the color scheme for Neovim
-- -- The color and highlight overrides is my own baked catppuccin color
-- -- Use https://catbbrew.com/design to preivew custom brewed flavours
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.2,
      },
      default_integrations = true,
      integrations = {
        gitsigns = true,
        neotree = true,
        treesitter = true,
        barbar = true,
        telescope = true,
        mason = true,
        mini = {
          enabled = true,
        },
        which_key = true,
      },
      color_overrides = {
        mocha = {
          -- Current Color #000000(Black)
          crust = '#FFFFFF',
          -- Current Color #000000(Black). Color of the neo-tree background
          mantle = '#000000',
          -- Current Color #000000(Black). Color of the text editor background
          base = '#000000',
          -- Current Color #444444(Grey). Color of the current line highlight
          surface0 = '#444444',
          -- Current Color #5c5c5c(Grey). Color of the background of currently highlighted text.
          surface1 = '#5c5c5c',
          -- Current color #33D4C4(Cyan). Unselected Tab name and folder lines.
          overlay0 = '#D90202',
          -- current color #69838C(grey cyan). Comments and periods/commas and parens.
          overlay2 = '#3379D4',
          -- Current Color #33D4C4(cyan). Git branch and language in status line.
          subtext1 = '#33D4C4',
          -- Current color #33D4C4(cyan). File names, gitsigns, commands, file name on the status bar, indent_line context, indentation sign.
          text = '#33D4C4',
          -- Current color #D90202(brigth red). Folder color in neo-tree the background for normal mode the border for the buffers.
          blue = '#D90202',
          -- Current color #D43394(bright pink). Yank and litagure color ->, =, <=
          sky = '#D43394',
          -- Current color #FECEA0(tan). Insert mode, string, added color on the side bar
          green = '#FECEA0',
          -- Current color #D90202(bright red). Color of git changes and unsaved files
          yellow = '#D90202',
          -- Current color #D90202(bright red). Booleans and integers
          peach = '#D90202',
          -- Current color #3379D4(neon blue). Color of replace mode.
          red = '#3379D4',
          -- Current color #2CB03C(neon green). Visiual mode, new files, changed file folders, return and function keywords.
          mauve = '#2CB03C',
          -- Current color #ffffce(light yellow). Curly braces
          flamingo = '#2CB03C',
        },
      },
      highlight_overrides = {
        mocha = function()
          return {
            Comment = { fg = '#69838C' },
            LineNr = { fg = '#69838C' },
            CursorLineNr = { fg = '#33D4C4' },
          }
        end,
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
