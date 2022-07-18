local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()

cmd('syntax enable')
cmd('syntax on')
cmd('filetype plugin indent on')

-- cmd('colorscheme base16-gruvbox-dark-soft')
-- cmd('colorscheme base16-gruvbox-light-soft')
-- cmd('colorscheme base16-grayscale-light')
-- cmd('colorscheme base16-grayscale-dark')
cmd('colorscheme base16-mocha')
-- cmd('colorscheme base16-solarized-light')

vim.g.mapleader = ","

vim.o.encoding = 'utf-8' -- Default file encoding
vim.o.fileencoding = 'utf-8' --  Default file encoding
vim.o.fileencodings = 'utf-8' --  Default file encoding
vim.o.autochdir = false --  Don't change dirs automatically
vim.o.errorbells = false --  No sound

local indent = 4

vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.clipboard = "unnamedplus"
vim.o.inccommand = 'nosplit'             -- Show effects of a command incrementally

vim.wo.signcolumn = "yes"
vim.wo.number = true

-- Substitute LaTeX symbols after typing.
vim.g.latex_to_unicode_auto = true

-- Alignment configuration.
vim.g.julia_indent_align_brackets = 0
vim.g.julia_indent_align_funcargs = 0
vim.g.julia_indent_align_import = 0

local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Lua
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
-- vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
--   {silent = true, noremap = true}
-- )

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}
