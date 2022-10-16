autocmd FileType rust         noremap <buffer> <C-a> :!cargo run<CR>
autocmd FileType python         noremap <buffer> <C-a> :!python %<CR>
"autocmd BufReadPost,FileReadPost * normal zR
autocmd InsertLeave,WinEnter * let &l:foldmethod=g:oldfoldmethod
autocmd InsertEnter,WinLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual

"augroup remember_folds
  "autocmd!
  "autocmd BufWinLeave * mkview
  "autocmd BufWinEnter * silent! loadview
"augroup END

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
