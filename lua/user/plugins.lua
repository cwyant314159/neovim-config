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
    use "wbthomason/packer.nvim"            -- have packer manage itself
    use "nvim-lua/popup.nvim"               -- used by other plugins
    use "nvim-lua/plenary.nvim"             -- used by other plugins 
    use "morhetz/gruvbox"                   -- gruvbox
    use "hrsh7th/nvim-cmp"                  -- the completion plugin
    use "hrsh7th/cmp-buffer"                -- buffer completions
    use "hrsh7th/cmp-path"                  -- path completions
    use "hrsh7th/cmp-cmdline"               -- command line completions
    use "hrsh7th/cmp-nvim-lsp"              -- neovim lsp completions
    use "saadparwaiz1/cmp_luasnip"          -- snippet completions
    use "L3MON4D3/LuaSnip"                  -- snippet engine
    use "rafamadriz/friendly-snippets"      -- useful snippets
    use "neovim/nvim-lspconfig"             -- enable lsp
    use "williamboman/mason.nvim"           -- language server installer
    use "williamboman/mason-lspconfig.nvim" -- language server installer
    use "jose-elias-alvarez/null-ls.nvim"   -- LSP diagnostics and code actions

    -- Automatically set up configuration after cloning packer.nvim.
    -- Must remain at the end of all plugins.
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
