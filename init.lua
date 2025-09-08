vim.opt.shiftwidth     = 4
vim.opt.cursorline     = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.expandtab      = false
vim.opt.swapfile       = false
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.clipboard      = "unnamedplus"
vim.o.showcmd          = false
vim.o.wrap             = true
vim.o.linebreak        = true
vim.o.foldenable       = true
vim.o.foldmethod       = 'indent'
vim.o.foldlevel        = 1
vim.o.foldlevelstart   = 99

vim.api.nvim_set_hl(0, "StatusLineModified", { fg = "#A7C080", bold = true })
vim.o.statusline = "%f%r %#StatusLineModified#%m%* %=[%L]"

vim.pack.add({
	{ src = "https://github.com/neanias/everforest-nvim.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/karb94/neoscroll.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs.git" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1.6.0",
	},
})

vim.keymap.set("n", "<space>s", [[:.!sh<CR>]], { noremap = true, silent = false })

vim.keymap.set("n", "<space>ff", function()
	require("fzf-lua").files()
end)

vim.keymap.set("n", "<space>bb", function()
	require("fzf-lua").buffers()
end)

vim.keymap.set("n", "<space>gg", function()
	require("fzf-lua").live_grep()
end)

vim.keymap.set("n", "<space>do", function()
	vim.diagnostic.open_float()
end)

vim.keymap.set("n", "<space>fb", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<space>gd", function()
	vim.lsp.buf.definition()
end)

vim.keymap.set("n", "<space>gi", function()
	vim.lsp.buf.implementation()
end)

vim.keymap.set("n", "<space>gc", function()
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

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false,
			},
		},
	},
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

require('nvim-autopairs').setup()
require('neoscroll').setup()

require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_and_accept" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
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

require('fzf-lua').setup {
	files = {
		hidden = false,
	},
	winopts = {
		preview = {
			layout  = "vertical",
			title   = false,
			winopts = {
				number = false,
			},
		},
	},
}

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

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
