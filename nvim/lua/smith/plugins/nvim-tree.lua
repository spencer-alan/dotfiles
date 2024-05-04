return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require 'nvim-tree'

    --recommended settings form nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup {
      view = {
        width = 35,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            git = {
              untracked = '',
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { '.DS_Store' },
      },
      git = {
        ignore = false,
      },
    }

    -- set keymaps
    local keymap = vim.keymap
    keymap.set('n', '<leader>te', '<cmd>NvimTreeToggle<CR>', { desc = '[T]ree [E]xplorer toggle' })
    keymap.set('n', '<leader>tf', '<cmd>NvimTreeFindFileToggle<CR>', { desc = '[T]ree Explorer on [F]ile toggle' })
    keymap.set('n', '<leader>tc', '<cmd>NvimTreeCollapse<CR>', { desc = '[T]ree Explorer [C]ollapse' })
    keymap.set('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', { desc = '[T]ree Explorer [R]efresh' })
  end,
}
