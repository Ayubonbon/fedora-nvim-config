local blink = require("blink.cmp")

-- Set default capabilities for all LSP servers
vim.lsp.config("*", {
  capabilities = blink.get_lsp_capabilities(),
})

-- Configure TypeScript / JavaScript
vim.lsp.config("ts_ls", {})

-- Configure Lua
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Enable the language servers
vim.lsp.enable({ "ts_ls", "lua_ls" })
