local M = {}

M.supported_themes = {
  'catppuccin',
  'dracula',
  'enfocado',
  'github',
  'gruvbox',
  'kanagawa',
  'nightfox',
  'nord',
  'onedark',
  'rose-pine',
  'tokyonight',
}

function M.init(use, config)
  use({ -- color scheme
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      vim.g.tokyonight_style = 'storm'
      vim.g.tokyonight_sidebars = { 'qf' }
      vim.cmd('color tokyonight')
    end,
    disable = config.theme ~= 'tokyonight',
  })

  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      local catppuccin = require('catppuccin')
        catppuccin.setup({
          transparent_background = false,
          styles = {
            comments = 'italic',
            functions = 'NONE',
            keywords = 'italic',
            strings = 'NONE',
            variables = 'italic',
          },
          integrations = {
            gitsigns = true,
            telescope = true,
            dashboard = true,
            nvimtree = {
              enabled = true,
              show_root = true,
              transparent_panel = true,
            },
            which_key = true,
            lsp_trouble = true,
            native_lsp = {
              enabled = true,
              underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
              },
            },
            lsp_saga = true,
            indent_blankline = {
              enabled = true,
              colored_indent_levels = true,
            },
            bufferline = true,
            notify = true,
            barbar = true,
            markdown = true,
          },
        })
      vim.cmd('colorscheme catppuccin')
    end,
    disable = config.theme ~= 'catppuccin',
  })

  use({
    'shaunsingh/nord.nvim',
    as = 'nord',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      require('nord').set()
    end,
    disable = config.theme ~= 'nord',
  })

  use({
    'ellisonleao/gruvbox.nvim',
    as = 'gruvbox',
    requires = { 'rktjmp/lush.nvim' },
    config = function()
      vim.o.background = 'dark'
      vim.cmd('colorscheme gruvbox')
    end,
    disable = config.theme ~= 'gruvbox',
  })

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.g.rose_pine_variant = 'moon'
      vim.cmd('colorscheme rose-pine')
    end,
    disable = config.theme ~= 'rose-pine',
  })

  use({
    'EdenEast/nightfox.nvim',
    as = 'nightfox',
    config = function()
      require('nightfox').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false,    -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,   -- Non focused panes set to alternative background
          styles = {              -- Style to be applied to different syntax groups
            comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = {             -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = {             -- List of various plugins and additional options
            -- ...
          },
        }
      })

      -- setup must be called before loading
      vim.cmd('color terafox')
    end,
    disable = config.theme ~= 'nightfox',
  })

  use({
    'navarasu/onedark.nvim',
    as = 'onedark',
    config = function()
      vim.cmd('color onedark')
    end,
    disable = config.theme ~= 'onedark',
  })

  use({
    'Mofiqul/dracula.nvim',
    as = 'dracula',
    config = function()
      vim.cmd('color dracula')
    end,
    disable = config.theme ~= 'dracula',
  })

  use({
    'wuelnerdotexe/vim-enfocado',
    as = 'enfocado',
    config = function()
      vim.g.enfocado_style = 'nature'
      vim.g.enfocado_plugins = {
        'cmp',
        'dashboard',
        'floaterm',
        'gitsigns',
        'lsp',
        'lsp-installer',
        'notify',
        'packer',
        'telescope',
        'todo-comments',
        'tree',
        'treesitter',
      }
      vim.cmd('autocmd VimEnter * ++nested colorscheme enfocado')
    end,
    disable = config.theme ~= 'enfocado',
  })

  use({
    'rebelot/kanagawa.nvim',
    as = 'kanagawa',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end,
    disable = config.theme ~= 'kanagawa',
  })

  use({
    'projekt0n/github-nvim-theme',
    as = 'github',
    config = function()
      require('github-theme').setup()
    end,
    disable = config.theme ~= 'github',
  })
end

return M
