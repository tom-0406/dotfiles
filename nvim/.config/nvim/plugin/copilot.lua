-- ~/.config/nvim/plugin/copilot.lua

-- 1. Download the Copilot Lua plugin
vim.pack.add({
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
})

local ok, copilot = pcall(require, "copilot")
if not ok then
	return
end

-- 2. Configure the stealth behavior
copilot.setup({
	-- Disable the bulky side-panel feature
	panel = { enabled = false },

	suggestion = {
		enabled = true,
		-- THIS IS THE MAGIC: Turn off the constant, distracting auto-suggestions
		auto_trigger = false,

		-- Custom keybinds (Only active while in Insert mode)
		keymap = {
			-- Ctrl + j: Summon the AI (or cycle to the next alternative suggestion)
			next = "<M-j>",

			-- Ctrl + k: Cycle to the previous alternative suggestion
			prev = "<M-k>",

			-- Ctrl + l: Accept the snippet and insert it into your code
			accept = "<M-l>",

			-- Ctrl + h: Dismiss the ghost text and hide it
			dismiss = "<M-h>",
		},
	},
})
