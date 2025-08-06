return require("packer").startup(function(use)
	-- Packer manages itself
	use "wbthomason/packer.nvim"

	------------------
	-- Core plugins --
	------------------
	use { "nvim-lua/plenary.nvim" }
	use { "nvim-telescope/telescope.nvim", tag = "0.1.4",
		requires = { "nvim-lua/plenary.nvim" } }
	use "folke/tokyonight.nvim"
  use({ "rose-pine/neovim", as = "rose-pine",
		config = function()
      vim.g.rose_pine_disable_background = true
      vim.cmd("colorscheme rose-pine")
      -- override background
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#000000" })
  end
})
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter",
		run = function() require("nvim-treesitter.install").update({ with_sync = true }) end })
	use "nvim-treesitter/playground"

	-- Primagen favs
	use "ThePrimeagen/harpoon"
	use "ThePrimeagen/vim-apm"
	use "ThePrimeagen/vim-be-good"
	use "ThePrimeagen/refactoring.nvim"
	use "mbbill/undotree"
	use "tpope/vim-fugitive"

	--LSP Zero (quick LSP + cmp)
	use { "williamboman/mason.nvim", run = ":MasonUpdate" }
	use "williamboman/mason-lspconfig.nvim"
	use { "VonHeikemen/lsp-zero.nvim", branch = "v1.x", requires = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}}

		
	-- Autocompletion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	  
	-- Snippets
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"
	
	-- Optional extras
 -- use "ThePrimeagen/tmux-sessionizer"
  use "folke/zen-mode.nvim"
  use "github/copilot.vim"
  use "laytan/cloak.nvim"



     end)
