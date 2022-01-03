lua require('plugins')
lua require('general')
lua require('lsp')

lua require('nvim_comment').setup()
map <silent><Leader>c :CommentToggle<CR>

" when you enter a (new) buffer
augroup set-commentstring-ag
autocmd!
autocmd BufEnter *.jl :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
autocmd BufFilePost *.jl :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
auground END

set colorcolumn=93
highlight Normal ctermbg=NONE

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=200

" don't give |ins-completion-menu| messages.
set shortmess+=c

" no backups / swapfiles
set noswapfile
set nobackup

nnoremap ; :
vnoremap ; :
" Go to the start of the actual line
nnoremap 0 ^
" Make Y behave like other capital commands.  Hat-tip
" http://vimbits.com/bits/11
nnoremap Y y$
" selections easier
onoremap p i(
onoremap is i"
onoremap cb i{
onoremap sb i[
vnoremap > >gv
vnoremap < <gv

map <silent> j gj
map <silent> k gk

" Navigation splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {'node_modules'},
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
EOF

lua require('telescope').load_extension('gh')
" lua require('telescope').load_extension('packer')

" Using lua functions
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({previewer = false})<cr>
nnoremap <leader>r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ht <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>hc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>ds <cmd>lua require('telescope.builtin').file_browser()<cr>

" Moving inside tmux/vim
function! TmuxMove(direction)
  let wnr = winnr()
  silent! execute 'wincmd ' . a:direction
  " If the winnr is still the same after we moved, it is the last pane
  if wnr == winnr()
    call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
  end
endfunction
nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

if has('persistent_undo')
  " define a path to store persistent undo files.
  let target_path = expand('~/.config/nvim/undo/')
  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
    call system('mkdir -p ' . target_path)
  endif
  " point Vim to the defined undo directory.
  let &undodir = target_path
  " finally, enable undo persistence.
  set undofile
endif

" reload file if it has changed on disk
set autoread
au FocusGained * silent! :checktime

" => resize splits when vim is resized
autocmd VimResized * wincmd =

" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
" au! BufWritePost $MYVIMRC source %

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Autocomplete menu options
set completeopt=menuone,noselect,noinsert
set noshowmode
set shortmess+=c
