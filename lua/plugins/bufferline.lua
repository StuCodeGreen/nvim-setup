return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
        -- Sort buffers according to Harpoon list
        sort_by = function(buffer_a, buffer_b)
          local ok, harpoon = pcall(require, "harpoon")
          if not ok then return buffer_a.id < buffer_b.id end

          local items = harpoon:list().items

          local function index(bufnr)
            for i, item in ipairs(items) do
              if vim.fn.bufnr(item.value) == bufnr then
                return i
              end
            end
            return math.huge -- Non-harpoon buffers go last
          end

          return index(buffer_a.id) < index(buffer_b.id)
        end,
      },
    })

    -- Optional keymaps
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
  end,
}
