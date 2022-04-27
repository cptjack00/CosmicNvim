-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = true,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      functions = "italic,bold",
      keywords = "italic",
      numbers = "NONE",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      barbar = true,
      -- bufferline = true,
      cmp = true,
      dashboard = true,
      lsp_saga = true,
      native_lsp = true,
      lsp_trouble = true,
      telescope = true,
      notify = true,
      nvimtree = true,
      whichkey = true,
      treesitter = true,
      modes = true,
      gitsigns = true

    },
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")
