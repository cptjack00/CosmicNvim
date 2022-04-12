local components = require "cosmic.plugins.lualine.components"
local M = {}
M.config = {
  active = true,
  on_config_done = nil,
  options = {
    theme = "auto",
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      components.mode,
    },
    lualine_b = {
      components.branch,
      components.filename,
      components.diagnostics,
    },
    lualine_c = {
      components.diff,
      components.python_env,
      components.lsp_progress,
    },
    lualine_x = {
      components.treesitter,
      components.lsp,
      components.filetype,
    },
    lualine_y = {
      components.python_env,
    },
    lualine_z = {
      components.scrollbar,
    },
  },
  inactive_sections = {
    lualine_a = {
      "filename",
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "nvim-tree" },
}
local lualine = require "lualine"
lualine.setup(M.config)
return M
