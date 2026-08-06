require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "java",
    "lua",
    "vim",
  },

  highlight = {
    enable = true,
  },

  return {
  {
    "neovim/nvim-lspconfig",
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
  },

  {
    "hrsh7th/nvim-cmp",
  },

  {
    "hrsh7th/cmp-nvim-lsp",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
}
})
