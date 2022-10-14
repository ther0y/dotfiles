local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function nmap(key, action)
	keymap("n", key, action, opts)
end

local function vmap(key, action)
	keymap("v", key, action, opts)
end

local function xmap(key, action)
	keymap("x", key, action, opts)
end

local function imap(key, action)
	keymap("i", key, action, opts)
end

local function omap(key, action)
	keymap("o", key, action, opts)
end

local function tmap(key, action)
	keymap("t", key, action, opts)
end

local function cmap(key, action)
	keymap("c", key, action, opts)
end

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
nmap("<leader>ww", "<cmd>w<cr>")
nmap("<leader>w!", "<cmd>w!<cr>")
--map <leader>wr :w<cr>:source ~/.config/nvim/init.vim<cr>
--map <leader>wi :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
nmap("<leader>qq", "<cmd>q<cr>")
nmap("<leader>q!", "<cmd>q!<cr>")

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

-- tabs
nmap("<c-t>", "<cmd>tabnew<cr>")
nmap("<s-right>", "<cmd>tabnext<cr>")
nmap("<s-left>", "<cmd>tabrewind<cr>")

-- source files
nmap("<leader>.", "<cmd>source ~/.config/nvim/init.vim<cr>")
nmap("<leader><", "<cmd>tabedit ~/.config/nvim/init.vim<cr>")

-- terminal
tmap("<c-n>", "<c-\\><c-n>")
nmap("<leader>tt", "<cmd>vnew term://zsh<cr>")
nmap("<leader>tv", "<cmd>vsplit<cr><cmd>terminal<cr>i")
nmap("<leader>th", "<cmd>split<cr><cmd>terminal<cr>i")

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

-- sessions
nmap("<leader>ps", "<cmd>SS!<CR>")
nmap("<leader>px", "<cmd>SClose<CR>")
nmap("<leader>pp", "<cmd>call fzf#run(fzf#wrap({'dir': g:sessions_path, 'source': \"ls *\", 'sink': 'SLoad'}))<CR>")

-- telescope
nmap("<c-p>", "<cmd>Telescope find_files<cr>")
nmap("fg", "<cmd>Telescope live_grep<cr>")
nmap("fu", "<cmd>Telescope grep_string<cr>")
vmap("fu", "<cmd>Telescope grep_string<cr>")
nmap("fb", "<cmd>Telescope buffers<cr>")
nmap("fh", "<cmd>Telescope help_tags<cr>")
nmap("fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
nmap("fm", "<cmd>Telescope keymaps<cr>")
nmap("fd", "<cmd>Telescope diagnostics<cr>")
nmap("gb", "<cmd>Telescope git_branches<cr>")
nmap("gs", "<cmd>Telescope git_status<cr>")
nmap("gt", "<cmd>Telescope git_stash<cr>")
nmap("cl", "<cmd>Telescope treesitter<cr>")
nmap("cr", "<cmd>Telescope lsp_references<cr>")
