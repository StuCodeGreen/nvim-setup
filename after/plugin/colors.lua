-- Set Rose Pine as the default colorscheme
vim.cmd('colorscheme rose-pine')

-- Optionally, configure Rose Pine settings
require('rose-pine').setup({
  dark_variant = 'main', -- or 'moon' or 'dawn'
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,
  disable_background = true,   -- Enables transparent background
  disable_float_background = true, -- Makes floating windows transparent
})
-- Apply the colorscheme
vim.cmd('colorscheme rose-pine')

