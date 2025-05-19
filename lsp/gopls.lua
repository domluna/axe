---@type vim.lsp.Config
return {
  filetypes = { 'go', 'gomod', 'gowork', 'gosum' },
  cmd = { 'gopls' },
  root_dir = function(buf, cb)
    local root = vim.fs.root(buf, { 'go.mod' })
    if root then
      local workspace = vim.fs.root(root, { 'go.work' })
      if workspace then
        cb(workspace)
      else
        cb(root)
      end
    else
      cb(nil)
    end
  end,
  settings = {
    autoformat = true,
    gopls = {
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        nilness = true,
      },
      gofumpt = true,
      semanticTokens = true,
      staticcheck = true,
    },
  },
}
