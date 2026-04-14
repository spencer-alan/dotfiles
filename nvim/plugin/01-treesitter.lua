vim.pack.add({ 'https://github.com/romus204/tree-sitter-manager.nvim' })
require('tree-sitter-manager').setup({
  ensure_installed = {
    'go',
    'zig',
    'lua',
    'bash',
    'svelte',
    'html',
    'css',
    'javascript',
    'typescript',
    'markdown',
    'markdown_inline',
  },
})
