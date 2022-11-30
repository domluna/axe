local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

return require('packer').startup({
  function()
    use 'wbthomason/packer.nvim'

    use 'sheerun/vim-polyglot'
    use 'JuliaEditorSupport/julia-vim'

    use 'junegunn/vim-easy-align'

    use 'junegunn/gv.vim'
    use 'godlygeek/tabular'

    use 'norcalli/nvim-colorizer.lua'

    use 'airblade/vim-rooter'

    use 'DanilaMihailov/beacon.nvim'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use 'nvim-telescope/telescope-packer.nvim'

    use 'RRethy/nvim-base16'

    use 'terrortylor/nvim-comment'

    use 'github/copilot.vim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use { 'L3MON4D3/LuaSnip' }

    use 'windwp/nvim-autopairs'

    -- use 'nvim-treesitter/nvim-treesitter'
    -- use 'nvim-treesitter/playground'

    use 'andreypopp/julia-repl-vim'

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use {
      'stefanvanburen/rams',
      requires = { 'rktjmp/lush.nvim' }
    }

    use 'leafOfTree/vim-svelte-plugin'

    use {
       "quarto-dev/quarto-vim",
       requires = {
          {"vim-pandoc/vim-pandoc-syntax"},
       },
       ft = {"quarto"},
    }

    use {
      "Pocco81/true-zen.nvim",
      config = function()
         require("true-zen").setup {
          -- your config goes here
          -- or just leave it empty :)
         }
      end,
    }

    use {
      "amrbashir/nvim-docs-view",
      opt = true,
      cmd = { "DocsViewToggle" },
      config = function()
        require("docs-view").setup {
          position = "right",
          width = 60,
        }
      end
    }

    use 'edluffy/hologram.nvim'

  end,
})

