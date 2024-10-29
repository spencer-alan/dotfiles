return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme tokyonight'
  end,
}
-- return {
--   '0xstepit/flow.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require('flow').setup {
--       dark_theme = true, -- Set the theme with dark background.
--       transparent = false, -- Set transparent background.
--       high_contrast = false, -- Make the dark background darker and the light background lighter.
--       fluo_color = 'green', --  Fluo color: pink, yellow, orange, or green.
--       mode = 'normal', -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
--       aggressive_spell = false, -- Display colors for spell check.
--     }
--     vim.cmd 'colorscheme flow'
--   end,
-- }
-- return {
--   'neanias/everforest-nvim',
--   version = false,
--   lazy = false,
--   priority = 1000, -- make sure to load this before all the other start plugins
--   -- Optional; default configuration will be used if setup isn't called.
--   opts = {},
--   config = function()
--     require('everforest').setup {
--       -- Your config here
--     }
--   end,
-- }
