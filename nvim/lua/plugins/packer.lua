local packer = require("packer")

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("kyazdani42/nvim-web-devicons")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})

	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("preservim/tagbar")

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use("simrat39/symbols-outline.nvim")

	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use("saadparwaiz1/cmp_luasnip")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("joshdick/onedark.vim")
	use("morhetz/gruvbox")
	use("mattn/emmet-vim")
	use("ap/vim-css-color")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })

	use("j-hui/fidget.nvim")
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	use("jesseleite/vim-agriculture")
	use("sheerun/vim-polyglot")
	use("pangloss/vim-javascript")
	use("OmniSharp/Omnisharp-vim")
	--use 'neoclide/coc.nvim', {'branch': 'release'}
	use("digitaltoad/vim-pug")
	use("tpope/vim-fugitive")
	use("mbbill/undotree")
	--use 'edkolev/tmuxline.vim'
	use("tpope/vim-surround")
	use("mhinz/vim-startify")
	use("arcticicestudio/nord-vim")
	use("ryanoasis/vim-devicons")
	use("preservim/nerdcommenter")
	use("junegunn/goyo.vim")
	--use 'wakatime/vim-wakatime'
	use("stsewd/fzf-checkout.vim")
	use("voldikss/vim-floaterm")
	use("easymotion/vim-easymotion")
	--use 'puremourning/vimspector'
	--use 'ludovicchabant/vim-gutentags'
	use("airblade/vim-rooter")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	use("nvim-telescope/telescope-project.nvim")
	use("cljoly/telescope-repo.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		--tag = 'nightly' -- optional, updated every week. (see issue #1193)
	})

	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommanded if need floating window support

	use("wakatime/vim-wakatime")

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function() end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "ellisonleao/glow.nvim" })
end)
