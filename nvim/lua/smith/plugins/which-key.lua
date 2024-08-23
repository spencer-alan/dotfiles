return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@param ctx { mode: string, operator: string }
  defer = function(ctx)
    if vim.list_contains({ 'd', 'y' }, ctx.operator) then
      return true
    end
    return vim.list_contains({ '<C-V>', 'V' }, ctx.mode)
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
