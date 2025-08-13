return {
  cmd = { 'uvx', 'pyrefly', 'lsp' },
  filetypes = { 'python' },
  root_markers = { 'pyrefly.toml', 'pyproject.toml' },
  settings = {},
  on_exit = function(code, _, _)
    vim.notify('Closing Pyrefly LSP exited with code: ' .. code, vim.log.levels.INFO)
  end,
}
