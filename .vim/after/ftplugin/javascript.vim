" When javascript files are opened, make this key bindings available

" The "_ redirects the change/deletion of placeholders to arbitary buffer

" ;l keys in insert mode inserts console.log() without quotes
" Useful for logging objects
inoremap ;l console.debug();<Esc>F)i

" ;ll keys in insert mode inserts console.log('') with quotes
" Useful for logging custom log remarks
inoremap ;ll console.debug('');<Esc>F'i

" ;f keys in insert mode inserts snippet for creating new function
" Use space key three times to navigate to the next placeholder
inoremap ;f const<Space><++><Space>=<Space><++>(<++>)<Space>=><Space>{<CR><++><CR>};<Esc>kk/<++><CR>"_cw

" Delete all console.log lines with F4; does not touch console.error or console.warn
nnoremap <leader>dls :g/console.log/d<CR>

" Try catch in javascript
inoremap ;tc try<Space>{<CR><++><CR><BS><BS>}<Space>catch<Space>(e)<Space>{<CR><++><CR><BS><BS>}<ESC>kkk/<++><CR>"_cw

" Set colors for non printing characters, as dim as possible
:hi SpecialKey ctermfg=0

set listchars=leadmultispace:┊\ ,trail:.,eol:\ 
set list
