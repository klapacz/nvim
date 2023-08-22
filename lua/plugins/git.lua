return {
  {
    "sindrets/diffview.nvim",
    config = function ()
      require("diffview").setup({})
      -- TODO: add descriptions
      vim.keymap.set("n", "<leader>GG", ":DiffviewOpen<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>Gq", ":DiffviewClose<CR>", { noremap = true, silent = true })
    end,
  }
}
