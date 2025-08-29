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
          -- -- Current Color #000000(Black)
          -- crust = '#000000',
          -- -- Current Color #000000(Black). Color of the neo-tree background
          -- mantle = '#000000',
          -- -- Current Color #000000(Black). Color of the text editor background
          -- base = '#000000',
          -- -- Current Color #444444(Grey). Color of the current line highlight
          -- surface0 = '#444444',
          -- -- Current Color #5c5c5c(Grey). Color of the background of currently highlighted text.
          -- surface1 = '#5c5c5c',
          -- -- Current Color #ffffff(White). Not sure what this does.
          -- surface2 = '#ffffff',
          -- -- Current color #e01b24(red). Unselected Tab name when not saved
          -- overlay0 = '#e01b24',
          -- -- Current color #ffffff(White). Not sure what this does.
          -- overlay1 = '#ffffff',
          -- -- current color #ffffce(light yellow). Comments and periods/commas and parens.
          -- overlay2 = '#ffffce',
          -- -- Current color #ffffff(White). Not sure what this does.
          -- subtext0 = '#ffffff',
          -- -- Current Color #ffffff(white). Git branch and language in status line.
          -- subtext1 = '#ffffff',
          -- -- Current color #e01b24(red). File names, gitsigns, commands, file name on the status bar, indent_line context, indentation sign.
          -- text = '#e01b24',
          -- -- Current color #ffffff(White). Not sure what this does.
          -- lavendar = '#ffffff',
          -- -- Current color #cc734d(Rust). Folder color in neo-tree the background for normal mode the border for the buffers.
          -- blue = '#cc734d',
          -- -- Current color #ffffff(White). Not sure what this does
          -- sapphire = '#ffffff',
          -- -- Current color #734c4d(Mocha). Yank and litagure color ->, =, <=
          -- sky = '#9e744d',
          -- -- Current color #ffffff(White). Not sure what this does
          -- teal = '#ffffff',
          -- -- Current color #cc734d(Brownish Orange). Insert mode, string, added color on the side bar
          -- green = '#cc734d',
          -- -- Current color #fecf75(Rusty yellow). Color of git changes(lines that have been changed and files that have been changed in noe-tree and when selected)
          -- yellow = '#fecf75',
          -- -- Current color #720202(Dark red). Booleans and integers
          -- peach = '#720202',
          -- -- Current color #ffffff(White). Not sure what this does
          -- maroon = '#ffffff',
          -- -- Current color #720202(Dark Red). Color of replace mode.
          -- red = '#720102',
          -- -- Current color #fecea0(Tan). Visiual mode, new files, changed file folders, return and function keywords.
          -- mauve = '#fecea0',
          -- -- Current color #ffffff(White). Not sure what this does.
          -- pink = '#ffffff',
          -- -- Current color #ffffce(light yellow). Curly braces
          -- flamingo = '#ffffce',
          -- -- Current color #ffffff(White). Not sure what this does.
          -- rosewater = '#ffffff',
        },
      },
      highlight_overrides = {
        mocha = function()
          return {
            -- Comment = { fg = '#979797' },
            -- LineNr = { fg = '#ffffff' },
            -- CursorLineNr = { fg = '#ee5000' },
          }
        end,
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
