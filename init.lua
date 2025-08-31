-- https://vieitesss.github.io/posts/Neovim-new-config/#completion

-- https://github.com/radleylewis/nvim-lite/blob/youtube_demo/init.lua
vim.opt.shiftwidth     = 4
vim.opt.cursorline     = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.o.wrap             = true -- Enable line wrapping
vim.o.linebreak        = true -- Break words cleanly at line wrapping
vim.o.foldenable       = true
vim.opt.expandtab      = false
vim.opt.swapfile       = false
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.clipboard      = "unnamedplus"
vim.o.foldmethod       = 'indent'
vim.o.foldlevel        = 1  -- Open most folds by default
vim.o.foldlevelstart   = 99 -- Start editing with all folds open

vim.pack.add({
	{ src = "https://github.com/neanias/everforest-nvim.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/karb94/neoscroll.nvim.git" },
	{ src = "https://github.com/windwp/nvim-autopairs.git" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1.6.0",
	},
})

vim.keymap.set("n", "<space>s", [[:.!sh<CR>]], { noremap = true, silent = false })

vim.keymap.set("n", "<space>do", function()
	vim.diagnostic.open_float()
end)
vim.keymap.set("n", "<space>fb", function()
	vim.lsp.buf.format()
end)
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "gi", function()
	vim.lsp.buf.implementation()
end)
vim.keymap.set("n", "gc", function()
	vim.lsp.buf.code_action()
end)

vim.lsp.enable({
	"lua_ls",
	"bashls",
	"gopls",
	"zk",
	"helm_ls",
	"terraformls",
})

require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<C-space>"] = {},
		["<C-p>"] = {},
		["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-n>"] = { "select_and_accept" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
		-- ["<C-e>"] = { "hide" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		}
	},

	cmdline = {
		keymap = {
			preset = 'inherit',
			['<CR>'] = { 'accept_and_enter', 'fallback' },
		},
	},

	sources = { default = { "lsp" } }
})

require("everforest").setup({
	background = "medium",
	transparent_background_level = 2,
	italics = true,
	disable_italic_comments = false,
	sign_column_background = "none",
	ui_contrast = "low",
	dim_inactive_windows = false,
	diagnostic_text_highlight = false,
	diagnostic_virtual_text = "coloured",
	diagnostic_line_highlight = false,
	spell_foreground = false,
	show_eob = true,
	float_style = "bright",
	inlay_hints_background = "none",
	on_highlights = function(highlight_groups, palette) end,
	colours_override = function(palette) end,
})
require("everforest").load()

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.tabstop = 2     -- how many spaces a tab visually equals
		vim.opt_local.shiftwidth = 2  -- indent size
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = false -- use actual tabs, not spaces
	end,
})

-- Set the statusline
-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
-- https://elianiva.my.id/posts/neovim-lua-statusline/
vim.o.statusline               = "%f%r %m %=[%l/%L]"

-- Disable Plugins
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_spec              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
