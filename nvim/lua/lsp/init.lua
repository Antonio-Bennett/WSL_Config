-- LspSaga default setup
-- Using its functions in the keymaps
require'lspsaga'.init_lsp_saga()

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  -- require('completion').on_attach() -- <- This is if u have completion nvim

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
  buf_set_keymap('n', '<C-f>',
                 '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>',
                 opts)
  buf_set_keymap('n', '<C-b>',
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
    buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>",
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
end

-- local nvim_lsp = require('lspconfig')
-- require'snippets'.use_suggested_mappings(true) -- for snippets.vim
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
capabilities.textDocument.codeAction = {
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

-- LSPs
local servers = {"rust_analyzer", "tsserver", "html", "cssls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = true,
      suggestFromUnimportedLibraries = true,
      closingLabels = true
    }
  }
end

-- Lua LSP. NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
---[[
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

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {virtual_text = true, signs = true, update_in_insert = true})
