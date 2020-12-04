" Enable syntax highlighting
syntax enable

" Show line numbers
set number relativenumber

" Don't bother with backwards compatability
set nocompatible

" Search down into subfolders
" proves tab completion
set path+=**

" Display matching file with tab completion
set wildmenu

" Set smart indent
set autoindent

" Set case insensitive matching
set ignorecase

" Softwrap
set linebreak

" Option for 80 characters column indicator for coding style, cc for short
" set colorcolumn=80

" Set split to the right and below
set splitbelow
set splitright

" Set tab spaces to 4
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

" Reload the file on changes
set autoread

" Use system clipboard for yanking and pasting, needs gVim
set clipboard=unnamedplus

" Map W to w and Q to q
:command WQ wq
:command Wq wq
:command W w
:command Q q

filetype plugin on
filetype indent on

" Keyboard Shortcuts
" Toggle line numbers
noremap <F9> :set number! relativenumber!<CR>

" Keybind for moving around buffers easily
noremap <F7> :buffers<CR>:buffer<Space>
nnoremap <C-n> :bn<CR>
nnoremap <C-m> :bp<CR>

" Toggle search highlight with F6
" Setting hlsearch on highlight the keywords even when you don't need them, so
" toggling would be a better choice
noremap <F6> :set hlsearch!<CR>

" Mapping to move to next place holder, works on all files
" Placeholder is chosen as <++> as it is very unlikely to come across this
" pattern anywehere
inoremap <Space><Space><Space> <Esc>/<++><CR>"_c4l

" When javascript files are opened, make this key bindings available
" The "_ redirects the change/deletion of placeholders to arbitary buffer
"
" ;l keys in insert mode inserts console.log() without quotes
" Useful for logging objects
autocmd FileType javascript inoremap ;l console.log();<Esc>F)i
" ;ll keys in insert mode inserts console.log('') with quotes
" Useful for logging custom log remarks
autocmd FileType javascript inoremap ;ll console.log('');<Esc>F'i
" ;f keys in insert mode inserts snippet for creating new function
" Use space key three times to navigate to the next placeholder
autocmd FileType javascript inoremap ;f const<Space><++><Space>=<Space><++>(<++>)<Space>=><Space>{<CR><++><CR>};<Esc>kk/<++><CR>"_cw
" Delete all console.log lines with F4; does not touch console.error or console.warn
autocmd FileType javascript noremap <F4> :g/console.log/d<CR>
