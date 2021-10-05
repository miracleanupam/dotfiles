let mapleader = " "
nnoremap <leader>sop :source ~/.vimrc<CR>

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

" Default program to open URLS
let g:netrw_browsex_viewer= "xdg-open"

" Map W to w and Q to q
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Keep selection after indenting, gv reselects the last reselction
vnoremap > >gv
vnoremap < <gv

" Sort lines in alphabetic order
vnoremap <C-s> :sort<CR>

function! ChooseUnicodeSymbol()
    call inputsave()
    let symbol = input('Choose Symbol: ')
    if symbol == "fa"
        let returnval = "∀"
    elseif symbol == "phi"
        let returnval = "Φ"
    elseif symbol == "es"
        let returnval = "□"
    elseif symbol == "te"
        let returnval = "∃"
    elseif symbol == "ec"
        let returnval = "〇"
    elseif symbol == "s0"
        let returnval = "₀"
    elseif symbol == "s1"
        let returnval = "₁"
    elseif symbol == "s2"
        let returnval = "₂"
    elseif symbol == "s3"
        let returnval = "₃"
    elseif symbol == "s4"
        let returnval = "₄"
    elseif symbol == "s5"
        let returnval = "₅"
    elseif symbol == "s6"
        let returnval = "₆"
    elseif symbol == "s7"
        let returnval = "₇"
    elseif symbol == "s8"
        let returnval = "₈"
    elseif symbol == "s9"
        let returnval = "₉"
    elseif symbol == "be"
        let returnval = "ϵ"
    elseif symbol == "pie"
        let returnval = "π"
    elseif symbol == "er"
        let returnval = "◊"
    elseif symbol == "di"
        let returnval = "÷"
    elseif symbol == "in"
        let returnval = "∞"
    elseif symbol == "ti"
        let returnval = "√"
    elseif symbol == "ne"
        let returnval = "≠"
    elseif symbol == "lte"
        let returnval = "≤"
    elseif symbol == "gte"
        let returnval = "≥"
    elseif symbol == "sbo"
        let returnval = "⊂"
    elseif symbol == "spo"
        let returnval = "⊃"
    elseif symbol == "sbe"
        let returnval = "⊆"
    elseif symbol == "spe"
        let returnval = "⊇"
    elseif symbol == "est"
        let returnval = "▷"
    elseif symbol == "fst"
        let returnval = "▶"
    elseif symbol == "eet"
        let returnval = "◁"
    elseif symbol == "fet"
        let returnval = "◀"
    elseif symbol == "ok"
        let returnval = "✓"
    elseif symbol == "bx"
        let returnval = "✗"
    elseif symbol == "dor"
        let returnval = "‖"
    elseif symbol == "arr"
        let returnval = "→"
    elseif symbol == "rarr"
        let returnval = "←"
    elseif symbol == "darr"
        let returnval = "↔"
    elseif symbol == "lda"
        let returnval = "⇒"
    elseif symbol == "rda"
        let returnval = "⇐"

    elseif symbol == "pm"
        let returnval = "±"
    elseif symbol == "dda"
        let returnval = "⇔"
    elseif symbol == "ae"
        let returnval = "≈"
    elseif symbol == "is"
        let returnval = "∩"
    elseif symbol == "un"
        let returnval = "∪"
    elseif symbol == "or"
        let returnval = "∨"
    elseif symbol == "and"
        let returnval = "∧"
    elseif symbol == "os"
        let returnval = "ø"
    else
        let returnval = ""
    endif
    call inputrestore()
    return returnval
endfunction

inoremap <expr> <C-j> ''.ChooseUnicodeSymbol().''

function! UnderLine(width)
    if a:width == 1
        :normal! mmyypVr=`m
    else
        :normal! mmyypVr-`m
    endif
endfunction

nnoremap ;ue :call UnderLine(1)<CR>
nnoremap ;ud :call UnderLine(0)<CR>

filetype plugin on
filetype indent on

" gx downloads the webpage and opens it
" this is just a work around from the internet
nmap gx yiW:!xdg-open <cWORD><CR> <C-r>" & <CR><CR>

" Keyboard Shortcuts
" Toggle line numbers
noremap <F9> :set number! relativenumber!<CR>

" Keybind for moving around buffers easily
noremap <F7> :buffers<CR>:buffer<Space>
nnoremap <C-n> :bn<CR>
nnoremap <C-m> :bp<CR>
nnoremap <C-N> gt<CR>
nnoremap <C-M> gT<CR>

" Toggle search highlight with F6
" Setting hlsearch on highlight the keywords even when you don't need them, so
" toggling would be a better choice
noremap <F6> :set hlsearch!<CR>

" Mapping to move to next place holder, works on all files
" Placeholder is chosen as <++> as it is very unlikely to come across this
" pattern anywehere
inoremap <Tab><Tab><Tab> <Esc>/<++><CR>"_c4l

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
" Try catch in javascript
autocmd FileType javascript inoremap ;tc try<Space>{<CR><++><CR><BS><BS>}<Space>catch<Space>(e)<Space>{<CR><++><CR><BS><BS>}<ESC>kkk/<++><CR>"_cw

" Python related shortcuts
" Create a function skeleton
autocmd FileType python inoremap ;f def <++>(<++>):<CR><++><Esc>k0/<++><CR>"_ct(

" Create a class function skeleton
autocmd FileType python inoremap ;fc def <++>(self, <++>):<CR><++><Esc>k0/<++><CR>"_ct(

" Create a class skeleton with constructor
autocmd FileType python inoremap ;c class <++>:<CR>def __init__(self, <++>):<CR><++><Esc>kk0/<++><CR>"_ct:
autocmd FileType python inoremap ;ds """<CR>"""<Esc>ko

" Create a if name == main construct
autocmd FileType python inoremap ;nm if __name__ == "__main__":<CR>

" Create a import skeleton
autocmd FileType python inoremap ;i import 
autocmd FileType python inoremap ;fi from <++> import <++><Esc>0/<++><CR>"_cw
