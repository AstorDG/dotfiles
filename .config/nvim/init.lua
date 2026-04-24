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

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Neovim Splits
map('n', '<M-v>', '<cmd>vsplit<cr>', { desc = 'Create a vertial split' })
map('n', '<M-b>', '<cmd>split<cr>', { desc = 'Create a horizontal split' })
map('n', '<M-g>', '<cmd>q<cr>', { desc = 'Close a split' })

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
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },

  -- Color configurer
  { src = 'https://github.com/catppuccin/nvim', { name = 'catppuccin' } },

  -- Renders RGB and hex colors in neovim
  { src = 'https://github.com/norcalli/nvim-colorizer.lua' },

  -- Shows pending keybinds and what they do in a popup window
  { src = 'https://github.com/folke/which-key.nvim' },

  -- Renders a file tree and allows you to browse it
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '3' },

  -- Adds a tab bar with open buffers(files) at the top of neovim
  { src = 'https://github.com/romgrk/barbar.nvim' },

  -- Status line plugin
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },

  -- Automatically detects pairs such as {}()[]""'' to create closing pairs when opening pairs are created
  { src = 'https://github.com/windwp/nvim-autopairs' },

  -- Allows for quick navigation of text and better highlighting from f
  { src = 'https://github.com/folke/flash.nvim' },

  -- Adds highlighting for todos and notes
  { src = 'https://github.com/folke/todo-comments.nvim' },

  -- better ui for commands and searching with /
  -- Commented out for now because it's bugging with ui2
  -- It also seems like it's not being updated
  -- { src = 'https://github.com/folke/noice.nvim',},

  -- Markdown renderer
  { src = 'https://github.com/MeanderingProgrammer/markdown.nvim' },

  -- Collection of various small independent plugins/modules for things I don't want to dedicate a whole plugin to
  -- For a full list of availalble mini plugins check the github repo.
  { src = 'https://github.com/echasnovski/mini.nvim' },

  -- Another collection of plugins. Mostly used for lazygit integration
  { src = 'https://github.com/folke/snacks.nvim' },

  -- Adds git colors to the left of line numbers
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },

  -- Used to install language parsers for tree sitter support
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

  -- shows lsp notifcations and progress in their own window
  { src = 'https://github.com/j-hui/fidget.nvim' },

  -- LSP plugins
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },

  -- Linting
  { src = 'https://github.com/mfussenegger/nvim-lint' },

  -- Debugging
    -- Shows how to use the DAP plugin to debug your code.
    -- Primarily focused on configuring the debugger for Go, but can be extended to other languages as well.
  { src = 'https://github.com/mfussenegger/nvim-dap' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/jay-babu/mason-nvim-dap.nvim' },
  { src = 'https://github.com/leoluz/nvim-dap-go' },
  { src = 'https://github.com/mfussenegger/nvim-dap-python' },

  -- LSP autocomplete
  --   -- Autocompletion. This interacts with LSPs, linters, formatters and snippets to add a menu of possible completions from all of those tools
  --   -- Has a snippet Engine as a dependency to add snippet functionality. This is nice because you don't have to install those separately
  --   -- Snippets are character shortcuts that add some longer text based on input characters. Examples can be seen on the lua-snip repo
  --   -- freindly-snippets is just a library of snippets
  --   -- I would suggest looking at deepwiki to understand more deeply how all of the tools work together
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
  -- Snippets
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  -- Formats code in a buffer(file) when run. It uses the current lsp to do formatting
  { src = 'https://github.com/stevearc/conform.nvim' },

  -- Telescope and some of it's extensions
  -- A powerful fuzzy finder that can look through buffers(files), the current buffer, documentation, LSPs and more
  -- has a nice ui with a popup window for better focusing.
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
}

vim.cmd 'packloadall'

-- ===================== PLUGIN CONFIGURATION =================
--

local dap = require('dap')
local dapui = require('dapui')

require('mason-nvim-dap').setup {
  automatic_installation = true,
  handlers = {},
  ensure_installed = {
    'delve',
    'debugpy',
    'codelldb',
  },
}

dapui.setup {
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

-- Breakpoint icons
vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
local breakpoint_icons = vim.g.have_nerd_font
    and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
  or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
for type, icon in pairs(breakpoint_icons) do
  local tp = 'Dap' .. type
  local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
  vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

-- Auto open/close dapui
dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

-- Go
require('dap-go').setup {
  delve = {
    detached = vim.fn.has 'win32' == 0,
  },
}

-- Python
local dap_python = require('dap-python')
local function find_uv_python()
  local cwd = vim.fn.getcwd()
  local uv_venv = cwd .. '/.venv/bin/python'
  if vim.fn.executable(uv_venv) == 1 then
    return uv_venv
  end
  local parent_venv = vim.fn.finddir('.venv', cwd .. ';')
  if parent_venv ~= '' then
    return parent_venv .. '/bin/python'
  end
  return 'python'
end
dap_python.setup(find_uv_python())
dap_python.test_runner = 'pytest'

-- Zig
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
    args = { '--port', '${port}' },
  },
}

dap.configurations.zig = {
  {
    name = 'Debug Zig executable',
    type = 'codelldb',
    request = 'launch',
    program = '${workspaceFolder}/zig-out/bin/main',
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {},
    preLaunchTask = 'zig build',
  },
}

-- Keymaps
vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Toggle [b]reakpoint' })
vim.keymap.set('n', '<Leader>dt', dapui.toggle, { desc = 'See las[t] session result' })
vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Step [i]nto' })
vim.keymap.set('n', '<F3>', dap.continue, { desc = '[C]ontinue' })
vim.keymap.set('n', '<F4>', dap.step_over, { desc = 'Step [o]ver' })
vim.keymap.set('n', '<F5>', dap.step_out, { desc = 'Step o[u]t' })

local lint = require 'lint'

lint.linters_by_ft = {
  python = { 'ruff' },
}

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.bo.modifiable then
      lint.try_lint()
    end
  end,
})

require('conform').setup {}
vim.keymap.set('n', '<leader>m', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = 'For[m]at Buffer' })

-- Build jsregexp support for luasnip
if vim.fn.has 'win32' == 0 and vim.fn.executable 'make' == 1 then
  local luasnip_path = vim.fn.stdpath 'data' .. '/site/pack/core/opt/LuaSnip'
  if vim.fn.filereadable(luasnip_path .. '/build/jsregexp.so') == 0 then
    vim.fn.system('make -C ' .. luasnip_path .. ' install_jsregexp')
  end
end

-- Load your custom snippets
require('luasnip.loaders.from_vscode').lazy_load {
  paths = { vim.fn.stdpath 'config' .. '/snippets' },
}

require('blink.cmp').setup {
  keymap = {
    preset = 'default',
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
  snippets = { preset = 'luasnip' },
  signature = { enabled = true },
}

-- Every time a new file is opened that is associated with an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    local function_map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
    if client and client.server_capabilities.inlayHintProvider then
      function_map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end

    -- Enable codelens for any LSP that supports it
    -- Codelens shows inline information like references, implementations, etc.
    if client and client.server_capabilities.codeLensProvider then
      local codelens_augroup = vim.api.nvim_create_augroup('kickstart-lsp-codelens', { clear = false })
      vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave', 'CursorHold', 'LspAttach' }, {
        buffer = event.buf,
        group = codelens_augroup,
        callback = function()
          vim.lsp.codelens.enable(true, { bufnr = event.buf })
        end,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach-codelens', { clear = true }),
        callback = function(event2)
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-codelens', buffer = event2.buf }
        end,
      })
    end

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    function_map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    function_map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references for the word under your cursor.
    function_map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    -- Useful when your language has ways of declaring types without an actual implementation.
    function_map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to the definition of the word under your cursor.
    -- This is where a variable was first declared, or where a function is defined, etc.
    -- To jump back, press <C-t>.
    function_map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    -- For example, in C this would take you to the header.
    function_map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all the symbols in your current document.
    -- Symbols are things like variables, functions, types, etc.
    function_map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

    -- Fuzzy find all the symbols in your current workspace.
    -- Similar to document symbols, except searches over your entire project.
    function_map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

    -- Jump to the type of the word under your cursor.
    -- Useful when you're not sure what type a variable is and you want to see
    -- the definition of its *type*, not where it was *defined*.
    function_map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
  end,
})
-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  float = { border = 'rounded' },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    spacing = -5,
    -- format = function(diagnostic)
    --   local diagnostic_message = {
    -- 	[vim.diagnostic.severity.ERROR] = diagnostic.message,
    -- 	[vim.diagnostic.severity.WARN] = diagnostic.message,
    -- 	[vim.diagnostic.severity.INFO] = diagnostic.message,
    -- 	[vim.diagnostic.severity.HINT] = diagnostic.message,
    --   }
    --   return diagnostic_message[diagnostic.severity]
    -- end,
  },
}
-- Add installed LSPs here so that they will be installed on other machines when migrating this config.

local capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
  clangd = {},
  zls = {},
  codelldb = {},
  basedpyright = {},
  ruff = {},
  debugpy = {},
  qmlls = {},
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

require('mason').setup {}

require('mason-lspconfig').setup {
  ensure_installed = {}, -- explicitly set to an empty table (Populates installs via mason-tool-installer)
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

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua',
  'ruff',
  'debugpy',
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }
require('fidget').setup {}
--
-- compiles fzf if not already compiled on system. This has to happpppen before the plugin is setup
local fzf_path = vim.fn.stdpath 'data' .. '/site/pack/core/opt/telescope-fzf-native.nvim'
if vim.fn.filereadable(fzf_path .. '/build/libfzf.so') == 0 then
  vim.fn.system('make -C ' .. fzf_path)
end

require('telescope').setup {}
pcall(require('telescope').load_extnsion, 'fzf')
pcall(require('telescope').load_extnsion, 'ui-select')
local telescope_builtin = require 'telescope.builtin'
map('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sk', telescope_builtin.keymaps, { desc = '[S]earch [K]eymaps' })
map('n', '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>ss', telescope_builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
map('n', '<leader>sw', telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', telescope_builtin.resume, { desc = '[S]earch [R]esume' })
map('n', '<leader>s.', telescope_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map('n', '<leader><leader>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })

map('n', '<leader>/', function()
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

map('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

require('nvim-treesitter').setup {
  ensure_installed = { 'lua' },
}

require('todo-comments').setup {}

require('snacks').setup {
  image = { enabled = true },
  lazygit = { enabled = true },
  -- Shows how nested you are in curly braces or parenthasis for better clarity
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
}
map('n', '<leader>l', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })

-- tab bar is offset by neo-tree in the sidebar_filetypes option
require('barbar').setup {
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

-- keybinds are set to move between buffers(files), rearange them and close them
map('n', '<A-,>', ':BufferPrevious<CR>', { noremap = true, silent = true, desc = 'Ba[R]Bar Buffer[P]revious' })
map('n', '<A-.>', ':BufferNext<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar Buffer[N]ext' })
map('n', '<leader>rl', ':BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar MoveBuffer[L]eft' })
map('n', '<leader>rr', ':BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar MoveBuffer[R]ight' })
map('n', '<leader>ri', ':BufferPin<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar p[I]n' })
map('n', '<leader>rc', ':BufferClose<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar Buffer[C]lose' })
map('n', '<leader>ra', ':BufferCloseAllButCurrent<CR>', { noremap = true, silent = true, desc = 'Ba[R]bar BufferClose[A]llButCurrent' })

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

require('neo-tree').setup {
  window = {
    position = 'left',
    width = 0.1,
  },
  close_if_last_window = true,
  sort_case_insensitive = true,
  filesystem = {
    filtered_items = {
      visible = true,
    },
  },
}
vim.keymap.set('n', '\\', '<Cmd>Neotree toggle<CR>')

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

require('mini.ai').setup { n_lines = 500 }
require('mini.surround').setup()
require('colorizer').setup {
  '*',
  css = { rgb_fn = true },
}
-- flash keybinds
vim
  .keymap
  .set({ 'n', 'x', 'o' }, '<leader>f', function()
    require('flash').jump()
  end, { desc = 'Flash' })
