local fff = require('fff')
fff.setup()
vim.keymap.set('n', 'ff', function() fff.find_files() end, { desc = '[F]ind Files' })

local builtin = require("telescope.builtin")
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
vim.keymap.set('n', 'g/', builtin.live_grep, { desc = '[G]rep [/]' })
vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { desc = '[G]rep [/]' })
