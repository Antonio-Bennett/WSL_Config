vim.o.completeopt = "menu,menuone,noinsert,noselect"

require('nvim-autopairs').setup()
require('compe').setup {
  enabled = true,
  debug = false,
  min_length = 2,
  preselect = "enable",
  source_timeout = 200,
  incomplete_delay = 400,
  allow_prefix_unmatch = false,
  source = {
    nvim_lsp = true,
    -- vim_dadbod_completion = true;
    vsnip = true,
    -- ultisnips = true,
    path = true,
    buffer = true,
    calc = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    treesitter = true
    -- tabnine = true
  }
}
local npairs = require('nvim-autopairs')

local function imap(lhs, rhs, opts)
  local options = {noremap = true, expr = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap('i', lhs, rhs, options)
end --

_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

MUtils.tab = function()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc("<C-n>")
  else
    if vim.fn["vsnip#available"](1) ~= 0 then
      vim.fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253,
                                    83))
      return npairs.esc("")
    else
      return npairs.esc("<Tab>")
    end
  end
end

MUtils.s_tab = function()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc("<C-p>")
  else
    if vim.fn["vsnip#jumpable"](-1) ~= 0 then
      vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
      return npairs.esc("")
    else
      return npairs.esc("<C-h>")
    end
  end
end

-- imap("<CR>", "compe#confirm()", {expr = true, noremap = true})
imap("<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
imap("<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
imap("<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})
--[[ vim.api.nvim_set_keymap("s", "<CR>", "v:lua.MUtils.completion_confirm()",
                        {expr = true, noremap = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.MUtils.tab()",
                        {expr = true, noremap = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.MUtils.s_tab()",
                        {expr = true, noremap = true}) ]]
