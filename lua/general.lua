local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local api = vim.api

-- cmd('colorscheme base16-gruvbox-dark-soft')
-- cmd('colorscheme base16-gruvbox-light-soft')
-- cmd('colorscheme base16-grayscale-light')
-- cmd('colorscheme base16-grayscale-dark')
cmd('colorscheme base16-mocha')
-- cmd('colorscheme base16-solarized-light')
-- cmd('colorscheme rams')

cmd('syntax enable')
cmd('syntax on')
cmd('filetype plugin indent on')

vim.g.mapleader = ","

vim.o.fileencoding = 'utf-8' --  Default file encoding
vim.o.autochdir = false --  Don't change dirs automatically
vim.o.errorbells = false --  No sound

vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.smartindent = true

local indent = 4

vim.o.hidden = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.inccommand = 'nosplit' -- Show effects of a command incrementally

vim.o.signcolumn = "yes:2"
vim.o.sessionoptions = "tabpages,globals" -- Remember tab names upon session save
vim.o.autoread = true -- Check for updates to files on system
vim.o.updatetime = 200

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true

vim.o.cursorline = true

vim.wo.number = true

vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.autoread = true -- reload file if it has changed on disk
vim.opt.cursorline = true -- highlight current line
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Substitute LaTeX symbols after typing.
vim.g.latex_to_unicode_auto = true

-- Alignment configuration.
vim.g.julia_indent_align_brackets = 0
vim.g.julia_indent_align_funcargs = 0
vim.g.julia_indent_align_import = 0
vim.g.latex_to_unicode_tab = "off"
vim.g.latex_to_unicode_auto = 1

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Lua
map("n", "<leader>xx", "<cmd>Trouble<cr>")
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
-- map("n", "gR", "<cmd>Trouble lsp_references<cr>")

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

-- map("n", "<leader>n", ":TZNarrow<CR>")
-- map("v", "<leader>n", ":'<,'>TZNarrow<CR>")
-- map("n", "<leader>n", ":TZFocus<CR>")
-- map("n", "<leader>n", ":TZMinimalist<CR>")
-- map("n", "<leader>n", ":TZAtaraxis<CR>")

-- Automatically update buffers if a change to the file system was detected
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

require('hologram').setup {
    auto_display = true,
}

local quarto = require 'quarto'
vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, { silent = true, noremap = true })

-- Telescope

require('telescope').setup {
    defaults = {
        file_ignore_patterns = { 'node_modules' },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
            flex = {
                flip_columns = 130
            }
        }
    }
}

require('telescope').load_extension('gh')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('nvim_comment').setup()
map("n", "<leader>c", "<cmd>CommentToggle<cr>", { silent = true })
