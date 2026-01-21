" These are for ruby files
inoremap ;rt <% <++> %><Esc>6h"_4cl
inoremap ;rtt <%= <++> %><Esc>6h"_4cl
inoremap ;f def <++><CR>end<Esc>k2l"_4cl
inoremap ;cls class <++> < <++><CR>end<Esc>k4l"_4cl
inoremap ;mod module <++><CR>end<Esc>k5l"_4cl
inoremap ;nam namespace <++> do<CR>end<Esc>k/<++><CR>"_4cl

function RSpecLine()
    execute ':w'
    execute "!bundle exec rspec -fd %:".line(".")
endfunction

function RSpecFile()
    execute ':w'
    execute "!bundle exec rspec -fd %"
endfunction

function RSpecAll()
    execute ':w'
    execute "!bundle exec rspec -fd"
endfunction

nnoremap ;rl :call RSpecLine()<CR>
nnoremap ;rf :call RSpecFile()<CR>
nnoremap ;ra :call RSpecAll()<CR>

" Insert Debugger in normal and insert mode
nnoremap ;dd mzodebugger<Esc>:w<CR>`z
nnoremap ;ud mzOdebugger<Esc>:w<CR>`z
inoremap ;dd <Esc>mzodebugger<Esc>`za
inoremap ;ud <Esc>mzOdebugger<Esc>`za

set listchars=leadmultispace:┊\ ,trail:.,eol:\ 
set list
