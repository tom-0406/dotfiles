vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

local ok, conform = pcall(require, "conform")
if not ok then
	return
end

-- 2. Configure Formatters
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Use prettier for all web-related files
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		go = { "goimports", "gofmt" },
	},
	-- 3. The "Magic" - Format on save
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- 4. Manual format keybind (Optional: Space + f)
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range" })
