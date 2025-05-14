return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
  keys = {
    -- Normal mode: toggle current line
    {
      "<C-_>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      mode = "n",
      desc = "Toggle comment line",
    },
    -- Visual mode: toggle selected lines
    {
      "<C-_>",
      function()
        -- exits visual mode first, then toggles based on selection type
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
        require("Comment.api").toggle.linewise(vim.fn.visualmode())
      end,
      mode = "v",
      desc = "Toggle comment selection",
    },
  },
}

