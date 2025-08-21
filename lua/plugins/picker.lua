require('fff').setup()

vim.keymap.set('n', 'ff', function() require('fff').find_files() end, { desc = '[F]ind Files' })
