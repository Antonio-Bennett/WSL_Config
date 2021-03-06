vim.api
    .nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>',
                        {noremap = true, silent = true})

-- Save/save and quit and quit
vim.api.nvim_set_keymap('n', '<Leader>s', ':w<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ss', ':wq<CR>',
                        {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +2<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -2<CR>',
                        {noremap = true, silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', '::BufferPrevious<CR>',
                        {noremap = true, silent = true})

-- These commands will move the current buffer backwards or forwards in the bufferline
vim.api.nvim_set_keymap('n', 'H', ':BufferMovePrevious<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'L', ':BufferMoveNext<CR>',
                        {noremap = true, silent = true})

-- close the current buffer
vim.api.nvim_set_keymap('n', '<Leader>c', ':bd<CR>',
                        {noremap = true, silent = true})

-- close all buffers except current
vim.api.nvim_set_keymap('n', '<leader>ca', ':%bd|e#|bd#<CR>',
                        {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv',
                        {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])
