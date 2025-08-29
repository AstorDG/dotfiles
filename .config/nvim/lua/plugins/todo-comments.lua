-- Highlight TODO, NOTE and WARNING in comments for better readability
-- The github repo is a good way to know what all the options are. It's a small extension
return {
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
