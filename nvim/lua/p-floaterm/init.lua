-- Floaterm
vim.g.floaterm_keymap_toggle = '<F1>'
vim.g.floaterm_keymap_next = '<leader>fn'
vim.g.floaterm_keymap_prev = '<leader>fp'
vim.g.floaterm_keymap_new = '<F2>'
vim.g.floaterm_keymap_kill = '<leader>fc'
-- vim.g.floaterm_title = 'Term'

vim.g.floaterm_gitcommit = 'floaterm'
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
-- vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1

-- Open floaterm and run lazygit
vim.api.nvim_set_keymap('n', '<Leader>lg', ':FloatermNew! lg<CR>',
                        {noremap = true, silent = true})
