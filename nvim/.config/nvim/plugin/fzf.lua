-- ~/.config/nvim/plugin/fzf.lua

-- 1. Tell the package manager to load/download the plugin
vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

-- 2. Protect against the "First Run" crash! 
-- If it's still downloading, silently stop here and try again next time.
local ok, fzf = pcall(require, "fzf-lua")
if not ok then
    return
end

-- 3. The Setup (From your tutorial)
local actions = require('fzf-lua.actions')
fzf.setup({
    winopts = { backdrop = 85 },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-n"] = actions.toggle_ignore,
            ["ctrl-h"] = actions.toggle_hidden,
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})

-- 4. Set the keymaps using the PROPER Neovim function!
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Fuzzy Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Fuzzy Find Text" })
