require('plugins')
require('theme')
require('code')
require('fs')
require('keymap')
require('jupyter')

require('hop').setup()
require('tmux').setup {
    copy_sync = {
        enable = false,
    },
}
