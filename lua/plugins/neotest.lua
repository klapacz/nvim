return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- Adapters
      "thenbe/neotest-playwright",
    },
    config = function ()
      require("neotest").setup({
        adapters = {
          require("neotest-playwright").adapter({
            options = {
              enable_dynamic_test_discovery = true,
              preset = "debug",
              env = {
                DEBUG = "pw:webserver"
              }
            }
          }),
        },
        consumers = {
          -- add to your list of consumers
          playwright = require("neotest-playwright.consumers").consumers,
        },
      })

      vim.keymap.set("n", "<leader>tr", require("neotest").run.run , { noremap = true })
      vim.keymap.set("n", "<leader>ta", require("neotest").run.attach , { noremap = true })
    end
  }
}
