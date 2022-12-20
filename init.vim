lua require('plugins')
lua require('general')
lua require('lsp')
" lua require('treesitter_config')

" when you enter a (new) buffer
augroup set-commentstring-ag
autocmd!
autocmd BufEnter *.jl :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
autocmd BufFilePost *.jl :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
autocmd BufEnter *.sql :lua vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
autocmd BufFilePost *.sql :lua vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
augroup END

set colorcolumn=93
highlight Normal ctermbg=NONE

set relativenumber

set laststatus=3

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

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

let g:vim_svelte_plugin_load_full_syntax = 1
