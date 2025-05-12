local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer", unpack(opts) })
map("n", "<C-Left>", "<C-w>h", { desc = "Window left", unpack(opts) })
map("n", "<C-Down>", "<C-w>j", { desc = "Window down", unpack(opts) })
map("n", "<C-Up>", "<C-w>k", { desc = "Window up", unpack(opts) })
map("n", "<C-Right>", "<C-w>l", { desc = "Window right", unpack(opts) })
map("n", "<leader>nn", "<cmd>NvimTreeFindFile<CR>", { desc = "Focus tree on current file" })
map("n", "<leader>nt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>nf", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
map('n', '<C-s>', ':w<CR>', { desc = "Save file"}) 
map('n', '<C-q>', ':q<CR>', { desc = "Quit file"})
map("v", "<C-c>", '"+y', { noremap = true, silent = true }, {desc="Ctrl+c to copy to system clipboard"})
map("n", "<C-v>", '"+p', { noremap = true, silent = true }, {desc="Ctrl+v to paste from system clipboard"})
map("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true }, {desc="Ctrl+v to paste from system clipboard"})
-- Shift + Arrow keys for selection in normal mode
map("n", "<S-Up>", "v<Up>", { noremap = true, silent = true })
map("n", "<S-Down>", "v<Down>", { noremap = true, silent = true })
map("n", "<S-Left>", "v<Left>", { noremap = true, silent = true })
map("n", "<S-Right>", "v<Right>", { noremap = true, silent = true })

