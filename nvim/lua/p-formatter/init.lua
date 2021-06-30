-- prettier-eslint
local prettierEs = function()
  return {
    exe = "prettier-eslint",
    args = {"--stdin", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
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
    c = {function() return {exe = "clang-format", args = {}, stdin = true} end},
    cpp = {
      function() return {exe = "clang-format", args = {}, stdin = true} end
    },
    -- javascriptjsx = {prettier},
    -- typescript.tsx = {prettier}
    javascript = {prettierEs},
    javascriptreact = {prettierEs},
    typescript = {prettierEs},
    typescriptreact = {prettierEs},
    html = {prettierEs},
    css = {prettierEs},
    json = {prettierEs},
    markdown = {prettierEs},
    svelte = {prettierEs}
    -- toml = {prettierEs}
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], true)
