--    ____  ______  __
--   / __ \/ __ \ \/ /   Masood Rezazadeh (TheRoy)
--  / /_/ / / / /\  /    https://masood.dev
-- / _, _/ /_/ / / /
--/_/ |_|\____/ /_/      There is always a catch
--
-- A customized init.lua for neovim (https://neovim.io/)

require("vars")
require("options")
--require("autocmd")
require("utils")
require("cmd")
require("plugins")
require("keys")
--source $HOME/.config/nvim/autocmd.vim
vim.cmd("source ~/.config/nvim/autocmd.vim")
