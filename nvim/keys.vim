"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clipboard
vmap <leader>y "+y

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys writers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-s> :w <cr>
imap <C-s> <Esc>:w<cr>a
map <leader>ww :w <cr>
map <leader>w! :w! <cr>
map <leader>wr :w<cr>:source ~/.config/nvim/init.vim<cr>
map <leader>wi :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys quiters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>qq :q <cr>
map <leader>q! :q! <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>bn :bn <cr> " go to next buffer
map <leader>bd :bd <cr> " delete buffer

map <silent> <leader>o :BufOnly <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-RIGHT> :vertical resize +3<CR>
map <C-LEFT>    :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

map <C-S-RIGHT> :vertical resize +15<CR>
map <C-S-LEFT>  :vertical resize -15<CR>
noremap <silent> <C-S-Up> :resize +15<CR>
noremap <silent> <C-S-Down> :resize -15<CR>

map <silent> <A-Right> <C-w><Right>
map <silent> <A-Left> <C-w><Left>
map <silent> <A-Up> <C-w><Up>
map <silent> <A-Down> <C-w><Down>

map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

map <silent> <leader>- :split <cr>
map <silent> <leader>\ :vsplit <cr>

set fillchars+=vert:\
:highlight StatusLine ctermfg=bg ctermbg=bg guibg=bg guifg=bg   
:highlight StatusLineNC ctermfg=bg ctermbg=bg guibg=bg guifg=bg

nnoremap <S-Right> :tabnext<CR>
nnoremap <S-Left> :tabrewind<CR>

"" Resize window
"  nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"  nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <C-t> :tabnew<CR> " open new tab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>. :source ~/.config/nvim/init.vim <cr>
map <leader>, :tabedit ~/.config/nvim/init.vim <cr>
map <leader>; :CocConfig<cr>

"
" Highlight the active window even play nice with tmux splits
"
"if has('nvim')
"    hi ActiveWindow ctermbg=235 | hi InactiveWindow ctermbg=237
"    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
"
"    au VimEnter,WinEnter,BufEnter,BufWinEnter,FocusGained * hi ActiveWindow ctermbg=235 | hi InactiveWindow ctermbg=237
"    au VimLeave,WinLeave,BufLeave,BufWinLeave,FocusLost * hi ActiveWindow ctermbg=235 | hi InactiveWindow ctermbg=237
"else
"    hi Normal ctermbg=None
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <C-n> <C-\><C-n>
map <Leader>tt :vnew term://zsh<CR>
map <leader>sv :vsplit <cr> :terminal <cr> i
map <leader>ss :split <cr> :terminal <cr> i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-p> :Files <cr>
noremap fb :Buffers <cr>
noremap fl :BLines <cr>
noremap Fg :GFiles ?<cr>
noremap fi :PlugInstall <cr>
noremap ft :Tags <cr>
noremap fh :Helptags <cr>
noremap fd :call fzf#run(fzf#wrap({'source': "find ../* -type d -not -path '**/node_modules/*'"}))<CR>
noremap fp :call fzf#run(fzf#wrap({'dir': g:sessions_path, 'source': "ls *", 'sink': 'SLoad'}))<CR>
noremap fg :Rg 
"let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys moving code up / down
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> keys git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gb :Gblame<CR>  " git blame
nnoremap <Leader>gs :Git<CR>  " git status
nnoremap <Leader>gl :G log<CR>  " git log
nnoremap <Leader>gL :Glog<CR>  " git log
nnoremap <Leader>gr :Git reflog<CR>  " git reflog
nnoremap <leader>gd :Gdiff<CR> " git diff
nnoremap <leader>gD :Gdiffsplit<CR> " git diffsplit
nnoremap <leader>C  :Git checkout 

nmap gs <Plug>(coc-git-chunkinfo)

