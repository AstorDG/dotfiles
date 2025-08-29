-- Plugin to show the cursor jumping around in the editor
-- Helps readability for where the cursor is moving
return {
  'sphamba/smear-cursor.nvim',
  opts = {
    enabled = true,
    smear_between_buffgers = false,
    stiffness = 0.7,
    trailing_stiffness = 0.5,
    distance_stop_animating = 0.4,
  },
}
