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
