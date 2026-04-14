return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      watch_for_changes = true,
      columns = {
        'icon',
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, _)
          return vim.startswith(name, '.')
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git' or name == '.DS_Store'
        end,
        -- Sort file names in a more intuitive order for humans. Is less performant,
        -- so you may want to set to false if you work with large directories.
        natural_order = true,
        -- Sort file and directory names case insensitive
        case_insensitive = false,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
    }
    -- Open parent direcory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
