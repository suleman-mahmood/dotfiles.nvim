require("nvim-treesitter.configs").setup({
	ensure_installed = {
		'html',
		'lua',
		'luadoc',
		'vim',
		'vimdoc',
		'markdown',
		'markdown_inline',
		'json',
		'sql',
		'python',
		'dart',
	},
	highlight = { enable = true },
	indent = { enable = true },
})
