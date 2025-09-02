return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- стиль на ваш вкус: "storm" | "night" | "moon" | "day"
      style = "night",

      -- главный флажок прозрачности
      transparent = true,

      -- чтобы боковые панели/плавающие окна тоже были прозрачны
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },

      -- точечные правки хайлайтов (полезно для границ/статуслайна и пр.)
      on_highlights = function(hl, c)
        hl.Normal = { fg = hl.Normal.fg, bg = "none" }
        hl.NormalFloat = { fg = hl.NormalFloat and hl.NormalFloat.fg or c.fg, bg = "none" }
        hl.FloatBorder = { fg = c.border_highlight, bg = "none" }
        hl.SignColumn = { bg = "none" }
        hl.LineNr = { bg = "none" }
        hl.CursorLine = { bg = "none" }
        hl.CursorLineNr = { bg = "none" }
        hl.StatusLine = { bg = "none" }
        hl.WinSeparator = { fg = c.border, bg = "none" }
      end,
    },
  },
}
