vim.o.completeopt = "menu,menuone,noinsert,noselect"

require('nvim-autopairs').setup()
require('compe').setup {
    enabled = true;
    debug = false;
    min_length = 2;
    preselect = "enable";
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;
    source = {
      nvim_lsp = true;
      --vim_dadbod_completion = true;
      vsnip = true;
      path = true;
      buffer = true;
    };
}
local npairs = require('nvim-autopairs')

--[[function imap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap('i', lhs, rhs, options)
end--]]

_G.MUtils = {}

MUtils.completion_confirm=function()
    if vim.fn.pumvisible() ~= 0  then
        if vim.fn.complete_info()["selected"] ~= -1 then
          vim.fn["compe#confirm"]()
          return npairs.esc("")
        else
          vim.fn.nvim_select_popupmenu_item(0, false, false,{})
          vim.fn["compe#confirm"]()
          return npairs.esc("<c-n>")
        end
    else
        return npairs.check_break_line_char()
    end
end

MUtils.tab=function()
    if vim.fn.pumvisible() ~= 0  then
        return npairs.esc("<C-n>")
    else
        if vim.fn["vsnip#available"](1) ~= 0 then
            return vim.fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253, 83))
        else
            return npairs.esc("<Tab>")
        end
    end
end

MUtils.s_tab=function()
    if vim.fn.pumvisible() ~= 0  then
        return npairs.esc("<C-p>")
    else
        if vim.fn["vsnip#jumpable"](-1) ~= 0 then
            return vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
        else
            return npairs.esc("<C-h>")
        end
    end
end



vim.api.nvim_set_keymap("i", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})
vim.api.nvim_set_keymap("s", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})
