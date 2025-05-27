return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
          side = "left",
        },
        filters = {
          dotfiles = false,
          custom = {},
        },
        git = {
          enable = true,
          ignore = false,
        },
      })
      -- Auto-open nvim-tree on startup
      local function open_nvim_tree_on_startup(data)
        local IGNORED_FT = {
          "gitcommit",
          "markdown",
          "gitrebase",
          "svn",
          "hgcommit",
        }

        if vim.tbl_contains(IGNORED_FT, vim.bo[data.buf].filetype) then
          return
        end
        --
        -- local is_directory = vim.fn.isdirectory(data.file) == 1
        -- if is_directory then
        --   vim.cmd.cd(data.file)
        -- end

        require("nvim-tree.api").tree.open()
        vim.cmd("wincmd l") -- focus back on the editor
      end

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = open_nvim_tree_on_startup,
      })
      -- Auto-quit Neovim when nvim-tree is the last window
      -- Only quit if nvim-tree is the only window AND we're not just starting up
      local should_auto_quit = false

      -- Enable auto-quit AFTER startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.defer_fn(function()
            should_auto_quit = true
          end, 100) -- wait 100ms before enabling quit
        end,
      })
 


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- Skip if file or directory passed on cmdline
    if data.file ~= "" or vim.fn.isdirectory(data.file) == 1 then return end

    -- Open nvim-tree
    require("nvim-tree.api").tree.open()
    -- Close any `[No Name]` buffer from the buffer list
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_get_name(buf) == "" then
    vim.cmd("bd " .. buf)
  end
end

    -- Close [No Name] buffer and focus back on tree
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_name(buf) == "" then
        vim.api.nvim_win_close(win, true)
      end
    end
  end,
})



      -- Quit when only nvim-tree is open (but only after startup)
      -- vim.api.nvim_create_autocmd("BufEnter", {
      --   group = vim.api.nvim_create_augroup("NvimTreeAutoQuit", { clear = true }),
      --   callback = function()
      --     if not should_auto_quit then
      --       return
      --     end
      --
      --     local wins = vim.api.nvim_list_wins()
      --     local is_only_tree = true
      --
      --     for _, win in ipairs(wins) do
      --       local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      --       if not bufname:match("NvimTree_") then
      --         is_only_tree = false
      --         break
      --       end
      --     end
      --
      --     if is_only_tree then
      --       vim.cmd("quit")
      --     end
      --   end,
      -- })
    end,
  },
}
