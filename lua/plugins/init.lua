return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    version = "*"
  },

  {
    'nvim-pack/nvim-spectre',
    config = function ()
      require('spectre').setup()
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
      })
    end,
  },

  {
    "dmmulroy/tsc.nvim",
    opts = { enable_progress_notifications = false }
  },
  "nickeb96/fish.vim",
  "rafcamlet/nvim-luapad",

  {
    'github/copilot.vim',
    config = function ()
      vim.g.copilot_no_tab_map = true
      -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
      vim.keymap.set("i", "<C-g>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr=true, replace_keycodes = false })
      -- TODO: figure out how to make this work
      -- vim.keymap.set("i", "<C-;>", 'copilot#Previous()', { silent = true, expr = true })
      -- vim.keymap.set("i", "<C-,>", 'copilot#Next()', { silent = true, expr = true })
      -- vim.keymap.set("i", "<C-/>", 'copilot#Suggest)()', { silent = true, expr = true })
    end
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>ha", mark.add_file)
      vim.keymap.set("n", "<leader>H", ui.toggle_quick_menu)

      vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end)
    end,
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',


  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-day'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'tokyonight',
        component_separators = '|',
        section_separators = '',
        globalstatus = true,
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      }
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
}
