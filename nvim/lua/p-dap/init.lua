-- Mappings
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<F9>', ':lua require"dap".continue()<CR>', opts)
vim.api.nvim_set_keymap('n', '<F10>', ':lua require"dap".step_over()<CR>', opts)
vim.api.nvim_set_keymap('n', '<F11>', ':lua require"dap".step_into()<CR>', opts)
vim.api.nvim_set_keymap('n', '<F12>', ':lua require"dap".step_out()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>b',
                        ':lua require"dap".toggle_breakpoint()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>cb',
                        ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<leader>lp',
                        ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: ")<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require"dap".run_last()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua require"dapui".toggle()<CR>',
                        opts)

-- This is for the virtual text
vim.g.dap_virtual_text = true

-- This is dap ui default setup
require("dapui").setup()

-- Run the debug adapters and configurations

-- C/C++
vim.cmd [[
    command! -complete=file -nargs=* DebugC lua require "p-dap.c_c++".start_c_debugger({<f-args>}, "gdb")
]]

-- RUST
vim.cmd [[
    command! -complete=file -nargs=* DebugRust lua require "p-dap.rust".start_rust_debugger({<f-args>}, "gdb", "rust-gdb")
]]
