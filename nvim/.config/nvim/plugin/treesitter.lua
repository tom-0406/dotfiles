-- ~/.config/nvim/plugin/treesitter.lua

-- 1. Load the plugin using your working package manager syntax
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- 2. Safely load the new API module
local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
	return
end

-- 3. Install Parsers (The new asynchronous method per the docs)
ts.install({
	"javascript",
	"typescript",
	"tsx",
	"html",
	"css",
	"lua",
	"vim",
	"vimdoc",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"python",
})

-- 4. Enable Features (Highlighting and Indents via FileType Autocommand)
vim.api.nvim_create_autocmd("FileType", {
	-- We list the actual Neovim filetypes here (Note: tsx = typescriptreact)
	pattern = {
		"javascript",
		"typescript",
		"typescriptreact",
		"javascriptreact",
		"html",
		"css",
		"lua",
		"go",
		"python",
	},
	callback = function()
		-- Enable Highlighting (Native Neovim)
		pcall(vim.treesitter.start)

		-- Enable Indentation (Experimental plugin feature per docs)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
