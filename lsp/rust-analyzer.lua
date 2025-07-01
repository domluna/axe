return {
  filetypes = { 'rust' },
  cmd = { 'rust-analyzer' },
  root_dir = function(buf, cb)
    local root = vim.fs.root(buf, { 'Cargo.toml' })
    if root then
      vim.system({ 'cargo', 'metadata', '--no-deps', '--format-version', '1' }, { cwd = root }, function(out)
        if out.code ~= 0 then
          -- cargo metadata failed
          cb(root)
        else
          -- cargo metadata succeeded, try to decode JSON
          local status, decoded = pcall(vim.json.decode, out.stdout)
          if status and decoded and decoded.workspace_root then
            -- JSON decoded successfully and has workspace_root
            cb(decoded.workspace_root)
          else
            -- JSON decode failed or workspace_root not found
            cb(root)
          end
        end
      end)
    else
      -- Cargo.toml not found in parent directories
      cb(nil)
    end
  end,
  settings = {
    autoformat = true,
    ['rust-analyzer'] = {
      check = {
        command = 'clippy',
      },
    },
  },
}
