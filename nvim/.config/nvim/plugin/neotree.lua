vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require('neo-tree').setup({
  close_if_last_window = true, -- Close Neovim if Neo-tree is the last window open
  enable_git_status = true,
  enable_diagnostics = true,
  
  filesystem = {
    filtered_items = {
      visible = true, -- Show hidden files (like .gitignore or .env)
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        ".git"
      },
    },
    -- Automatically expand the tree to highlight the file you are currently editing
    follow_current_file = {
      enabled = true,
    },
  },
})

-- 3. Set a global keybind to quickly toggle the sidebar
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle File Explorer' })
