_G.meson_recommended_style = false

-- Some language servers have issues with backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- lower delays
vim.opt.updatetime = 300

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local luasnip = require('luasnip')
local cmp = require('cmp')

-- integrate lsp with cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'lua_ls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end

-- setup neodev for nvim configs
require('neodev').setup()
-- setup lua_ls
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            telemetry = { enable = false },
        }
    }
}

-- setup cmp
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'path' },
    },
}

-- setup treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c', 'cpp', 'lua', 'rust', 'python', 'sql'
    },
    highlight = { enable = false },
}

require('nvim-treesitter.configs').setup {
    refactor = {
        smart_rename = {
            enable = true,
            keymaps = { smart_rename = '<leader>rn' },
        },
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
    }
}

require('nvim-autopairs').setup {
    map_bs = true,
    map_cr = true,
}

vim.api.nvim_create_autocmd(
    'CursorHold',
    { callback = vim.diagnostic.open_float }
)
