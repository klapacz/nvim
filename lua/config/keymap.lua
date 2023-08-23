-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set({ "n", "x" }, "<leader>p", "\"_dP", { desc = "[p]aste without yanking" })
vim.keymap.set({ "n", "x" }, "<leader>d", "\"_d", { desc = "[d]elete without yanking" })
vim.keymap.set({ "n", "x" }, "<leader>y", "\"+y", { desc = "[y]ank to system clipboard" })

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")

vim.keymap.set("n", "gN", "<cmd>tabnew<cr>")
vim.keymap.set("n", "H", "<cmd>tabprev<cr>")
vim.keymap.set("n", "L", "<cmd>tabnext<cr>")

vim.keymap.set("n", "<leader>yp", function()
  local file_name = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
  local line_number = vim.fn.line(".")
  local file_line = file_name .. ":" .. line_number

  vim.fn.setreg('+', file_line)
  vim.notify("Copied to clipboard: " .. file_line, vim.log.levels.INFO)
end)

vim.keymap.set("n", "<leader>C", "<cmd>tabnew | tcd ~/.config/nvim/ | edit init.lua<cr>",
  { desc = "[C]d into config and edit" })

-- visual move lines
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", {silent =true})
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", {silent =true})
