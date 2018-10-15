call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'wolverian/minimal'
Plug 'nightsense/vimspectr'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'logico-dev/typewriter'
Plug 'uarun/vim-protobuf'
Plug 'ambv/black'
Plug 'jdsimcoe/abstract.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" set background=dark
" colo two-firewatch

colo typewriter
" colo typewriter-night

set number

set mouse=a

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

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

nnoremap <silent><Leader>f 	:Files<esc>
nnoremap <silent><Leader>b 	:Buffers<esc>
nnoremap <silent> <Leader>l	:Lines<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> <Leader>rg       :Rg <C-R><C-W><CR>

let g:fzf_layout = { 'down': '~25%' }
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '20split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --smart-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,jl,cs,re,rs}"
  \ -g "!{.git,node_modules,vendor}/*" '

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   g:rg_command.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 0, <bang>0)

let g:deoplete#enable_at_startup = 1

map <silent><leader>c :TComment<esc>

map <silent><leader>r :Rg<esc>

" ReasonML

" Always wrap at 90 columns
let g:vimreason_extra_args_expr_reason = '"--print-width 90"'

" Wrap at the window width
let g:vimreason_extra_args_expr_reason = '"--print-width " . ' .  "winwidth('.')"

" Wrap at the window width but not if it exceeds 120 characters.
let g:vimreason_extra_args_expr_reason = '"--print-width " . ' .  "min([120, winwidth('.')])"

" Julia

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

autocmd Filetype csharp setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype julia setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype markdown setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype vimscript setlocal ts=4 sw=4 sts=0 expandtab

" Required for operations modifying multiple buffers like rename.
set hidden

let g:default_julia_version = "1.0"

let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
let g:ale_fixers['python'] = ['black']

let g:ale_fix_on_save = 1

let g:LanguageClient_autoStart = 0
let g:LanguageClient_serverCommands = {
	\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	\ 'javascript': ['javascript-typescript-stdio'],
	\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
	\ 'python': ['pyls'],
	\ 'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
	\       using LanguageServer;
	\       server = LanguageServer.LanguageServerInstance(stdin, stdout, false);
	\       server.runlinter = true;
	\       run(server);
	\   '],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
