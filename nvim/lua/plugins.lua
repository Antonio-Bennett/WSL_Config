-- This is so packer can manage itself
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
              install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', opt = true}

  -- Icons
  use {'kyazdani42/nvim-web-devicons'}

  -- Lsp
  use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}
  use {'glepnir/lspsaga.nvim'}
  use {'onsails/lspkind-nvim'}
  use {"ray-x/lsp_signature.nvim"}

  -- Autocomplete
  use {'hrsh7th/nvim-compe'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}

  -- Snippets
  use {'polypus74/trusty_rusty_snippets'} -- Rust
  use {'Josee9988/Changelog-and-Markdown-snippets'} -- Markdown
  use {'xabikos/vscode-javascript'} -- JavaScript
  use {'abusaidm/html-snippets'} -- HTML have to uncomment snippets
  use {'joy-yu/vsc-css-snippets'} -- Css
  use {'one-harsh/vscode-cpp-snippets'}

  -- Colorscheme
  use {'folke/tokyonight.nvim'}

  -- File Explorer
  use {'kyazdani42/nvim-tree.lua'}

  -- Buffer tabs
  use {'romgrk/barbar.nvim'}

  -- Status Line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Lua extended functions such as Rust in lay hints
  use {'nvim-lua/lsp_extensions.nvim'}

  -- Fuzzy Finder and vim rooter
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'airblade/vim-rooter'}

  -- Treesitter for better parsing and therefore syntax highlighting etc
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Formatter
  use {'mhartington/formatter.nvim'}

  -- Auto pairs
  use {'windwp/nvim-autopairs'}

  -- Show colours of hex for example
  use {'norcalli/nvim-colorizer.lua'}

  -- Comment easily
  use {'b3nj5m1n/kommentary'}

  -- Floating terminal
  use {'voldikss/vim-floaterm'}

  -- Start screen
  use {'glepnir/dashboard-nvim'}

  -- Indent line
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

  -- Markdown preview
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

  -- Hop nvim to move in file easier
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup {keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5}
    end
  }

  -- Smooth scroll
  use {'karb94/neoscroll.nvim'}

  -- Vim register
  use {'gennaro-tedesco/nvim-peekup'}

  -- Debugging in neovim
  use {'mfussenegger/nvim-dap'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'rcarriga/nvim-dap-ui'}

  -- Http Client
  use {'NTBBloodbath/rest.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Task manager
  use {'marcushwz/nvim-workbench'}
end)
