vim.api.nvim_set_keymap('n', '/', "<cmd>lua require'hop'.hint_patterns()<cr>",
                        {})
vim.api.nvim_set_keymap('n', '<leader>hw',
                        "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>hl',
                        "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>hc',
                        "<cmd>lua require'hop'.hint_char1()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>hcc',
                        "<cmd>lua require'hop'.hint_char2()<cr>", {})

-- Visual mode can be used to extend selection
vim.api.nvim_set_keymap('v', '/', "<cmd>lua require'hop'.hint_patterns()<cr>",
                        {})
vim.api.nvim_set_keymap('v', '<leader>hw',
                        "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('v', '<leader>hl',
                        "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap('v', '<leader>hc',
                        "<cmd>lua require'hop'.hint_char1()<cr>", {})
vim.api.nvim_set_keymap('v', '<leader>hcc',
                        "<cmd>lua require'hop'.hint_char2()<cr>", {})
