return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins need as dependency
  'christoomey/vim-tmux-navigator', -- tmux & split window help
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  -- This is equivalent to:
  --   require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', opts = {} },
}
