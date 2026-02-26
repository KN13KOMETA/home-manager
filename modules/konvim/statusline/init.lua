---@diagnostic disable: missing-fields

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

require("heirline").setup({
  statusline = {
    {
      static = {
        mode_names = {
          n = "n",
          no = "n",
          nov = "n",
          noV = "n",
          ["no\22"] = "n",
          niI = "n",
          niR = "n",
          niV = "n",
          nt = "n",
          ntT = "n",

          i = "i",
          ic = "i",
          ix = "i",

          v = "v",
          vs = "v",
          V = "v",
          Vs = "v",
          ["\22"] = "v",
          ["\22s"] = "v",

          R = "r",
          Rc = "r",
          Rx = "r",
          Rv = "r",
          Rvc = "r",
          Rvx = "r",

          c = "c",
          cr = "c",
          cv = "c",
          cvr = "c",

          s = "o",
          S = "o",
          ["\19"] = "o",
          t = "o",
          ["!"] = "o",
          r = "o",
          rm = "o",
          ["r?"] = "o",
        },
        group_names = {
          n = "MiniStatuslineModeNormal",
          i = "MiniStatuslineModeInsert",
          v = "MiniStatuslineModeVisual",
          r = "MiniStatuslineModeReplace",
          c = "MiniStatuslineModeCommand",
          o = "MiniStatuslineModeOther",
        },
      },
      init = function(self)
        self.mode = self.mode_names[vim.fn.mode()]
        self.group = self.group_names[self.mode]
      end,
      provider = " ",
      hl = function(self)
        return self.group
      end,
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end),
      },
    },
  },
  -- winbar = {},
  -- tabline = {},
  -- statuscolumn = {},
})
