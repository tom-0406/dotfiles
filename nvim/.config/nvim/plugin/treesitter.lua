-- ~/.config/nvim/plugin/treesitter.lua

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

configs.setup({
  -- Ensure these exact names are present
  ensure_installed = { 
    "javascript", 
    "typescript", 
    "tsx", 
    "html", 
    "css", 
    "lua",
    "vim",
    "vimdoc" 
  },
  
  -- Enable modern syntax highlighting
  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  
  -- THIS IS THE FIX: Enable structural indentation
  indent = { 
    enable = true 
  }, 
})
