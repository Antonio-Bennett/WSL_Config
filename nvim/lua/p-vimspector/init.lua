vim.g.vimspector_enable_mappings = 'HUMAN'

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<leader>di', '<Plug>VimspectorBalloonEval', opts)
vim.api.nvim_set_keymap('v', '<leader>di', '<Plug>VimspectorBalloonEval', opts)

vim.g.vimspector_install_gadgets = {'CodeLLDB'}
