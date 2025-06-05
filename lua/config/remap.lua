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
map('n', '<C-s>', ':w<CR>', { desc = "Save file" })
-- map('n', '<C-q>', ':q<CR>', { desc = "Quit file"})
-- map('n', '<C-q>', ':bd<CR>', { desc = "Close buffer" })
map("v", "<C-c>", '"+y', { noremap = true, silent = true }, { desc = "Ctrl+c to copy to system clipboard" })
map("n", "<C-v>", '"+p', { noremap = true, silent = true }, { desc = "Ctrl+v to paste from system clipboard" })
map("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true }, { desc = "Ctrl+v to paste from system clipboard" })
-- Shift + Arrow keys for selection in normal mode
map("n", "<S-Up>", "v<Up>", { noremap = true, silent = true })
map("n", "<S-Down>", "v<Down>", { noremap = true, silent = true })
map("n", "<S-Left>", "v<Left>", { noremap = true, silent = true })
map("n", "<S-Right>", "v<Right>", { noremap = true, silent = true })
map("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format file", silent = true })

-- experimental
vim.keymap.set("n", "<C-q>", function()
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })

  -- Filter out NvimTree buffers
  local real_buffers = vim.tbl_filter(function(buf)
    return not buf.name:match("NvimTree_")
  end, buffers)

  if #real_buffers <= 1 then
    -- Quit all cleanly after deleting last real buffer
    vim.cmd("bd " .. current)
    vim.cmd("qa") -- Quit all to prevent `[No Name]`
  else
    -- Switch to another real buffer before closing this one
    for _, buf in ipairs(real_buffers) do
      if buf.bufnr ~= current then
        vim.api.nvim_set_current_buf(buf.bufnr)
        break
      end
    end
    vim.cmd("bd " .. current)
  end
end, { desc = "Close buffer and quit if last real one" })

-- vim.keymap.set("n", "<C-q>", function()
--   local current = vim.api.nvim_get_current_buf()
--   local buffers = vim.fn.getbufinfo({ buflisted = 1 })
--
--   -- Count real (non-NvimTree) buffers
--   local real_buffers = vim.tbl_filter(function(buf)
--     return not buf.name:match("NvimTree_")
--   end, buffers)
--
--   if #real_buffers <= 1 then
--     vim.cmd("bd")      -- close buffer
--     vim.cmd("quit")    -- then quit if no more real buffers
--   else
--     -- Focus another real buffer before deleting current
--     for _, buf in ipairs(real_buffers) do
--       if buf.bufnr ~= current then
--         vim.api.nvim_set_current_buf(buf.bufnr)
--         break
--       end
--     end
--     vim.cmd("bd " .. current)
--   end
-- end, { desc = "Close buffer and quit if last real one" })
--
