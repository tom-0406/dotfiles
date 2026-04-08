vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities()
})

vim.lsp.enable({
  "lua_ls",
  "ts_ls",
  "tailwindcss",
})
vim.diagnostic.config({ virtual_text = true })
