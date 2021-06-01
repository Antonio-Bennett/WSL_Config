vim.opt.iskeyword:append{"-"} -- treat dash separated words as a word text object"
vim.opt.shortmess:append{c = true} -- Don't pass messages to |ins-completion-menu|.
vim.opt.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.opt.wrap = true -- Display long lines as just one line
vim.opt.whichwrap:append{
  ['<'] = true,
  ['>'] = true,
  [','] = true,
  h = true,
  l = true
} -- move to next line with theses keys
vim.opt.syntax = "on" -- syntax highlighting
vim.cmd('filetype plugin indent on') -- file type identification, plugin and indenting
vim.opt.pumheight = 10 -- Makes popup menu smaller
vim.opt.fileencoding = "utf-8" -- The encoding written to file
vim.opt.cmdheight = 2 -- More space for displaying messages
-- vim.o.mouse = "a" -- Enable your mouse
vim.opt.splitbelow = true -- Horizontal splits will automatically be below
vim.opt.termguicolors = true -- set term giu colors most terminals support this
vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.go.t_Co = "256" -- Support 256 colors
vim.opt.ts = 4 -- Insert 2 spaces for a tab
vim.opt.sw = 4 -- Change the number of space characters inserted for indentation
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.smartindent = true -- Makes indenting smart
-- vim.wo.number = true -- set numbered lines <-- I have hybrid numbers at the bottom
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.showtabline = 2 -- Always show tabs
vim.opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.opt.backup = false -- This is recommended by coc
vim.opt.writebackup = false -- This is recommended by coc
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.cmd([[set undodir=~/.config/nvim/.vim-undo-dir/]])
vim.opt.undofile = true
vim.g.python3_host_prog = "/usr/bin/python" -- python runtime
vim.api.nvim_command(
    [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
vim.cmd([[
:set number relativenumber

fun! Rel()
    " Don't set on these filetypes
    if &ft =~ 'dashboard'
        return
    endif
    set relativenumber
endfun

fun! NoRel()
    " Don't set on these filetypes
    if &ft =~ 'dashboard'
        return
    endif
    set norelativenumber
endfun

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * call Rel()
:  autocmd BufLeave,FocusLost,InsertEnter   * call NoRel()
:augroup END
]])
