" Python related shortcuts
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
