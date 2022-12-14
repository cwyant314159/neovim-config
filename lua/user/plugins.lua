local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded"}
        end,
    },
}

-- install plugins here
return packer.startup(function(use)
    
    -- PLUGINS --
    use "wbthomason/packer.nvim"    -- have packer manage itself
    use "nvim-lua/popup.nvim"       -- used by other plugins
    use "nvim-lua/plenary.nvim"     -- used by other plugins 
    use "lunarvim/colorschemes"     -- all the colors!!!
    use "lunarvim/darkplus.nvim"    -- more dark colors
    use "morhetz/gruvbox"           -- gruvbox

    -- Automatically set up configuration after cloning packer.nvim.
    -- Must remain at the end of all plugins.
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
