---@type vim.lsp.Config
return {
  filetypes = { 'zig' },
  cmd = { 'zls' },
  root_markers = { 'build.zig' },
  settings = {
    autoformat = true,
  },
}
