-- LspSaga default setup
-- Using its functions in the keymaps
require'lspsaga'.init_lsp_saga()

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd',
                 '<Cmd>lua require\'lspsaga.provider\'.preview_definition()<CR>',
                 opts)
  buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',
                 opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gh',
                 '<cmd>lua require\'lspsaga.provider\'.lsp_finder()<CR>', opts)
  buf_set_keymap('n', 'gs',
                 '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>',
                 opts)
  buf_set_keymap('n', 'K',
                 '<Cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>',
                 opts)
  buf_set_keymap('n', '<C-d>',
                 '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>',
                 opts)
  buf_set_keymap('n', '<C-u>',
                 '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>',
                 opts)
  buf_set_keymap('n', 'ca',
                 '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>',
                 opts)
  buf_set_keymap('v', 'ca',
                 ':<C-U>lua require(\'lspsaga.codeaction\').code_action()<CR>',
                 opts)
  buf_set_keymap('n', '<space>wa',
                 '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr',
                 '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl',
                 '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                 opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                 opts)
  buf_set_keymap('n', '<leader>cd',
                 '<cmd>lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>',
                 opts)
  -- show ^^ automatically on cursor hold
  vim.api.nvim_command(
      [[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_cursor_diagnostics()]])
  buf_set_keymap('n', '<space>gn',
                 '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>',
                 opts)
  buf_set_keymap('n', '<space>gp',
                 '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>',
                 opts)
  buf_set_keymap('n', '<space>q',
                 '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                   opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>F",
                   "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#323e4a
      hi LspReferenceText cterm=bold ctermbg=red guibg=#323e4a
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#323e4a
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  require'lsp_signature'.on_attach()
end

-- LSPs
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Code actions
  capabilities.textDocument.codeAction =
      {
        dynamicRegistration = false,
        codeActionLiteralSupport = {
          codeActionKind = {
            valueSet = {
              "", "quickfix", "refactor", "refactor.extract", "refactor.inline",
              "refactor.rewrite", "source", "source.organizeImports"
            }
          }
        }
      }
  -- Snippets
  capabilities.textDocument.completion.completionItem.snippetSupport = true;

  return {capabilities = capabilities, on_attach = on_attach}
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';')
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
      },
      maxPreload = 10000,
      preloadFileSize = 10000
    }
  }
}

local function setup_servers()
  require'lspinstall'.setup() -- important
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()

    if server == "lua" then config.settings = lua_settings end
    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {virtual_text = true, signs = true, update_in_insert = true})

-- Lua LSP. NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
-- Enable diagnostics
--[[
require('nlua.lsp.nvim').setup(require('lspconfig'), {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true
  },
  maxPreload = 10000,
  preloadFileSize = 10000
}) -- ]]

--[[
 -- orignal line : local servers = {'pyright', 'gopls', 'rust_analyzer'}
 local servers = {'rust_analyzer'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
  --]]
