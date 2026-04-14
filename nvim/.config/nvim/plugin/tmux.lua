-- ~/.config/nvim/plugin/tmux.lua

-- Download the navigator plugin using your native package manager
vim.pack.add({
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
})

-- We don't even need a setup() function for this one!
-- The plugin automatically binds <C-h>, <C-j>, <C-k>, and <C-l> in Neovim
-- to safely pass your cursor over to Tmux when you hit the edge of the screen.
