require 'core.options'
require 'core.keymaps'

vim.wo.number = true
vim.opt.termguicolors = true


-- lazy.vim setup ---------------------------------------------------

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('error cloning lazy.nvim:\n' .. out) end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "muniftanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },

  {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
    treesitter = true,
    },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
},

-- mason
{
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",


    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
        })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
    },

    config = function()
        local lspconfig = require("lspconfig")

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
        })

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.jdtls.setup({
            capabilities = capabilities,
        })
    end,
},

  {
    "saghen/blink.cmp",
    version = "*",

    opts = {
        keymap = {
            preset = "default",
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = true,
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },
    },
},


  --treesitter
  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
},

{
  'mrcjkb/rustaceanvim',
  -- To avoid being surprised by breaking changes,
  -- I recommend you set a version range
  version = '^9',
  -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
  -- No need for lazy.nvim to lazy-load it.
  lazy = false,
},
 })



