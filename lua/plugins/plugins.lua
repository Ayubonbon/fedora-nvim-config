require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "java",
    "lua",
    "vim",
  },

  highlight = {
    enable = true,
  },
})
