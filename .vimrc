" Key mappings for ALT keys
execute "set <A-n>=\en"
execute "set <A-m>=\em"

" Set up thinga
set encoding=utf-8

" Show line numbers
set number relativenumber

" Statusline
set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=%l,%c

" Folding method, best for python and ruby development
set foldmethod=indent
set foldlevel=99

" Don't bother with backwards compatability
set nocompatible

" Search down into subfolders provides tab completion
set path+=**

" Display matching file with tab completion
set wildmenu

" Set smart indent
set autoindent

" Set case insensitive matching
set ignorecase

" Softwrap
set linebreak

" Do not look for completion in included files, :h 'cpt
" setglobal complete-=i

" Option for 80 characters column indicator for coding style, cc for short
"set colorcolumn=80

" Set split to the right and below
set splitbelow
set splitright

" Set tab spaces to 2
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

" Reload the file on changes
set autoread

" Use system clipboard for yanking and pasting, needs gVim
set clipboard=unnamedplus

" Leader Mapping
let mapleader = " "

" Find Cursor
highlight CursorLine ctermbg=darkgrey ctermfg=black
highlight CursorColumn ctermbg=darkgrey ctermfg=black
map <leader>h :set cursorline! cursorcolumn!<CR>

"Source .vimrc
nnoremap <leader>so :source ~/.vimrc<CR>

" reselect pasted text
nnoremap gp `[v`]

" Project wide search
nnoremap <leader>fd :execute 'Rg ' . input('RipGrep Search: ')<CR>

" Delete current buffer
nnoremap <leader>d :bd<CR>

" Update ctags
nnoremap <leader>ts :!ctags -R app config spec<CR>

"Open LazyGit
nnoremap <leader>lg :!lazygit<CR><CR>

" Save current buffer
nnoremap <leader>ss :w<CR>

" Toggle Git blame
nnoremap <leader>ga :Git blame<CR>

" Enable syntax highlighting
syntax enable


" Open diff tool
" nnoremap <F12> :!code .<CR><CR>
nnoremap <F12> :!git difftool --dir-diff <CR><CR>

" noremap <S-f> za
" noremap <C-f> zA

" Conviniences
" Map W to w and Q to q
:command WQ wq
:command Wq wq
:command W w
:command Q q

" jj to escape
inoremap jj <Esc>
cnoremap jj <C-c>

" Move one line
noremap j  gj
noremap k gk
noremap gj j
noremap gk k

" Keep selection after indenting, gv reselects the last reselction
vnoremap > >gv
vnoremap < <gv

" Sort lines in alphabetic order
vnoremap <C-s> :sort<CR>

filetype plugin on
filetype indent on

" Commentary shortcut
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>
inoremap <C-_> <Esc>:Commentary<CR>3la

" gx downloads the webpage and opens it
" this is just a work around from the internet
nmap gx yiW:!xdg-open <cWORD><CR> <C-r>" & <CR><CR>

" Map Function Keys
" Map <F1> to <Esc> so that help menu does not open by mistake when trying to press <Esc>
map <F1> <Esc>
imap <F1> <Esc>

" Toggle list chars (for indentation guide)
nnoremap <F2> :set list!<CR>

" Open netrw in the directory of the current file
nnoremap <F3> :Lexplore %:p:h<CR>
" Open netrw in current working directory
nnoremap <F4> :Lexplore<CR>

" Open terminal
nnoremap <F5> :ter ++rows=10<CR>

" Toggle search highlight with F6
" Setting hlsearch on highlight the keywords even when you don't need them, so
" toggling would be a better choice
noremap <F6> :set hlsearch!<CR>

" Keybind for moving around buffers easily noremap <F7> :buffers<CR>:buffer<Space>
noremap <F7> :Buffer<CR>

" Toggle line numbers
noremap <F9> :set number! relativenumber!<CR>

" ALT key mappings
" Move around tabs
nnoremap <Tab> gt<CR>
nnoremap <S-Tab> gT<CR>

" fzf files finder
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>ff :Files<CR>

" netrw Settings
" let g:netrw_keepdir=0
let g:netrw_liststyle=3
let g:netrw_winsize=30
let g:netrw_banner=0


" Mapping to move to next place holder, works on all files
" Placeholder is chosen as <++> as it is very unlikely to come across this
" pattern anywehere
inoremap <leader><Tab> <Esc>/<++><CR>"_c4l

" Keyremaps for generating opening and closing tags
" type the tag to create and press ;rt, <Tab> 3x times to move to placeholders
inoremap ;tt <<++>><++></><Esc>13hdiwp11lp0/<++><CR>"_c4l

" ALE Config
let g:ale_linters_explicit = 1
let g:ale_linters = { 
            \ 'ruby': ['rubocop'],
            \ 'python': ['pylint'],
            \ 'javascript': ['eslint'],
            \}
let g:ale_fixers = { 
            \ 'ruby': ['rubocop'],
            \ 'python': ['black'],
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

nmap <silent> ;an <Plug>(ale_previous_wrap)
nmap <silent> ;ap <Plug>(ale_next_wrap)

" Mapping for ALEFix
nnoremap ;fix :ALEFix<CR>


call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'jremmen/vim-ripgrep'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0

" let g:vimwiki_list = [{ 'path': '~/notes', 'syntax': 'markdown', 'ext': '.md' }]

" autocmd FileType vimwiki set ft=markdown

" Do not look for completion in included files, :h 'cpt
setglobal complete-=i
setlocal complete-=i

" Highlight colors for vimdiff
highlight DiffAdd ctermbg=22
highlight DiffDelete ctermbg=52
highlight DiffChange ctermbg=8
highlight DiffText ctermbg=25

" Remove readonly mode on vimdiff
set noro

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap gvd :vs<CR><plug>(lsp-definition)
    nmap gtd :vs<CR><plug>(lsp-definition)<C-w>T
    nmap ghd :s<CR>:normal <plug>(lsp-definition)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
