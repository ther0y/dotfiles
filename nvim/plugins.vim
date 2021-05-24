"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> VimPlug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'OmniSharp/Omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
"  Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_dir = g:sessions_path

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"command! -nargs=-2 Prettier :CocCommand prettier.formatFile
"map <leader>p :Prettier <CR>

