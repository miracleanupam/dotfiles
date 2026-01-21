inoremap ;l console.debug();<Esc>F)i

" ;ll keys in insert mode inserts console.log('') with quotes
" Useful for logging custom log remarks
inoremap ;ll console.debug('');<Esc>F'i

" Syntax on
syntax on

" Set colors for non printing characters, as dim as possible
:hi SpecialKey ctermfg=0

set listchars=leadmultispace:┊\ ,trail:.,eol:\ 
set list
