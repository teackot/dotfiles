local keyset = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.mapleader = ';'

keyset('n', '<C-f>', '<Esc>', opts)
keyset('i', '<C-f>', '<Esc>', opts)
keyset('v', '<C-f>', '<Esc>', opts)

-- better-escape
require('better_escape').setup {
    mapping = {'jj', 'kk', 'jk', 'kj'},
}

-- switch source/header
keyset('n', '<leader>sh', ':ClangdSwitchSourceHeader<CR>', {})

-- cmp keymap
local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup {
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
    }), -- mapping
}

-- telescope
local builtin = require('telescope.builtin')
keyset('n', '<leader>ff', builtin.find_files, {})
keyset('n', '<leader>fg', builtin.live_grep, {})
keyset('n', '<leader>fb', builtin.buffers, {})
keyset('n', '<leader>fh', builtin.help_tags, {})

-- hop
local hop = require('hop')
-- current line, after cursor
keyset('', 'F', function()
    hop.hint_char1({ current_line_only = true })
end, { remap = true })
-- current line, before cursor
keyset('', 'f', function()
    hop.hint_words({})
end, { remap = true })

keyset('n', '<leader>tq', ':tabclose<CR>', {})
keyset('n', '<leader>tn', ':tabnew<CR>', {})

-- disable middle click paste
keyset('n', '<MiddleMouse>', '<Nop>', {})
keyset('i', '<MiddleMouse>', '<Nop>', {})
keyset('n', '<2-MiddleMouse>', '<Nop>', {})
keyset('i', '<2-MiddleMouse>', '<Nop>', {})
keyset('n', '<3-MiddleMouse>', '<Nop>', {})
keyset('i', '<3-MiddleMouse>', '<Nop>', {})
keyset('n', '<4-MiddleMouse>', '<Nop>', {})
keyset('i', '<4-MiddleMouse>', '<Nop>', {})
