-- prettier-eslint
local prettier = function()
  return {
    exe = "prettier-eslint",
    args = {
      "--stdin", "--stdin-filepath", vim.api.nvim_buf_get_name(0),
      '--single-quote'
    },
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    rust = {
      -- Rustfmt
      function()
        return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
      end
    },
    lua = {
      -- lua-format from luarocks
      function()
        return {exe = "lua-format", args = {"--indent-width=2"}, stdin = true}
      end
    },
    -- javascriptjsx = {prettier},
    -- typescript.tsx = {prettier}
    javascript = {prettier},
    javascriptreact = {prettier},
    typescript = {prettier},
    typescriptreact = {prettier},
    html = {prettier},
    css = {prettier},
    json = {prettier}
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], true)
