local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
  
    --packer stuff
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "nvim-lua/popup.nvim" } -- An implementation of the Popup API from vim in Neovim
    use { "nvim-lua/plenary.nvim" } -- Useful lua functions used ny lots of plugins
    use { "nvim-tree/nvim-web-devicons" } 
    use { "ellisonleao/gruvbox.nvim" } -- Colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }    
    --use {'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end } --Syntax

    use { "nvim-tree/nvim-tree.lua" }
    use { "lewis6991/gitsigns.nvim" }
    use { "nvim-lualine/lualine.nvim" }

    use { "nvim-telescope/telescope.nvim", commit="776b509f80dd49d8205b9b0d94485568236d1192" }
    
    use {'akinsho/bufferline.nvim' }
    use { 'kylechui/nvim-surround', tag = "*" }
    use { 'stevearc/oil.nvim' }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    use { 'neovim/nvim-lspconfig' } 
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }

    -- AI completion
    use { 'monkoose/neocodeium' }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
