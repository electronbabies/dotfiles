return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",

      on_colors = function(colors)
        colors.bg = "#070b14"
        colors.bg_dark = "#050810"
        colors.bg_float = "#101522"
        colors.bg_popup = "#101522"
        colors.bg_sidebar = "#070b14"
        colors.bg_statusline = "#070b14"

        colors.fg = "#dce3f2"
        colors.fg_dark = "#a9b4c8"
        colors.fg_gutter = "#4f5b70"

        colors.blue = "#7aa2f7"
        colors.blue0 = "#5f82c9"
        colors.blue1 = "#9ecbff"
        colors.blue2 = "#7dcfff"
        colors.blue5 = "#9ecbff"
        colors.blue6 = "#7dcfff"
        colors.blue7 = "#6fa8dc"

        colors.cyan = "#7dcfff"

        colors.magenta = "#bb9af7"
        colors.magenta2 = "#c8a9ff"

        colors.yellow = "#e0a85c"
        colors.orange = "#d98752"

        colors.green = "#8fcf8f"
        colors.green1 = "#a6d99a"
        colors.green2 = "#74b89a"

        colors.red = "#c94f5c"
        colors.red1 = "#df6673"

        colors.border = "#202a3b"
        colors.border_highlight = "#7aa2f7"

        colors.selection = "#2f3d5f"
        colors.comment = "#66758d"
      end,

      on_highlights = function(hl, c)
        -- UI
        hl.CursorLine = { bg = "#0d1320" }
        hl.LineNr = { fg = "#46546a" }

        hl.CursorLineNr = {
          fg = "#e0a85c",
          bold = true,
        }

        hl.Visual = { bg = "#2f3d5f" }

        hl.Search = {
          fg = "#070b14",
          bg = "#e0a85c",
          bold = true,
        }

        hl.IncSearch = {
          fg = "#070b14",
          bg = "#9ecbff",
          bold = true,
        }

        hl.MatchParen = {
          fg = "#e0a85c",
          bold = true,
          underline = true,
        }

        hl.NormalFloat = { bg = "#101522" }

        hl.FloatBorder = {
          fg = "#7aa2f7",
          bg = "#101522",
        }

        -- Core syntax
        hl.Comment = {
          fg = "#66758d",
          italic = true,
        }

        hl.String = {
          fg = "#8fcf8f",
        }

        hl.Character = {
          fg = "#8fcf8f",
        }

        hl.Number = {
          fg = "#e0a85c",
        }

        hl.Boolean = {
          fg = "#e0a85c",
          bold = true,
        }

        hl.Constant = {
          fg = "#d98752",
        }

        hl.Keyword = {
          fg = "#bb9af7",
          bold = true,
        }

        hl.Conditional = {
          fg = "#bb9af7",
          bold = true,
        }

        hl.Repeat = {
          fg = "#bb9af7",
          bold = true,
        }

        hl.Statement = {
          fg = "#bb9af7",
        }

        hl.Operator = {
          fg = "#9ecbff",
        }

        hl.Function = {
          fg = "#7dcfff",
        }

        hl.Identifier = {
          fg = "#dce3f2",
        }

        hl.Type = {
          fg = "#9ecbff",
          bold = true,
        }

        hl.Structure = {
          fg = "#9ecbff",
        }

        hl.Special = {
          fg = "#d98752",
        }

        hl.PreProc = {
          fg = "#d98752",
        }

        hl.Include = {
          fg = "#bb9af7",
        }

        hl.Delimiter = {
          fg = "#a9b4c8",
        }

        -- Treesitter semantic groups
        hl["@keyword"] = {
          fg = "#bb9af7",
          bold = true,
        }

        hl["@keyword.function"] = {
          fg = "#bb9af7",
          bold = true,
        }

        hl["@keyword.return"] = {
          fg = "#bb9af7",
          bold = true,
        }

        hl["@function"] = {
          fg = "#7dcfff",
        }

        hl["@function.call"] = {
          fg = "#7dcfff",
        }

        hl["@function.method"] = {
          fg = "#7dcfff",
        }

        hl["@function.method.call"] = {
          fg = "#7dcfff",
        }

        hl["@type"] = {
          fg = "#9ecbff",
          bold = true,
        }

        hl["@type.builtin"] = {
          fg = "#9ecbff",
          bold = true,
        }

        hl["@constructor"] = {
          fg = "#9ecbff",
        }

        hl["@variable"] = {
          fg = "#dce3f2",
        }

        hl["@variable.parameter"] = {
          fg = "#c8a9ff",
        }

        hl["@property"] = {
          fg = "#9ecbff",
        }

        hl["@string"] = {
          fg = "#8fcf8f",
        }

        hl["@string.special"] = {
          fg = "#74b89a",
        }

        hl["@number"] = {
          fg = "#e0a85c",
        }

        hl["@boolean"] = {
          fg = "#e0a85c",
          bold = true,
        }

        hl["@constant"] = {
          fg = "#d98752",
        }

        hl["@operator"] = {
          fg = "#9ecbff",
        }

        hl["@punctuation.delimiter"] = {
          fg = "#a9b4c8",
        }

        hl["@punctuation.bracket"] = {
          fg = "#a9b4c8",
        }

        hl["@tag"] = {
          fg = "#bb9af7",
        }

        hl["@tag.attribute"] = {
          fg = "#9ecbff",
        }

        hl["@tag.delimiter"] = {
          fg = "#6f7b91",
        }

        hl["@comment"] = {
          fg = "#66758d",
          italic = true,
        }

        -- Diagnostics
        hl.DiagnosticError = { fg = "#c94f5c" }
        hl.DiagnosticWarn = { fg = "#e0a85c" }
        hl.DiagnosticInfo = { fg = "#7dcfff" }
        hl.DiagnosticHint = { fg = "#8fcf8f" }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
    },
  },
}
