return {
  'MeanderingProgrammer/markdown.nvim',
  opts = { file_types = { 'markdown', 'Avante' } },
  ft = { 'markdown', 'Avante' },
  main = 'render-markdown',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
