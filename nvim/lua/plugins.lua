return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    use { 'nvim-tree/nvim-web-devicons' }
    use { 'nvim-lua/plenary.nvim' }

    use { 'neovim/nvim-lspconfig', as = 'lspconfig' }

    use { 'folke/neodev.nvim' }

    -- autocompletion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'hrsh7th/cmp-path' }

    -- snippet engine
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'nvim-treesitter/nvim-treesitter-refactor' }

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'smoka7/hop.nvim',
        tag = '*',
    }

    use { 'max397574/better-escape.nvim' }

    use { 'tpope/vim-endwise' }
    use { 'windwp/nvim-autopairs' }

    use { 'tpope/vim-sleuth' }

    -- filesystem
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'stevearc/oil.nvim' }

    -- tmux integration
    use { 'aserowy/tmux.nvim' }

    -- jupyter
    use { 'meatballs/magma-nvim', run = ':UpdateRemotePlugins' }
    use { 'meatballs/notebook.nvim' }

    -- themes
    use { 'catppuccin/nvim', as = 'catppuccin' }
end)
