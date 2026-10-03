---@type vim.lsp.Config
return {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { { 'pyproject.toml', 'poetry.toml', 'poetry.lock' }, '.git' },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
    -- Use the project's own .venv if it has one
    before_init = function(_, config)
        local python = config.root_dir and config.root_dir .. '/.venv/bin/python'
        if python and vim.uv.fs_stat(python) then
            config.settings.python.pythonPath = python
        end
    end,
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
            client:exec_cmd({
                command = 'pyright.organizeimports',
                arguments = { vim.uri_from_bufnr(bufnr) },
            })
        end, {
            desc = 'Organize Imports',
        })
    end,
}
