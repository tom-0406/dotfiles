-- ~/.config/nvim/plugin/autopairs.lua

-- 1. Download the plugin
vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
})

-- 2. Safely load it
local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
	return
end

-- 3. Configure it for VS Code-like behavior
autopairs.setup({
	-- Link it to your existing Treesitter setup!
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		go = { "string" },
	},
	-- Don't add pairs if the very next character is an alphanumeric letter
	enable_afterquote = false,
	-- Prevent weird behavior in specific prompt windows
	disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
})
