-- Automatically detects pairs such as {}()[]""'' to create closing pairs when opening pairs are created
-- This also helps wrap selections when selecting text
-- The repo documentation isn't that good so read the deepwiki for better info
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
}
