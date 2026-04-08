-- ~/.config/nvim/plugin/alpha.lua

-- 1. Download Alpha and DevIcons
vim.pack.add({
    { src = "https://github.com/goolord/alpha-nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

-- 2. Protect against the first-run download crash
local ok, alpha = pcall(require, "alpha")
if not ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

-- 3. Define the official Norwich City FC Hex Codes
vim.api.nvim_set_hl(0, "NorwichYellow", { fg = "#FFF200" })
vim.api.nvim_set_hl(0, "NorwichGreen", { fg = "#00A650" })

-- 4. The ASCII Art Array (43 Lines)
-- 4. The ASCII Art Array (43 Lines, 70 Chars wide)
dashboard.section.header.val = {
    [[**********************************************************************]],
    [[**********************************************************************]],
    [[****+-+=-+=-+=-+==+-=+-=+-=+-=****************************************]],
    [[****=::::::::::::::::::::::::=*********************+-:::::-+**********]],
    [[****=::+-:-=-::::-::::+-:-=::=********************::-*****-:+*********]],
    [[****=::--::-:::****-::-::--::=******************+::+=:::::-+=::-******]],
    [[****+=--------=****+---------+*****************+::=+::::::+***********]],
    [[************++********************************+:::-+-::::=+::=********]],
    [[**********+--::=**==+++======****************+:::::-++==*=:::+********]],
    [[*********+=+::-:=*++++++++++++**************-::::::::::::::::+********]],
    [[*****=-***+=+-::==---------==+************-:::::::::::::::::-*********]],
    [[******+=-:=+==::-=:::=-::::-=*************++++++++++***=::::=*********]],
    [[***********-::++****-:**=::+:=********=::::::=*-:::::=+:::::+*********]],
    [[*********=::-+******+:******-=******+:::::::=+-:::::=+:::::=**********]],
    [[*****---+********+----+*+----+*****:::::::-*=::::::=+-:::::+**********]],
    [[*********************************-:::::-+*=:::::::++::::::=***********]],
    [[*******************************+===+*++=::::::::=*=::::::=************]],
    [[*****************************=::::::::::::::::=*=:::::::+*************]],
    [[***************************=:::::::::::::::-++-:::::::-***************]],
    [[*************************+:::::::::::::=+*+-::::::::-+****************]],
    [[ ************************************=-::::::::::::+******************]],
    [[ *********************-::::::=*-::::::::::::::::+******************** ]],
    [[ *******************-::::::=*=::::::::::::::-************************ ]],
    [[ *****************=::::::-*=:::::::----+***************************** ]],
    [[  **************=::::::-+******==***=******************************* ]],
    [[  ************+::::::-+********+-+**=-****************************** ]],
    [[   *********+-:::::-+***********=-+++-=**************************** ]],
    [[    *******=----=+**********+---+-::::::-+************************ ]],
    [[     *********************=:::::=+:==::::::=********************* ]],
    [[      *******************-::::-+++=:-+*=::::-******************* ]],
    [[       *****************-::::=+-::*-::::+::::-+**************** ]],
    [[        ***************=::::-=::::-*::::::::::=**************** ]],
    [[        ***************-:::::::::::==::::::::::+*************#        ]],
    [[          *************::::::::::::::::::::::::+************ ]],
    [[           ************-::::::::::::::::::::::-************ ]],
    [[             **********+::::::::::::::::::::::=********** ]],
    [[              **********=::::::::::::::::::::=********** ]],
    [[                *********=::::::::::::::::::=********* ]],
    [[                  *********=::::::::::::::=********* ]],
    [[                     *********+-::::::-+********* ]],
    [[                       ************************ ]],
    [[                           ***************** ]],
    [[                              #********* ]]
}

-- 5. Intelligent Color Mapper
-- Scans the ASCII art and colors it based on the characters used!
local color_map = {}
for _, line in ipairs(dashboard.section.header.val) do
    local line_hl = {}
    local start_col = 0
    local current_color = nil
    
    for col = 1, #line do
        local char = line:sub(col, col)
        
        -- Default to Yellow for the foreground details
        local char_color = "NorwichYellow" 
        
        -- If it's an asterisk or hash, make it Green for the shield
        if char == "*" or char == "#" or char == " " then
            char_color = "NorwichGreen"
        end
        
        -- Logic to group contiguous colors together for Alpha
        if current_color == nil then
            current_color = char_color
            start_col = col - 1
        elseif current_color ~= char_color then
            table.insert(line_hl, { current_color, start_col, col - 1 })
            current_color = char_color
            start_col = col - 1
        end
    end
    
    -- Add the final color chunk at the end of the line
    if current_color ~= nil then
        table.insert(line_hl, { current_color, start_col, #line })
    end
    
    table.insert(color_map, line_hl)
end

dashboard.section.header.opts.hl = color_map
-- 6. The Menu Buttons
dashboard.section.buttons.val = {
    dashboard.button("f", "󰈞  Find file", "<cmd>FzfLua files<CR>"),
    dashboard.button("g", "󰊄  Live grep", "<cmd>FzfLua live_grep<CR>"),
    dashboard.button("p", "  Load Project", "<cmd>lua PickProject()<CR>"),
    dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert <CR>"),
    dashboard.button("c", "  Config", "<cmd>cd ~/.config/nvim <BAR> FzfLua files<CR>"),
    dashboard.button("q", "󰅙  Quit", "<cmd>qa<CR>"),
}

-- 7. Send it to Neovim
alpha.setup(dashboard.opts)
