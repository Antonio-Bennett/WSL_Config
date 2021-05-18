MUtils.toggle = function()
  local open = function()
    require'bufferline.state'.set_offset(31)
    require'nvim-tree'.find_file(true)
  end

  local close = function()
    require'bufferline.state'.set_offset(0)
    require'nvim-tree'.close()
  end

  local view = require 'nvim-tree.view'
  local lib = require 'nvim-tree.lib'

  if view.win_open() then
    close()
  else
    if vim.g.nvim_tree_follow == 1 then
      open()
    else
      lib.open()
    end
  end
end

vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd> lua MUtils.toggle()<CR>',
                        {noremap = true, silent = true})
