local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.scrolloff = 10
opt.termguicolors = true
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.splitright = true
opt.splitbelow = true
opt.modifiable = true
opt.undofile = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")



vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.cmd("ColorizerToggle")
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
