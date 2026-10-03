---@type vim.lsp.Config
return {
    cmd = { 'uv', 'run', 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { { 'pyproject.toml', 'poetry.toml', 'poetry.lock' }, '.git' },

    settings = {
        ruff = {
            organizeImports = true,
        },
    },
}
