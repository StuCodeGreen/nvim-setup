return {
  "rmagatti/auto-session",
  event = "VimEnter",
  config = function()
    vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,localoptions"
    require("auto-session").setup {
      log_level = "info",
      auto_restore_enabled = true,
      auto_save_enabled = true,
      session_dir = vim.fn.stdpath("data") .. "/sessions/",
    }
  end
}

