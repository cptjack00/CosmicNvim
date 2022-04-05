local theme = require('nightfox.palette')
local themeColors = theme.load("nightfox")

local colors = {
  white = themeColors.fg2,
  bg = themeColors.bg1,
  bg_highlight = themeColors.bg3,
  normal = themeColors.blue,
  insert = themeColors.cyan,
  command = themeColors.orange,
  visual = themeColors.magenta,
  replace = themeColors.red,
  diffAdd = themeColors.green_br,
  diffModified = themeColors.cyan,
  diffDeleted = themeColors.red,
  trace = themeColors.orange,
  hint = themeColors.cyan,
  info = themeColors.green_br,
  error = themeColors.magenta_br,
  warn = themeColors.orange,
  floatBorder = themeColors.border_highlight,
  selection_caret = themeColors.pink,
}

return colors

