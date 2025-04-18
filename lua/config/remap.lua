local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer", unpack(opts) })
