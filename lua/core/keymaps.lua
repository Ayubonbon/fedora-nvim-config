
vim.g.mapleader = " "

-- Map <leader>e to toggle Neo-tree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set("n", "<F5>", function()
  local dir = vim.fn.expand("%:p:h")
  local file = vim.fn.expand("%:t")
  local class = vim.fn.expand("%:t:r")

  -- Map <F5> to run java program
  vim.cmd("split | terminal")
  vim.fn.chansend(vim.b.terminal_job_id,
    "cd " .. dir .. " && javac " .. file .. " && java " .. class .. "\n")
end, { desc = "Run Java File" })

-- Map <leader>ts to run typescript file
vim.keymap.set("n", "<F6>", function()
  local dir = vim.fn.expand("%:p:h")
  local file = vim.fn.expand("%:t")

  vim.cmd("split")
  vim.cmd("terminal")

  vim.defer_fn(function()
    vim.fn.chansend(
      vim.b.terminal_job_id,
      "cd " .. dir .. " && ts-node " .. file .. "\n"
    )

    vim.cmd("startinsert")
  end, 100)
end, { desc = "Run TypeScript File" })
