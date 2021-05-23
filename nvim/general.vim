
set nocompatible              " be iMproved, required
filetype on                 " required
set mouse=a
set path+=**                    " Searches current directory recursively.
set encoding=UTF-8
set wildmenu                    " Display all matches when tab complete.
set incsearch                                   " Incremental search
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber           " Display line numbers
syntax enable
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=80
set splitbelow splitright
set termguicolors
let g:onedark_terminal_italics=1
colorscheme onedark
filetype plugin indent on
" Fix jump forward
nnoremap <C-l> <C-i>
nnoremap <Leader><space> :noh<cr>
nnoremap <S-r> :%s//gI<Left><left><Left>
let g:NERDTreeWinSize=30
nnoremap <C-n> :NERDTreeToggle <CR>
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:␣
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

map <F7> mmgg=G`m

nnoremap <C-u> :UndotreeToggle <cr>
vmap <silent> u <esc>:Gdiff<cr>gv:diffget<cr><c-w><c-w>ZZ
