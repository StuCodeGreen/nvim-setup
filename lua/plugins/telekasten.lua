-- plugins/telekasten.lua
return {
  "renerocksai/telekasten.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "renerocksai/calendar-vim",
  },
  config = function()
    -- Load .env
    local note_dir = os.getenv("TELEKASTEN_NOTE_DIR") or " "
    local default_vault = os.getenv("TELEKASTEN_DEFAULT_VAULT") or " "
    local vault_1 = os.getenv("TELEKASTEN_VAULT_1") or " "
    local vault_2 = os.getenv("TELEKASTEN_VAULT_2") or " "
    local vault_3 = os.getenv("TELEKASTEN_VAULT_3") or " "
    local vault_4 = os.getenv("TELEKASTEN_VAULT_4") or " "

    local default_home = vim.fn.expand(note_dir .. "/" .. default_vault)
    local home = vim.fn.expand(note_dir)

    require("telekasten").setup({

      home = default_home,
      dailies = "daily",
      template_new_daily = default_home .. "/" .. default_vault .. "/templates/daily.md",
      vaults = {
        [vault_1] = {
          home = home .. "/" .. vault_1,
          dailies = "daily",
          weeklies = "weekly",
          template_new_daily = home .. "/" .. vault_1 .. "/templates/daily.md",
        },
        [vault_2] = {
          home = home .. "/" .. vault_2,
          template_new_daily = home .. "/" .. vault_2 .. "/templates/daily.md",
        },
        [vault_3] = {
          home = home .. "/" .. vault_3,
          template_new_daily = home .. "/" .. vault_3 .. "/templates/daily.md",
        },
        [vault_4] = {
          home = home .. "/" .. vault_4,
          template_new_daily = home .. "/" .. vault_4 .. "/templates/daily.md",
        },
      },
      auto_set_filetype = false,
      take_over_my_home = false,
      template_handling = "prefer_new_note",
    })
  end,
  keys = {
    { "<leader>zd", function() require("telekasten").find_daily_notes() end, desc = "Find daily notes" },
    { "<leader>zz", function() require("telekasten").panel() end,            desc = "Telekasten panel" },
    { "<leader>zn", function() require("telekasten").goto_today() end,       desc = "Open today's daily note" },
  },
}
