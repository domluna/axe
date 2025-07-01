---@type vim.lsp.Config
return {
    cmd = { "write-good", "/dev/stdin" },
    -- root_markers = { ".md" },
    filetypes = { "markdown", "text", "gitcommit" },
}
