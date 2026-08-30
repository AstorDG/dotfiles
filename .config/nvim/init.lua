--[[
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
=====================================================================
--]]

-- run `:checkhealth` to check for errors in the config.
-- adds the vim-settings file to the config

-- ========================= VIM SETTINGS ===========================
require('vim._core.ui2').enable {}

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Setting options ]]

-- Make line numbers default
vim.o.number = true
vim.o.cursorline = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Set tab width
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.o.breakindent = true
vim.o.swapfile = false
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 15
vim.o.confirm = true

vim.opt.termguicolors = true

-- Undo tree
vim.keymap.set('n', '<leader>u', function()
  vim.cmd.packadd 'nvim.undotree'
  require('undotree').open()
end, { desc = 'Toggle Builtin Undotree' })

-- [[ Basic Keymaps ]]
local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Neovim Splits
map('n', '<M-v>', '<cmd>vsplit<cr>', { desc = 'Create a vertial split' })
map('n', '<M-b>', '<cmd>split<cr>', { desc = 'Create a horizontal split' })
map('n', '<M-g>', '<cmd>q<cr>', { desc = 'Close a split' })

-- Visual Block mode
map('n', '<M-v>', '<C-v>', {desc = 'visual block mode'})


-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ========================== PLUGINS =========================
vim.opt.packpath:prepend(vim.fn.stdpath 'data' .. '/site')

vim.pack.add {

  -- Dependency plugins
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

  -- Color configurer
  { src = 'https://github.com/catppuccin/nvim', { name = 'catppuccin' } },

  -- Shows pending keybinds and what they do in a popup window
  { src = 'https://github.com/folke/which-key.nvim' },

  -- Status line plugin
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },

  -- Automatically detects pairs such as {}()[]""'' to create closing pairs when opening pairs are created
  { src = 'https://github.com/windwp/nvim-autopairs' },

  -- Allows for quick navigation of text and better highlighting from f
  { src = 'https://github.com/folke/flash.nvim' },

  -- Another collection of plugins. Mostly used for lazygit integration
  { src = 'https://github.com/folke/snacks.nvim' },

  -- Used to install language parsers for tree sitter support
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

}

vim.cmd 'packloadall'

-- ===================== PLUGIN CONFIGURATION =================
--

require('nvim-treesitter').setup {
  ensure_installed = { 'lua' },
}


require('snacks').setup {
  image = { enabled = true },
  lazygit = { enabled = true },
  -- Shows how nested you are in curly braces or parenthasis for better clarity
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
}

require('which-key').setup {
  icons = {
    mappings = vim.g.have_nerd_font,
  },
  spec = {
    { '<leader>s', group = '[S]earch', icon = '󰍉' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>r', group = 'Ba[r]bar', icon = '󰓩' },
    { '<leader>d', group = '[D]ebug', icon = '' },
    { '<leader>o', group = '[O]pencode', icon = '󰵰' },
  },
  win = {
    width = { min = 2.0 },
    height = { min = 5 },
  },
}

require('nvim-autopairs').setup {
  event = 'InsertEnter',
}

-- The color and highlight overrides is my own baked catppuccin color
-- Use https://catbbrew.com/design to preivew custom brewed flavours
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
      -- Not sure what this color does
      crust = '#FFFFFF',
      -- Color of the neo-tree background
      mantle = '#000000',
      -- Color of the text editor background
      base = '#000000',
      -- Color of the current line highlight
      surface0 = '#444444',
      -- Color of the background of currently highlighted text.
      surface1 = '#5c5c5c',
      -- Unselected Tab name and folder lines.
      overlay0 = '#D90202',
      -- Comments and periods/commas and parens, brackets and curly brackets.
      overlay2 = '#3379D4',
      -- Git branch and language in status line.
      subtext1 = '#33D4C4',
      -- File names, gitsigns, commands, file name on the status bar, indent_line context, indentation sign.
      text = '#33D4C4',
      -- Folder color in neo-tree the background for normal mode the border for the buffers.
      blue = '#D90202',
      -- Yank and litagure color ->, =, <=
      sky = '#D43394',
      -- Insert mode, string, added color on the side bar
      green = '#FECEA0',
      -- Color of git changes and unsaved files
      yellow = '#D90202',
      -- Booleans and integers
      peach = '#D90202',
      -- Color of replace mode.
      red = '#3379D4',
      -- Visiual mode, new files, changed file folders, return and function keywords.
      mauve = '#2CB03C',
      -- Not sure
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
-- Sets Catppuccin as the color scheme for Neovim
vim.cmd 'colorscheme catppuccin'

require('lualine').setup {
  options = {
    theme = 'catppuccin-nvim',
  },
}
-- flash keybinds
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>f', function()
  require('flash').jump()
end, { desc = 'Flash' })
