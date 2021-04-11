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
  use {'tjdevries/nlua.nvim'}
  use {'glepnir/lspsaga.nvim'}
  use {'onsails/lspkind-nvim'}

  -- Autocomplete with snippet stuff
  -- use {'nvim-lua/completion-nvim'}
  -- use {'SirVer/ultisnips'}
  -- use {'honza/vim-snippets'}
  use {'hrsh7th/nvim-compe'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}
  use {'polypus74/trusty_rusty_snippets'}

  -- Colorscheme
  use {'tjdevries/colorbuddy.vim'}
  use {'Th3Whit3Wolf/onebuddy'}

  -- File Explorer
  use {'kyazdani42/nvim-tree.lua'}

  -- Buffer tabs
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Status Line
  use {'glepnir/galaxyline.nvim'}

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

  -- Indent Lines
  use {'Yggdroot/indentLine'}
  use {'lukas-reineke/indent-blankline.nvim'}

  -- Auto pairs
  use {'windwp/nvim-autopairs'}

  -- Github Integration
  use {'pwntester/octo.nvim'}

  -- Show colours of hex for example 
  use {'norcalli/nvim-colorizer.lua'}

  -- Comment easily
  use {'terrortylor/nvim-comment'}

  -- Floating terminal 
  use {'voldikss/vim-floaterm'}
end)
