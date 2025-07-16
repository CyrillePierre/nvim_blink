vim.opt.matchpairs:append('<:>')
vim.opt.foldlevel = 20
-- vim.opt.foldmethod = 'syntax'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.history = 10000

vim.opt.swapfile = true

vim.opt.title = true
vim.opt.titlestring = ''
vim.opt.titleold = ''

vim.opt.winminwidth = 20
vim.opt.winwidth = 110

vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.wrap = false
vim.opt.listchars = {eol = '$', tab = '>-', trail = '#'}
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.o.cinoptions = ':0,(s,Ws,m1,N-s,E-s,g0,hs'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.backspace = 'indent,eol,start'

vim.opt.completeopt = 'menu,preview,noselect'
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'

vim.o.sessionoptions='buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions'

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.mouse = 'nv'
vim.opt.tw = 100

local columns = {}
for i = 101, 300 do
	table.insert(columns, i)
end
vim.opt.colorcolumn = table.concat(columns, ',')
