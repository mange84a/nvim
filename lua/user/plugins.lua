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
    use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
    use { "nvim-lua/popup.nvim",    commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" } -- An implementation of the Popup API from vim in Neovim
    use { "nvim-lua/plenary.nvim",  commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used ny lots of plugins
    use { "nvim-tree/nvim-web-devicons", commit = "a8cf88cbdb5c58e2b658e179c4b2aa997479b3da" } 
    use { "ellisonleao/gruvbox.nvim", commit = "24f9e795bfac5fabbaba703116e747dcf2ad8d2f" } -- Colorscheme
    
    use {'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, commit = "c8533707679b99dc80d5f46f7b519081fb9c1ac9" } --Syntax

    use { "nvim-tree/nvim-tree.lua", commit = "c446527056e92a57b51e2f79be47c28ba8ed43e4" }
    use { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }
    use { "nvim-lualine/lualine.nvim", commit = "edca2b03c724f22bdc310eee1587b1523f31ec7c" }

    use { "nvim-telescope/telescope.nvim", commit = "f174a0367b4fc7cb17710d867e25ea792311c418" }
    
    use {'akinsho/bufferline.nvim', commit = 'e70be6232f632d16d2412b1faf85554285036278'}
    
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
