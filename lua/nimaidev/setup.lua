-- cursor settings
vim.opt.guicursor = ""

-- line number settings
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = true

-- swap/backup/undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors= true

-- scroll
vim.opt.scrolloff = 8

-- sign column for linting and git
vim.opt.signcolumn = "yes"

-- allow @ and - as file name [for tailwind like library]
vim.opt.isfname:append("@-@")


-- update time
vim.opt.updatetime = 50

-- shows vertical line at column 80
vim.opt.colorcolumn = "100"
