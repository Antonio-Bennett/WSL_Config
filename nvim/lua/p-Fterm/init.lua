require'FTerm'.setup({
  dimensions = {height = 0.9, width = 0.9, x = 0.5, y = 0.5},
  border = 'single' -- or 'double'
})

-- Keybinding
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Closer to the metal
map('n', '<F1>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<F1>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
