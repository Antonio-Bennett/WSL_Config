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
    }
    --[[
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
	--]]
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], true)
