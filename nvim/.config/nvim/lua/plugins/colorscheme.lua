return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon", -- Ensures moon is explicitly targeted
      on_highlights = function(hl, c)
        -- Sets the window split line color
        hl.WinSeparator = {
          fg = c.orange, -- Use a TokyoNight palette color (e.g., orange, blue, magenta)
          bg = "NONE", -- Keeps the background transparent
          bold = true, -- Optional: makes the separator pop out more
        }
      end,
    },
  },
}
