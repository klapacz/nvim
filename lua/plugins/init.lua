return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local trouble = require("trouble")
			trouble.setup({})
			vim.keymap.set(
				"n",
				"<leader>xx",
				"<cmd>TroubleToggle workspace_diagnostics<cr>",
				{ silent = true, noremap = true }
			)
		end,
	},

	{
		"andrewferrier/debugprint.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		version = "*",
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup({})
		end,
	},

	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup()
			vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
				desc = "Toggle Spectre",
			})
		end,
	},

	{
		"dmmulroy/tsc.nvim",
		opts = {},
	},
	"nickeb96/fish.vim",
	"rafcamlet/nvim-luapad",

	{
		"Exafunction/codeium.vim",
		config = function()
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-l>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-h>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},

	{
		"ThePrimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>ha", mark.add_file)
			vim.keymap.set("n", "<leader>H", ui.toggle_quick_menu)

			vim.keymap.set("n", "<leader>hh", function()
				ui.nav_file(1)
			end)
			vim.keymap.set("n", "<leader>hj", function()
				ui.nav_file(2)
			end)
			vim.keymap.set("n", "<leader>hk", function()
				ui.nav_file(3)
			end)
			vim.keymap.set("n", "<leader>hl", function()
				ui.nav_file(4)
			end)
		end,
	},

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },

	{
		"folke/tokyonight.nvim",
		dependencies = {
			"f-person/auto-dark-mode.nvim",
		},
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
			require("auto-dark-mode").setup({
				update_interval = 1000,
				set_dark_mode = function()
					vim.cmd.colorscheme("tokyonight")
				end,
				set_light_mode = function()
					vim.cmd.colorscheme("tokyonight-day")
				end,
			})
		end,
	},

	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = "tokyonight",
				component_separators = "|",
				section_separators = "",
				globalstatus = true,
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		},
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
		},
	},

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },
}
