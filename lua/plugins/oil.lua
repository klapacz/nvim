local function keymap()
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end
local function config()
  require("oil").setup()
  keymap()
end

return {
  'stevearc/oil.nvim',
  config = config,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
