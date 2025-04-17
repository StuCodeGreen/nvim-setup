return {
  {
    "tpope/vim-fugitive",
    cmd = "Git", -- lazy-load on :Git command
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status (fugitive)" },
    },
  },
}
