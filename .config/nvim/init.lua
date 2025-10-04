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

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Setting options ]]

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true
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

-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- NOTE: This won't work in all terminal emulators/tmux/etc.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ====================================================================

-- =================== INSTALL LAZY PLUGIN MANAGER ====================

--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- ====================================================================

-- ========================= PLUGINS ==================================
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  -- Automatically detects pairs such as {}()[]""'' to create closing pairs when opening pairs are created
  -- This also helps wrap selections when selecting text
  -- The repo documentation isn't that good so read the deepwiki for better info
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Adds a tab bar with open buffers(files) at the top of neovim
  -- gitsigns and web dev icons are dependencies so that they can appear next to buffer(file) names
  -- keybinds are set to move between buffers(files), rearange them and close them
  -- tab bar is offset by neo-tree in the sidebar_filetypes option
  -- For more info check the readme in the repo it's pretty good. Deep wiki is also your friend
  {
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
      map('n', '<leader>rl', ':BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar MoveBuffer[L]eft' })
      map('n', '<leader>rr', ':BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar MoveBuffer[R]ight' })
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
          preset = 'slanted',
          separator_at_end = true,
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
  },
  -- Autocompletion. This interacts with LSPs, linters, formatters and snippets to add a menu of possible completions from all of those tools
  -- Has a snippet Engine as a dependency to add snippet functionality. This is nice because you don't have to install those separately
  -- Snippets are character shortcuts that add some longer text based on input characters. Examples can be seen on the lua-snip repo
  -- freindly-snippets is just a library of snippets
  -- I would suggest looking at deepwiki to understand more deeply how all of the tools work together
  {
    {
      'saghen/blink.cmp',
      event = 'VimEnter',
      version = '1.*',
      dependencies = {
        -- Snippet Engine
        {
          'L3MON4D3/LuaSnip',
          version = '2.*',
          build = (function()
            -- Build Step is needed for regex support in snippets.
            -- This step is not supported in many windows environments.
            -- Remove the below condition to re-enable on windows.
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
              return
            end
            return 'make install_jsregexp'
          end)(),
          dependencies = {
            --    See the README about individual language/framework/plugin snippets:
            --    To add a language, framework or markup language
            --    A list of all the avilalble snippets to add are available on the wiki portion of the github repo
            {
              'rafamadriz/friendly-snippets',
              config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
              end,
            },
          },
          -- opts for Luasnip
          opts = {},
        },
        'folke/lazydev.nvim',
      },
      --- @module 'blink.cmp'
      --- @type blink.cmp.Config
      opts = {
        keymap = {
          -- 'default' (recommended) for mappings similar to built-in completions
          -- <c-y> to accept ([y]es) the completion.
          --
          -- All presets have the following mappings:
          -- <tab>/<s-tab>: move to right/left of your snippet expansion
          -- <c-space>: Open menu or open docs if already open
          -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
          -- <c-e>: Hide menu
          -- <c-k>: Toggle signature help
          --
          preset = 'default',
        },

        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'normal',
        },
        completion = {
          -- By default, you may press `<c-space>` to show the documentation.
          -- Optionally, set `auto_show = true` to show the documentation after a delay.
          documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },

        sources = {
          default = { 'lsp', 'path', 'snippets', 'lazydev' },
          providers = {
            lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          },
        },

        snippets = { preset = 'luasnip' },

        -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
        -- which automatically downloads a prebuilt binary when enabled.
        --
        -- By default, we use the Lua implementation instead, but you may enable
        -- the rust implementation via `'prefer_rust_with_warning'`
        fuzzy = { implementation = 'lua' },
        signature = { enabled = true },
      },
    },
  },

  -- -- Sets Catppuccin as the color scheme for Neovim
  -- -- The color and highlight overrides is my own baked catppuccin color
  -- -- Use https://catbbrew.com/design to preivew custom brewed flavours
  {
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
  },
  -- Formats code in a buffer(file) when run. It uses the current lsp to do formatting
  -- Currently formats when the buffer(file) is saved
  {

    { -- Autoformat
      'stevearc/conform.nvim',
      event = { 'BufWritePre' },
      cmd = { 'ConformInfo' },
      keys = {
        {
          '<leader>f',
          function()
            require('conform').format { async = true, lsp_format = 'fallback' }
          end,
          mode = '',
          desc = '[F]ormat buffer',
        },
      },
      opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't have a well standardized coding style.
          -- You can add additional languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = 'fallback',
            }
          end
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
        },
      },
    },
  },

  -- Shows how to use the DAP plugin to debug your code.
  -- Primarily focused on configuring the debugger for Go, but can be extended to other languages as well.
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',

      -- Installs the debug adapters for you
      'mason-org/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',
    },
    keys = {
      -- Basic debugging keymaps,
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<F1>',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<F2>',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<F3>',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<leader>b',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>B',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      {
        '<F7>',
        function()
          require('dapui').toggle()
        end,
        desc = 'Debug: See last session result.',
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
        },
      }

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      -- Change breakpoint icons
      -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      -- local breakpoint_icons = vim.g.have_nerd_font
      --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
      -- for type, icon in pairs(breakpoint_icons) do
      --   local tp = 'Dap' .. type
      --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      -- end

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Install golang specific config
      require('dap-go').setup {
        delve = {
          -- On Windows delve must be run attached or it crashes.
          -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
          detached = vim.fn.has 'win32' == 0,
        },
      }
    end,
  },

  -- Adds git colors to the left side bar
  { 'lewis6991/gitsigns.nvim' },

  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  {
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
  },

  -- Linting
  {
    {
      'mfussenegger/nvim-lint',
      event = { 'BufReadPre', 'BufNewFile' },
      config = function()
        local lint = require 'lint'
        lint.linters_by_ft = {}

        -- To allow other plugins to add linters to require('lint').linters_by_ft,
        -- instead set linters_by_ft like this:
        -- lint.linters_by_ft = lint.linters_by_ft or {}
        -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
        --
        -- However, note that this will enable a set of default linters,
        -- which will cause errors unless these tools are available:
        -- {
        --   clojure = { "clj-kondo" },
        --   dockerfile = { "hadolint" },
        --   inko = { "inko" },
        --   janet = { "janet" },
        --   json = { "jsonlint" },
        --   markdown = { "vale" },
        --   rst = { "vale" },
        -- }
        --
        -- You can disable the default linters by setting their filetypes to nil:
        -- lint.linters_by_ft['rst'] = nil

        -- Create autocommand which carries out the actual linting
        -- on the specified events.
        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
          group = lint_augroup,
          callback = function()
            -- Only run the linter in buffers that you can modify in order to
            -- avoid superfluous noise, notably within the handy LSP pop-ups that
            -- describe the hovered symbol using Markdown.
            if vim.bo.modifiable then
              lint.try_lint()
            end
          end,
        })
      end,
    },
  },

  -- Markdown renderer
  {
    'MeanderingProgrammer/markdown.nvim',
    opts = { 'markdown' },
    ft = { 'markdown' },
    main = 'render-markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Collection of various small independent plugins/modules for things I don't want to dedicate a whole plugin to
  -- For a full list of availalble mini plugins check the github repo.
  {
    {
      'echasnovski/mini.nvim',
      config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup()
      end,
    },
  },
  -- Status line plugin
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        sections = {
          lualine_a = { { 'mode', separator = { left = '', right = '' } } }, -- leave colors alone
          lualine_b = { { 'filename', color = { fg = '#33D4C4', bg = '#362921' }, separator = { left = '', right = '' } } }, -- grey background with cyan text
          lualine_c = {
            { 'branch', color = { fg = '#D90202', bg = '#ffffff' }, separator = { right = '' } },
            {
              'diff',
              colored = true,
              diff_color = {
                added = { fg = '#14DE2C', bg = '#FFFFFF' },
                modified = { fg = '#932CB0', bg = '#FFFFFF' },
                removed = { fg = '#D90202', bg = '#FFFFFF' },
              },
              separator = { right = '' },
            },
          }, -- white background with red text}
          lualine_x = { { 'encoding', color = { fg = 'D90202', bg = '#FFFFFF' }, separator = { left = '' } } }, -- white background with red text
          lualine_y = { { 'lsp_status', color = { fg = '#33D4C4', bg = '#362921' }, separator = { left = '' } } }, -- grey background with cyan text
          lualine_z = { { 'location', separator = { left = '', right = '' } } }, -- leave colors alone
        },
      }
    end,
  },

  -- Renders a file tree and allows you to browse it
  -- The documentation is pretty good but for annoyoing bugs use deepwiki
  {
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
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
        nerver_show = {},
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
    end,
  },

  -- LSP(Language Server Protocol) Set up which allows neovim, the client, to contact a programming language specific server to get language specific functionality
  -- This functionality includes Go to definition, find references, autocompletion, symbol search and some more
  -- Because the server is an external process is must be installed seperately from neovim and that's what Mason is for
  -- Lsps are installed here or manually through the :Mason command
  -- Use deepwiki.com to better understand what's going on here. A bunch of the information is in disparate places
  {
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 'mason-org/mason.nvim', opts = {} },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },
        -- connect blink to lsp for autocompletion
        'saghen/blink.cmp',
      },
      config = function()
        --    Every time a new file is opened that is associated with an lsp (for example, opening `main.rs` is associated with `rust_analyzer`)
        --    this function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            -- create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local map = function(keys, func, desc, mode)
              mode = mode or 'n'
              vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

            -- Find references for the word under your cursor.
            map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

            -- Jump to the implementation of the word under your cursor.
            -- Useful when your language has ways of declaring types without an actual implementation.
            map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

            -- Jump to the definition of the word under your cursor.
            -- This is where a variable was first declared, or where a function is defined, etc.
            -- To jump back, press <C-t>.
            map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

            -- For example, in C this would take you to the header.
            map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            -- Fuzzy find all the symbols in your current document.
            -- Symbols are things like variables, functions, types, etc.
            map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

            -- Fuzzy find all the symbols in your current workspace.
            -- Similar to document symbols, except searches over your entire project.
            map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

            -- Jump to the type of the word under your cursor.
            -- Useful when you're not sure what type a variable is and you want to see
            -- the definition of its *type*, not where it was *defined*.
            map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

            -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
            ---@param client vim.lsp.Client
            ---@param method vim.lsp.protocol.Method
            ---@param bufnr? integer some lsp support methods only in specific files
            ---@return boolean
            local function client_supports_method(client, method, bufnr)
              if vim.fn.has 'nvim-0.11' == 1 then
                return client:supports_method(method, bufnr)
              else
                return client.supports_method(method, { bufnr = bufnr })
              end
            end

            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            -- See `:help CursorHold` for information about when this is executed
            --
            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
              local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
              })

              vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                  vim.lsp.buf.clear_references()
                  vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
              })
            end

            -- The following code creates a keymap to toggle inlay hints in your
            -- code, if the language server you are using supports them
            --
            -- This may be unwanted, since they displace some of your code
            if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
              map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
              end, '[T]oggle Inlay [H]ints')
            end
          end,
        })

        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config {
          severity_sort = true,
          float = { border = 'rounded', source = 'if_many' },
          underline = { severity = vim.diagnostic.severity.ERROR },
          signs = vim.g.have_nerd_font and {
            text = {
              [vim.diagnostic.severity.ERROR] = '󰅚 ',
              [vim.diagnostic.severity.WARN] = '󰀪 ',
              [vim.diagnostic.severity.INFO] = '󰋽 ',
              [vim.diagnostic.severity.HINT] = '󰌶 ',
            },
          } or {},
          virtual_text = {
            source = 'if_many',
            spacing = 2,
            format = function(diagnostic)
              local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
              }
              return diagnostic_message[diagnostic.severity]
            end,
          },
        }

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- Enable the following language servers
        --  Add any additional override configuration in the following tables. Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --  For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        local servers = {
          clangd = {},
          zls = {},
          codelldb = {},
          basedpyright = {},
          ruff = {},
          debugpy = {},
          -- gopls = {},
          -- pyright = {},
          -- rust_analyzer = {},
          -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
          --
          -- Some languages (like typescript) have entire language plugins that can be useful:
          --    https://github.com/pmizio/typescript-tools.nvim
          --
          -- But for many setups, the LSP (`ts_ls`) will work just fine
          -- ts_ls = {},
          --

          lua_ls = {
            -- cmd = { ... },
            -- filetypes = { ... },
            -- capabilities = {},
            settings = {
              Lua = {
                completion = {
                  callSnippet = 'Replace',
                },
              },
            },
          },
        }

        -- Ensure the servers and tools above are installed
        -- You can add other tools here that you want Mason to install
        -- for you, so that they are available from within Neovim.
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
          'stylua',
          'clangd',
          'zls',
          'codelldb',
          'basedpyright',
          'ruff',
          'debugpy',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
          ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
          automatic_installation = false,
          handlers = {
            function(server_name)
              local server = servers[server_name] or {}
              -- This handles overriding only values explicitly passed
              -- by the server configuration above. Useful when disabling
              -- certain features of an LSP (for example, turning off formatting for ts_ls)
              server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
              require('lspconfig')[server_name].setup(server)
            end,
          },
        }
      end,
    },
  },

  -- Plugin to show the cursor jumping around in the editor
  -- Helps readability for where the cursor is moving
  {
    'sphamba/smear-cursor.nvim',
    opts = {
      enabled = true,
      smear_between_buffgers = false,
      stiffness = 0.7,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.4,
    },
  },

  -- A powerful fuzzy finder that can look through buffers(files), the current buffer, documentation, LSPs and more
  -- has a nice ui with a popup window for better focusing.
  -- The documentation is pretty good and tj the creator of telescope has videos explaining the functionality
  -- The github is a good resource for how to use and configure telescope
  {
    {
      'nvim-telescope/telescope.nvim',
      -- This makes telescope load on neovim startup
      event = 'VimEnter',
      dependencies = {
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          -- `build` is used to run some command when the plugin is installed/updated.
          -- This is only run then, not every time Neovim starts up.
          build = 'make',
          -- `cond` is a condition used to determine whether this plugin should be
          -- installed and loaded.
          cond = function()
            return vim.fn.executable 'make' == 1
          end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      },
      config = function()
        require('telescope').setup {
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown(),
            },
          },
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set('n', '<leader>/', function()
          -- You can pass additional configuration to Telescope to change the theme, layout, etc.
          builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set('n', '<leader>s/', function()
          builtin.live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end, { desc = '[S]earch [/] in Open Files' })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set('n', '<leader>sn', function()
          builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
      end,
    },
  },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Used to highlight, edit and navigate code
  {
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      main = 'nvim-treesitter.configs',
      opts = {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'query', 'vim', 'vimdoc' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
          enable = true,
          -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
      },
    },
  },

  -- Shows pending keybinds and what they do in a popup window
  {
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
  },
  -- A collection of plugins
  ---@class snacks.Config
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {},
      lazygit = {},
      -- Shows how nested you are in curly braces or parenthasis for better clarity
      indent = {},
      input = {},
      notifier = {},
      rename = {},
    },
    keys = {
      {
        '<leader>l',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
    },
  },
}, {})
