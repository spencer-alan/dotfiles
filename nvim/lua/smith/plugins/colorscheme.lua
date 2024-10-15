return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme tokyonight-storm'
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
--       fluo_color = 'pink', --  Fluo color: pink, yellow, orange, or green.
--       mode = 'normal', -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
--       aggressive_spell = false, -- Display colors for spell check.
--     }
--     vim.cmd 'colorscheme flow'
--   end,
-- }
