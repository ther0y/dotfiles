vim.cmd([[
function! GetActiveBuffers()
    let l:blist = getbufinfo({'bufloaded': 1, 'buflisted': 1})
    let l:result = []
    for l:item in l:blist
        "skip unnamed buffers; also skip hidden buffers?
        if empty(l:item.name)
            continue
        endif
        let i = split(shellescape(l:item.name), "/")[-1]
        call add(l:result, substitute(i, "\'", "", "g"))
    endfor
    return l:result
endfunction
]])
