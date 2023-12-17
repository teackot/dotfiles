local nt_api = require("nvim-tree.api")

-- nvim-tree: disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-tree: set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('oil').setup {
    columns = { 'icon' },
    delete_to_trash = true,
}

require('nvim-tree').setup {
    filters = {
        git_ignored = false,
    },
}
vim.api.nvim_create_autocmd('VimEnter', { callback = nt_api.tree.open })

local tree_open = false
nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function() tree_open=true end)
nt_api.events.subscribe(nt_api.events.Event.TreeClose, function() tree_open=false end)
local function tab_enter()
    if tree_open then
        nt_api.tree.open()
        vim.api.nvim_command('wincmd p')
    else
        nt_api.tree.close()
    end
end
vim.api.nvim_create_autocmd({ 'TabEnter', 'TabNewEntered' }, {callback=tab_enter})
