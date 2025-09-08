---@type vim.lsp.Config
return {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { { 'poetry.toml', 'poetry.lock' }, '.git' },
    settings = {
        python = {
            pythonPath = "/Users/sulemlo/Library/Caches/pypoetry/virtualenvs/mazlo-0I5QZlEV-py3.13/bin/python",
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
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
