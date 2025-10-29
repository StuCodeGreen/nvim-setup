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
      -- Auto-open nvim-tree on startup (only when no files passed as arguments)
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          -- Only auto-open if no arguments were passed to nvim
          if vim.fn.argc() == 0 then
            local IGNORED_FT = {
              "gitcommit",
              "markdown",
              "gitrebase",
              "svn",
              "hgcommit",
            }

            -- Skip if the current buffer is of an ignored filetype
            if vim.tbl_contains(IGNORED_FT, vim.bo[data.buf].filetype) then
              return
            end

            -- Open nvim-tree
            require("nvim-tree.api").tree.open()

            -- Clean up any [No Name] buffers
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_get_name(buf) == "" then
                vim.cmd("bd " .. buf)
                break -- Only close the first [No Name] buffer
              end
            end

            -- Focus back on the editor
            vim.cmd("wincmd l")
          end
        end,
      })

      -- Auto-quit Neovim when nvim-tree is the last window
      local should_auto_quit = false

      -- Enable auto-quit AFTER startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.defer_fn(function()
            should_auto_quit = true
          end, 100) -- wait 100ms before enabling quit
        end,
      })



    end,
  },
}
