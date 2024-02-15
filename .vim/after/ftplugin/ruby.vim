" These are for ruby files
inoremap ;rt <% <++> %><Esc>6h4cl
inoremap ;rtt <%= <++> %><Esc>6h4cl

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
