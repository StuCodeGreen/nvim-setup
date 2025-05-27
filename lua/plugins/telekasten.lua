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
      weeklies = "weekly",
      templates = default_home .. "/templates",
      template_new_daily = default_home .. "/templates/daily.md",
      template_new_note = default_home .. "/templates/default.md",
      vaults = {
        [vault_1] = {
          home = home .. "/" .. vault_1,
          dailies = "daily",
          weeklies = "weekly",
          templates = home .. "/" .. vault_1 .. "/templates",
          template_new_daily = home .. "/" .. vault_1 .. "/templates/daily.md",
          template_new_note = home .. "/" .. vault_1 .. "/templates/default.md",
        },
        [vault_2] = {
          home = home .. "/" .. vault_2,
          templates = home .. "/" .. vault_2 .. "/templates",
          template_new_daily = home .. "/" .. vault_2 .. "/templates/daily.md",
          template_new_note = home .. "/" .. vault_2 .. "/templates/default.md",
        },
        [vault_3] = {
          home = home .. "/" .. vault_3,
          templates = home .. "/" .. vault_3 .. "/templates",
          template_new_daily = home .. "/" .. vault_3 .. "/templates/daily.md",
          template_new_note = home .. "/" .. vault_3 .. "/templates/default.md",
        },
        [vault_4] = {
          home = home .. "/" .. vault_4,
          templates = home .. "/" .. vault_4 .. "/templates",
          template_new_daily = home .. "/" .. vault_4 .. "/templates/daily.md",
          template_new_note = home .. "/" .. vault_4 .. "/templates/default.md",
        },
      },
      auto_set_filetype = false,
      take_over_my_home = false,
      template_handling = "prefer_new_note",
    })
  end,
  keys = {
    { "<leader>zn", function() require("telekasten").new_note() end,           desc = "Create new note" },
    { "<leader>zd", function() require("telekasten").find_daily_notes() end,   desc = "Find daily notes || Create new daily" },
    { "<leader>zw", function() require("telekasten").find_weekly_notes() end,  desc = "Find weekly notes || Create new weekly" },
    { "<leader>zt", function() require("telekasten").new_templated_note() end, desc = "New note from template" },
    { "<leader>za", function() require("telekasten").find_notes() end,         desc = "Find notes" },
    { "<leader>zz", function() require("telekasten").panel() end,              desc = "Telekasten panel" },
  },
}
