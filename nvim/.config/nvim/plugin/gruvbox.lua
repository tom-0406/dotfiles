-- Download the modern Lua version of the theme
vim.pack.add({ 'https://github.com/ellisonleao/gruvbox.nvim' })

-- Gruvbox highly recommends explicitly telling Neovim you want the dark background
vim.opt.background = "dark"

-- Apply the theme
vim.cmd.colorscheme('gruvbox')
