" Python related shortcuts

" Set tab spaces to 4
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

" Update ctags
nnoremap <leader>ts :!ctags -R .<CR>

" Create a function skeleton
inoremap ;f def <++>(<++>):<CR><++><Esc>k0/<++><CR>"_ct(

" Create a class function skeleton
inoremap ;fc def <++>(self, <++>):<CR><++><Esc>k0/<++><CR>"_ct(

" Create a class skeleton with constructor
inoremap ;c class <++>:<CR>def __init__(self, <++>):<CR><++><Esc>kk0/<++><CR>"_ct:
inoremap ;ds """<CR>"""<Esc>ko

" Create a if name == main construct
inoremap ;nm if __name__ == "__main__":<CR>

" Create a import skeleton
inoremap ;i import 
inoremap ;fi from <++> import <++><Esc>0/<++><CR>"_cw
inoremap ;dd <Esc>mzoimport pdb<CR>pdb.set_trace()<CR><Esc>`za
inoremap ;ud <Esc>mzOimport pdb<CR>pdb.set_trace()<CR><Esc>`za
nnoremap ;dd mzoimport pdb<CR>pdb.set_trace()<CR><Esc>:w<CR>`z
nnoremap ;ud mzOimport pdb<CR>pdb.set_trace()<CR><Esc>:w<CR>`z
inoremap ;l print();<Esc>F)i
inoremap ;ll print('');<Esc>F'i

set listchars=leadmultispace:┊\ \ \ ,trail:.,eol:\ 
set list
