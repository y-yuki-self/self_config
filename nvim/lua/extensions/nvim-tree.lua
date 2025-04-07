require("nvim-tree").setup({
	sort_by = "extension",
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = "20%",
		side = "left",
		signcolumn = "no",
	},

	renderer = {
		highlight_git = true,
		highlight_opened_files = "name",
		icons = {
			glyphs = {
				git = {
					unstaged = "!",
					renamed = "»",
					untracked = "?",
					deleted = "✘",
					staged = "✓",
					unmerged = "",
					ignored = "◌",
				},
			},
		},
	},

	git = {
		enable = true,
		ignore = false,
	},

	actions = {
		expand_all = {
			max_folder_discovery = 100,
			exclude = { ".git", "target", "build" },
		},
	},

	on_attach = "default",
})

-- start neovim with open nvim-tree
--  require("nvim-tree.api").tree.toggle(false, true)
