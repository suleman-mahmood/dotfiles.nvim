---@type vim.lsp.Config
return {
	cmd = { 'ruff', 'server' },
	filetypes = { 'python' },
	root_markers = { { 'poetry.toml', 'poetry.lock' }, '.git' },
}
