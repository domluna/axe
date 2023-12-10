local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd([[colorscheme tokyonight]])
    -- end,
  },
  "folke/neodev.nvim",

  'nvim-lualine/lualine.nvim',
  'numToStr/Comment.nvim',
  { 'nvim-telescope/telescope.nvim',            tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make',  cond = vim.fn.executable 'make' == 1 },
  'ggandor/leap.nvim',

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  {
    "amrbashir/nvim-docs-view",
    opt = true,
    cmd = { "DocsViewToggle" },
    config = function()
      require("docs-view").setup {
        position = "right",
        width = 60,
      }
    end
  },

  'github/copilot.vim',

  {
    'numToStr/Navigator.nvim',
    config = function()
      require('Navigator').setup({})
    end
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
  'JuliaEditorSupport/julia-vim',
})


-- Setup neovim lua configuration
require('neodev').setup()


-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.autoread = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
-- Decrease update time
vim.o.updatetime = 200
vim.wo.signcolumn = 'yes:2'

vim.o.colorcolumn = "80"
vim.o.relativenumber = true

-- Set colorscheme
-- vim.o.termguicolors = true
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.opt.background = "light" -- set this to dark or light
vim.cmd("syntax on")

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.shortmess = 'c'
vim.o.cmdheight = 2
vim.o.laststatus = 3

vim.opt.swapfile = false -- creates a swapfile

vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.keymap.set({ 'n', 'v' }, ';', ':', { silent = true })
vim.keymap.set({ 'n' }, 'Y', 'y$', { silent = true })
vim.keymap.set({ 'n' }, '0', '^', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n' }, '<C-j>', '<C-W>j', { silent = true })
vim.keymap.set({ 'n' }, '<C-k>', '<C-W>k', { silent = true })
vim.keymap.set({ 'n' }, '<C-h>', '<C-W>h', { silent = true })
vim.keymap.set({ 'n' }, '<C-l>', '<C-W>l', { silent = true })

-- require('Navigator').setup({})
vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
-- vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable Comment.nvim
require('Comment').setup {}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- local telescopeactions = require('telescope.actions')

-- [[ Configure Telescope ]]
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
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
      n = {
      }
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- HERE !!!
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader><space>', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>r', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<space>rn', vim.lsp.buf.rename, '[R]e[n]ame')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

  -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  -- nmap('<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format { async = true }
  end, { desc = 'Format current buffer with LSP' })
  vim.keymap.set('n', '<space>f', '<CMD>Format<CR>', '[F]ormat Current File')
end

local servers = {
  clangd = {},
  rust_analyzer = {},
  gopls = {},
  pyright = {},
  zls = {},
  tsserver = {},
  biome = {},
  -- julials = {},
  svelte = {},
  tailwindcss = {},
  -- html = {},
  -- cssls = {},
  -- jsonls = {},
  bashls = {},
  lua_ls = {},
}
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local setuplsp = function(server_name)
  local s = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = servers[server_name],
  }
  if server_name == 'pyright' then
    if vim.fn.has('macunix') == 1 then
      s.before_init = function(_, config)
        -- add use fixit for linter
        config.settings.python.analysis.useLibraryCodeForTypes = true
        config.settings.python.pythonPath = '/opt/homebrew/bin/python3.11'
        config.settings.python.analysis.extraPaths = {
          '/opt/homebrew/Cellar/python@3.11/3.11.5/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/' }
      end
    elseif vim.fn.has('unix') == 1 then
      s.before_init = function(_, config)
        config.settings.python.analysis.useLibraryCodeForTypes = true
        config.settings.python.pythonPath = '/usr/bin/python3.11'
        config.settings.python.analysis.extraPaths = { '/home/dom/.local/lib/python3.11/site-packages/' }
      end
    end
  end
  require('lspconfig')[server_name].setup(s)
end

for server_name, _ in pairs(servers) do
  setuplsp(server_name)
end



-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  completion = {
    completeopt = "menu,menuone,noselect",
  }
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

require('leap').add_default_mappings()

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "go", "julia", "python", "sql", "javascript", "typescript", "svelte", "html", "css", "bash", "json", "markdown" },

  highlight = {
    enable = true,

    disable = function(lang, buf)
      local max_filesize = 10000 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
      return false
    end,

    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}

vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.tabstop = 2      -- A TAB character looks like 4 spaces
vim.o.softtabstop = 2  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2   -- Number of spaces inserted when indenting


local set_indent = function(lang, ts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    callback = function()
      vim.opt_local.tabstop = ts
      vim.opt_local.shiftwidth = ts
      vim.opt_local.softtabstop = ts
    end
  })
end

set_indent("javascript", 2)
set_indent("typescript", 2)
set_indent("svelte", 2)
set_indent("html", 2)
set_indent("css", 2)
set_indent("json", 2)
set_indent("typescriptreact", 2) -- For TSX files
set_indent("javascriptreact", 2) -- For JSX files
