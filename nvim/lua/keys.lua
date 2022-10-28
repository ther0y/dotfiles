local term = require("utils.term")

-- general
nmap("<c-l>", "<c-i>")
nmap("<leader><space>", "<cmd>noh<cr>")
nmap("<s-r>", ":%s//gI<left><left><left>")
nmap("<f5>", "<cmd>set list!<cr>")
imap("<f5>", "<c-o><cmd>set list!<cr>")
cmap("<f5>", "<c-c><cmd>set list!<cr>")
nmap("<f7>", "mmgg=G`m")
nmap("<c-u>", "<cmd>UndotreeToggl<cr>")
vmap("u", "<esc><cmd>Gdiff<cr>gv<cmd>diffget<cr><c-w><c-w>ZZ")
nmap("<leader><leader>x", "<cmd>w<cr><cmd>source %<cr>")
nmap("<leader>cp", "<cmd>cp<cr>")

--utils
nmap("<leader>z", "<cmd>ZoomToggle<CR>")

-- clipboard
vmap("<leader>y", '"+y')
vmap("<leader>p", '"+p')

-- easymotion
nmap("<leader><leader>f", "<Plug>(easymotion-overwin-f)")
xmap("<leader><leader>f", "<Plug>(easymotion-overwin-f)")
omap("<leader><leader>f", "<Plug>(easymotion-overwin-f)")

-- file actions
nmap("<C-s>", "<cmd>w<cr>")
imap("<C-s>", "<Esc><cmd>w<cr>")
nmap("<leader>ww", "<cmd>w<cr>", { desc = "Write to file" })
nmap("<leader>w!", "<cmd>w!<cr>", { desc = "Force write to file" })
--map <leader>wr :w<cr>:source ~/.config/nvim/init.vim<cr>
--map <leader>wi :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
nmap("<leader>qq", "<cmd>q<cr>", { desc = "quit" })
nmap("<leader>q!", "<cmd>q!<cr>", { desc = "Force quit" })
nmap("<a-;>", "<cmd>NvimTreeFindFile<cr>")

-- pane resize & splits
nmap("<c-right>", "<cmd>vertical resize +3<cr>")
nmap("<c-left>", "<cmd>vertical resize -3<cr>")
nmap("<c-up>", "<cmd>resize +3<cr>")
nmap("<c-down>", "<cmd>resize -3<cr>")
nmap("<c-s-right>", "<cmd>vertical resize +15<cr>")
nmap("<c-s-left>", "<cmd>vertical resize -15<cr>")
nmap("<c-s-up>", "<cmd>resize +15<cr>")
nmap("<c-s-down>", "<cmd>resize -15<cr>")
nmap("<a-right>", "<c-w><right>")
nmap("<a-left>", "<c-w><left>")
nmap("<a-up>", "<c-w><up>")
nmap("<a-down>", "<c-w><down>")
nmap("<leader>-", "<cmd>split<cr>")
nmap("<leader>\\", "<cmd>vsplit<cr>")

-- pane movement
nmap("<leader><right>", "<c-w>L")
nmap("<leader><left>", "<c-w>H")
nmap("<leader><up>", "<c-w>K")
nmap("<leader><down>", "<c-w>J")

-- tabs
nmap("<a-t>", "<cmd>tabnew<cr>")
nmap("<s-right>", "<cmd>BufferLineCycleNext<cr>")
nmap("<s-left>", "<cmd>BufferLineCyclePrev<cr>")
nmap("<c-w>", "<cmd>bdelete %<cr>")

-- source files
nmap("<leader>.", "<cmd>source ~/.config/nvim/init.vim<cr>")
nmap("<leader><", "<cmd>tabedit ~/.config/nvim/init.vim<cr>")

-- terminal
tmap("<c-n>", "<c-\\><c-n>")
nmap("<leader>tt", "<cmd>vnew term://zsh<cr>")
nmap("<leader>tv", "<cmd>vsplit<cr><cmd>terminal<cr>i")
nmap("<leader>th", "<cmd>split<cr><cmd>terminal<cr>i")
nmap("<c-'>", function()
	term.floating_terminal_toggle()
end)

--fzf
nmap("fx", '<cmd>call fzf#run(fzf#wrap({\'source\': GetActiveBuffers(), "sink": "bdelete!"}))<cr>')

-- code reloacte
nmap("<c-j>", "<cmd>m .+1<CR>==")
nmap("<c-k>", "<cmd>m .-2<CR>==")
imap("<c-j>", "<Esc><cmd>m .+1<CR>==")
imap("<c-k>", "<Esc><cmd>m .-2<CR>==")
vmap("<c-j>", "<cmd>m '>+1<CR>gv=gv")
vmap("<c-k>", "<cmd>m '<-2<CR>gv=gv")

-- git
nmap("<Leader>gb", "<cmd>Git blame<CR>")
nmap("<Leader>gs", "<cmd>Git<CR>")
nmap("<Leader>gl", "<cmd>G log<CR>")
nmap("<Leader>gL", "<cmd>Glog<CR>")
nmap("<Leader>gr", "<cmd>Git reflog<CR>")
nmap("<leader>gd", "<cmd>Gdiff<CR>")
nmap("<leader>gc", "<cmd>GBranches<CR>")
nmap("<leader>gD", "<cmd>Gdiffsplit<CR>")
nmap("<leader>C", "<cmd>Git checkout")
nmap("<leader>gz", "<cmd>lua require('utils.term').git_client_toggle()<CR>")
nmap("<leader>lf", "<cmd>lua require('utils.fm').git_client_toggle()<CR>")

-- sessions
nmap("<leader>ps", "<cmd>SS!<CR>")
nmap("<leader>px", "<cmd>SClose<CR>")
nmap("<leader>pp", "<cmd>call fzf#run(fzf#wrap({'dir': g:sessions_path, 'source': \"ls *\", 'sink': 'SLoad'}))<CR>")

-- trouble
-- Lua
nmap("<leader>xx", "<cmd>TroubleToggle<cr>")
nmap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nmap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nmap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nmap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nmap("gR", "<cmd>TroubleToggle lsp_references<cr>")
