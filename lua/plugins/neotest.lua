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
               -- persist_project_selection = true,
               -- enable_dynamic_test_discovery = true,
            }
          }),
        },
        consumers = {
          -- add to your list of consumers
          playwright = require("neotest-playwright.consumers").consumers,
        },
      })
    end
  }
}
