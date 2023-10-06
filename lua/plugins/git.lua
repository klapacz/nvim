return {
	-- copy link to file on github with <leader>gy
	{ "ruifm/gitlinker.nvim", opts = {} },
	{ "f-person/git-blame.nvim", opts = {} },

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>tb", gs.toggle_current_line_blame)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)
				map("n", "<leader>td", gs.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},

	{
		"sindrets/diffview.nvim",
		config = function()
			local actions = require("diffview.actions")

			require("diffview").setup({
				keymaps = {
					file_panel = {
						{ "n", "s", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry" } },
					},
				},
			})
			vim.keymap.set(
				"n",
				"<leader>GV",
				":DiffviewOpen<CR>",
				{ noremap = true, silent = true, desc = "[G]it [V]iew" }
			)
			vim.keymap.set(
				"n",
				"<leader>GF",
				":DiffviewFileHistory %<CR>",
				{ noremap = true, silent = true, desc = "[G]it [F]ile history" }
			)
		end,
	},
}
