"""""""""""""""""
""" ZOOM PANE """
"""""""""""""""""
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
map <silent> <leader>z :ZoomToggle<CR>

"""""""""""""""""""
""" GET BUFFERS """
"""""""""""""""""""
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

""""""""""""""""""""""
""" docker compose """
""""""""""""""""""""""
function! DockerCompose(direction)
    let l:compose_files_count = system("find docker-compose* | wc -l | awk '{print $1}'")
    if l:compose_files_count > 0
      if l:compose_files_count == 1
        if a:direction == "up"
          call RunDockerComposeUp("docker-compose.yml")
        else
          call RunDockerComposeDown("docker-compose.yml")
        endif
      endif
      if l:compose_files_count > 1
        if a:direction == "up"
          call fzf#run(fzf#wrap({'source': "find docker-compose*", 'sink': function('RunDockerComposeUp')}))
        else
          call fzf#run(fzf#wrap({'source': "find docker-compose*", 'sink': function('RunDockerComposeDown')}))
        endif
      endif
    endif
endfunction

function! RunDockerComposeUp(item)
  execute 'vs term://docker compose -f '.a:item.' up'
endfunction

function! RunDockerComposeDown(item)
  execute 'vs term://docker compose -f '.a:item.' down'
endfunction


