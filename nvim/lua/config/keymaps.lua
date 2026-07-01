vim.keymap.set("n", "<leader>p", function()
  vim.cmd("put +")
  vim.cmd("normal! '[=']")
end, { desc = "Paste clipboard below and reindent" })

vim.keymap.set("n", "<leader>o", ":put _<CR>", { desc = "Add blank line below" })
vim.keymap.set("n", "<leader>O", ":put! _<CR>", { desc = "Add blank line above" })

-- Keep things centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep jumps centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep jumps centered" })

vim.keymap.set("n", "n", "nzz", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search result centered" })

vim.keymap.set("n", "*", "*zz", { desc = "Search word forward centered" })
vim.keymap.set("n", "#", "#zz", { desc = "Search word backward centered" })

-- Suggestion to open folds automatically.  Will uncomment / remove when / if needed
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")
