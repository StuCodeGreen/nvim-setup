vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_banner = 0
vim.o.number = true
vim.o.autowriteall = true
vim.o.expandtab = true     -- use spaces instead of tabs
vim.o.shiftwidth = 2       -- number of spaces per indent level
vim.o.tabstop = 2
require("config.lazy")
vim.cmd.Dotenv(vim.fn.stdpath("config") .. "/.env")
