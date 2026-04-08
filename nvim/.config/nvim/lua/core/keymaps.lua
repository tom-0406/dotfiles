-- Fast Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window (Neo-tree)' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window (File)' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })


-- LSP
vim.keymap.set('n','K',vim.lsp.buf.hover, {desc = 'Hover docs'})

-- FZF
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Fuzzy Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Fuzzy Find Text" })

-- Web dev
vim.keymap.set("n", "<leader>nr", "<cmd>split | term npm run dev<CR>", { desc = "Run npm run dev" })

-- 1. The mapping for when you are actively typing in the terminal
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:bd!<CR>]], { desc = "Force close terminal" })

-- 2. The mapping for when you are in Normal mode, applied ONLY to terminal windows
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-bindings", { clear = true }),
    callback = function()
        vim.keymap.set("n", "<C-q>", "<cmd>bd!<CR>", { buffer = true, desc = "Force close terminal" })
    end,
})

-- Custom Project Picker
_G.PickProject = function()
    -- 1. DEFINE YOUR MASTER FOLDER HERE:
    -- Where do you keep all your code? (e.g., "~/testProj", "~/Projects", "~/Documents/Code")
    local search_dir = "~/Projects"

    -- 2. Build the search command (Find directories, max 2 levels deep)
    local cmd = string.format("find %s -mindepth 1 -maxdepth 2 -type d", search_dir)

    -- 3. Run the fuzzy finder
    require("fzf-lua").fzf_exec(cmd, {
        prompt = "Load Project> ",
        actions = {
            ["default"] = function(selected)
                if #selected > 0 then
                    local dir = selected[1]
                    -- Change Neovim's global working directory
                    vim.cmd("cd " .. dir)
                    -- Show a success message
                    vim.notify("Project loaded: " .. dir, vim.log.levels.INFO)
                    -- Automatically pop open the file finder in the new project!
                    require("fzf-lua").files()
                end
            end
        }
    })
end

-- Add a keybind so you can switch projects from anywhere
vim.keymap.set("n", "<leader>fp", "<cmd>lua PickProject()<CR>", { desc = "Find Project" })
