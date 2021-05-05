vim.g.vimspector_enable_mappings = 'HUMAN'

local opts = {noremap = true, silent = true}

-- Don't really see the point of these right now but they are recommended to set
vim.api.nvim_set_keymap('n', '<leader>di', '<Plug>VimspectorBalloonEval', opts)
vim.api.nvim_set_keymap('v', '<leader>di', '<Plug>VimspectorBalloonEval', opts)

-- Closes Debugger and resets everything nicely instead of the close buffer func I have in keymappings
-- Reset is cleaner imo so Space <F3> will now be reset as <F3> cannot be remapped from stop
vim.api.nvim_set_keymap('n', '<leader><F3>', ':call vimspector#Reset()<CR>',
                        opts)
-- vim.api.nvim_set_keymap('n', '<leader><F3>', '<Plug>VimspectorStop', opts)

vim.g.vimspector_install_gadgets = {'CodeLLDB', 'debugger-for-chrome'}
