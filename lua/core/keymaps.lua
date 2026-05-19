
vim.g.mapleader = " "

-- Map <leader>e to toggle Neo-tree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set("n", "<F5>", function()
  local dir = vim.fn.expand("%:p:h")
  local file = vim.fn.expand("%:t")
  local class = vim.fn.expand("%:t:r")

  vim.cmd("split | terminal")
  vim.fn.chansend(vim.b.terminal_job_id,
    "cd " .. dir .. " && javac " .. file .. " && java " .. class .. "\n")
end, { desc = "Run Java File" })
