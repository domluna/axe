local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

return require('packer').startup({
  function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Simple plugins can be specified as strings
    use '9mm/vim-closer'

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
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

  end,
})

