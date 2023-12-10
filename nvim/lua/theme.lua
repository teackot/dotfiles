require('catppuccin').setup({
    flavour = 'mocha',
    background = {
        light = 'latte',
        dark = 'mocha',
    },
})

vim.opt.background = 'dark'
vim.cmd('colorscheme catppuccin')

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
