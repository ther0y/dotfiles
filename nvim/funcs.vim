"""""""""""""""""
""" ZOOM PANE """
"""""""""""""""""

let g:isZoomed=0

function ToggleZoom()
  if (g:isZoomed == 1)
    execute "normal \<C-w>=<cr>"
    let g:isZoomed=0
  else
    execute "normal \<C-w>\<Bar>\<C-w>_<cr>"
    let g:isZoomed=1
  endif
endfunction

map <silent> <leader>z :call ToggleZoom()<cr>
"noremap Zz <c-w>_ \| <c-w>\|
"noremap Zo <c-w>=
