local fn = vim.fn
local utils = require("utils")

--  ----------------------------------------------------------------------------------
-- install packer into pack directory if it is not installed yet
--  ----------------------------------------------------------------------------------
vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

-- local plug_url_format = "https://hub.fastgit.org/%s"
local plug_url_format = "https://github.91chi.fun/https://github.com/%s"
-- local plug_url_format = ""
-- if vim.g.is_linux then
--  plug_url_format = "https://hub.fastgit.xyz/%s"
-- else
--  plug_url_format = "https://github.com/%s"
-- end


local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

--  ----------------------------------------------------------------------------------
-- Begin lua plugin management
--  ----------------------------------------------------------------------------------

local util = require('packer.util')
require("packer").startup({

  function(use)

    -- it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    use({"wbthomason/packer.nvim", opt = true})

    -- Snippet engine and snippet template
    use({"SirVer/ultisnips", event = 'InsertEnter'})
    use({ "honza/vim-snippets", after = 'ultisnips'})

    -- ---------------------- completion ----------------------
    use({"onsails/lspkind-nvim", event = "VimEnter"})
    use {"hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]]}
     -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
    use {"quangnguyen30192/cmp-nvim-ultisnips", after = {'nvim-cmp', 'ultisnips'}}

    -- ------------------- lsp --------------------
    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use { 'williamboman/nvim-lsp-installer'}
    use({ "neovim/nvim-lspconfig", after = {"cmp-nvim-lsp","nvim-lsp-installer"}, config = [[require('config.lsp')]]})

    -- -------------------- treesitter -------------------
    use({ "nvim-treesitter/nvim-treesitter", event = 'BufEnter', run = ":TSUpdate", config = [[require('config.treesitter')]] })

    -- -------------------- Markit -------------------
    use 'David-Kunz/markid'

    -- -------------------- telescope --------------------
    use {'nvim-telescope/telescope-fzf-native.nvim', event = 'BufEnter', run = 'make' }
    use {
      'nvim-telescope/telescope.nvim', after = 'telescope-fzf-native.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }, config = [[require('config.telescope')]]
    }

    -- -------------------- zen-mode ----------------------
    use({'folke/zen-mode.nvim', cmd = 'ZenMode', config = [[require('config.zen-mode')]]})

    -- A list of colorscheme plugin you may want to try. Find what suits you.
    use({"lifepillar/vim-gruvbox8", opt = true})
    use({"navarasu/onedark.nvim", opt = true})
    use({"sainnhe/edge", opt = true})
    use({"sainnhe/sonokai", opt = true})
    use({"sainnhe/gruvbox-material", opt = true})
    use({"sainnhe/everforest", opt = true})
    use({"EdenEast/nightfox.nvim", opt = true})
    use({"rebelot/kanagawa.nvim", opt = true})

    -- -------------------------- Comment ---------------------------
    use({"tpope/vim-commentary"})

    use {'kyazdani42/nvim-web-devicons'}

    -- -------------------------- statusline ------------------------
    use { 'nvim-lualine/lualine.nvim', config = [[require('config.statusline')]] }

    -- -------------------------- buffertags -------------------------
    use({ "akinsho/bufferline.nvim", config = [[require('config.bufferline')]] })


    -- -------------------------- show marker ------------------------
    use { 'kshenoy/vim-signature'}

    -- -------------------------- terminal ---------------------------
    use {"akinsho/toggleterm.nvim", config = [[require('config.toggleterm')]]}

    -- -------------------------- autopairs --------------------------
    use {"windwp/nvim-autopairs", after = {'nvim-cmp', 'nvim-treesitter'},config = [[require('config.autopairs')]] }

    -- -------------------------- gitsigns ----------------------------
    use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]]}

    -- -------------------------- file explorer ----------------------------
    use { 'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons'},
        config = [[require('config.nvim-tree')]] }

    -- ----------------- Modern matchit implementation ------------------------
    use({"andymass/vim-matchup", event = "VimEnter"})

    -- ----------------- show and trim trailing whitespaces -------------------
    use {'jdhao/whitespace.nvim', event = 'VimEnter'}

    -- ----------------- rooter -------------------
    use({"airblade/vim-rooter", event = "VimEnter"})

    -- -------------------- vimtex --------------------------
    use "lervag/vimtex"

    -- -------------------- surround --------------------------
    use({"machakann/vim-sandwich", event = "VimEnter"})



  end,

  config = {
    max_jobs = 16,
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua'),
    git = {
      default_url_format = plug_url_format,
    },
  },

})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
