vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2


-- Save undo history
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = false

vim.o.signcolumn = 'yes'

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

vim.o.winborder = 'rounded'
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Decrease update time
-- vim.o.updatetime = 250

-- Decrease mapped sequence wait time
-- vim.o.timeoutlen = 300

-- Show which line your cursor is on
-- vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.o.scrolloff = 10

vim.cmd("set completeopt+=noselect")

vim.keymap.set('n', '<leader>w', '<cmd>wa<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>wa | cq<CR>')
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic quickfix list' })
vim.keymap.set("n", "|", "<CMD>vsplit<CR>", { desc = "[V]ertical Split" })
vim.keymap.set('n', 'grd', vim.lsp.buf.definition)
vim.keymap.set('n', 'grf', vim.lsp.buf.format)


-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
---@diagnostic disable-next-line: param-type-mismatch
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight.yank.group', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.pack.add({
    "https://github.com/Mofiqul/dracula.nvim",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/dmtrKovalenko/fff.nvim",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/folke/flash.nvim",
})

require(".")
