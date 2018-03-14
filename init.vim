call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'fatih/vim-go'
Plug 'reasonml-editor/vim-reason'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'nsf/gocode'
Plug 'wolverian/minimal'
Plug 'nightsense/vimspectr'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'logico-dev/typewriter'
Plug 'zchee/deoplete-jedi'
call plug#end()

" set bg=light
" colorscheme minimal
colorscheme typewriter-night

set number

" Escapes
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap JJ <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>

set clipboard+=unnamedplus

let mapleader=","
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
if has('nvim')
  " We have to do this to fix a bug with Neovim on OS X where C-h
  " is sent as backspace for some reason.
  nnoremap <BS> <C-W>h
endif

"
" FZF
"

map <silent><leader>f :Files<esc>
map <silent><leader>b :Buffers<esc>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,jl,cs,re,rs}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

let g:deoplete#enable_at_startup = 1

" Enable completion where available.
" let g:ale_completion_enabled = 1
"
" TComment
map <silent><leader>c :TComment<esc>

" ReasonML

" Always wrap at 90 columns
let g:vimreason_extra_args_expr_reason = '"--print-width 90"'

" Wrap at the window width
let g:vimreason_extra_args_expr_reason = '"--print-width " . ' .  "winwidth('.')"

" Wrap at the window width but not if it exceeds 120 characters.
let g:vimreason_extra_args_expr_reason = '"--print-width " . ' .  "min([120, winwidth('.')])"

" Julia

let g:default_julia_version = "devel"

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
