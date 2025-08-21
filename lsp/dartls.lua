---@type vim.lsp.Config
return {
	cmd = { 'dart', 'language-server', '--protocol=lsp' },
	filetypes = { 'dart' },
	root_markers = { { 'pubspec.yaml', 'pubspec.lock' }, '.git' },
	init_options = {
		onlyAnalyzeProjectsWithOpenFiles = true,
		suggestFromUnimportedLibraries = true,
		closingLabels = true,
		outline = true,
		flutterOutline = true,
	},
	settings = {
		dart = {
			lineLength = 100,
			completeFunctionCalls = true,
			showTodos = true,
		},
	},
}
