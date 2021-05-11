function _G.lsp_installed_servers()
  local lspinstall = require 'lspinstall'
  for _, server in ipairs(lspinstall.installed_servers()) do print(server) end
end

vim.cmd 'command! -nargs=0 CheckInstalledServers call v:lua.lsp_installed_servers()'

function _G.lsp_reinstall_all()
  local lspinstall = require 'lspinstall'
  for _, server in ipairs(lspinstall.installed_servers()) do
    lspinstall.install_server(server)
  end
end

vim.cmd 'command! -nargs=0 LspReinstallAll call v:lua.lsp_reinstall_all()'
