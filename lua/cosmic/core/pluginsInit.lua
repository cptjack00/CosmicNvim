local user_config = require('cosmic.core.user')
local cosmic_packer = require('cosmic.packer')
local packer = cosmic_packer.packer
local use = packer.use

return packer.startup(function()
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    'nvim-lua/plenary.nvim',
  })

  use({
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup({
        enable = true,
      })
    end
  })

  use({
    'sindrets/diffview.nvim',
    config = function()
      require('cosmic.plugins.diffview')
    end,
  })

  use({
    'tami5/lspsaga.nvim',
    config = function ()
      require('cosmic.plugins.lspsaga')
    end,
  })
  use({
    'folke/trouble.nvim',
    config = function()
      require('cosmic.plugins.trouble')
    end,
  })

  use({
      'folke/which-key.nvim',
      config = function ()
         require('cosmic.plugins.which-key')
      end
  })

  use({
    'sbdchd/neoformat',
    ft = 'python',
  })

  use({
      'rhysd/vim-clang-format',
  })

  use({
    'EdenEast/nightfox.nvim',
    config = function()
      require('cosmic.plugins.nightfox')
    end,
  })

  use({
    'rcarriga/nvim-notify',
    config = function()
      require('cosmic.plugins.notify')
    end,
    after = user_config.theme,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'notify'),
  })

    use({
      'akinsho/bufferline.nvim',
      after = 'nvim-web-devicons',
      config = function()
        require('cosmic.plugins.bufferline')
       end,
   })

  -- theme stuff
  use({ -- statusline
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('cosmic.plugins.lualine')
    end,
    after = user_config.theme,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'lualine'),
  })

  -- Better Buffer Delete
  use({
        'moll/vim-bbye',
    })

   use({
      "max397574/better-escape.nvim",
      event = "InsertCharPre",
        config = function()
          require('cosmic.plugins.better-escape')
        end,
   })
  -- truefile explorer
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('cosmic.plugins.nvim-tree')
    end,
    cmd = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'nvim-tree'),
  })

  use({
    'CosmicNvim/cosmic-ui',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('cosmic.plugins.cosmic-ui')
    end,
  })

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('cosmic.lsp')
    end,
    requires = {
      { 'b0o/SchemaStore.nvim' },
      { 'williamboman/nvim-lsp-installer' },
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('cosmic.lsp.providers.null_ls')
        end,
        disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'null-ls'),
        after = 'nvim-lspconfig',
      },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('cosmic.plugins.lsp-signature')
        end,
        after = 'nvim-lspconfig',
        disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'lsp_signature'),
      },
    },
  })

   use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
        config = function()
           require('cosmic.plugins.blankline')
        end
   })

    -- telescope extension
    use({
        'NvChad/extensions',
    })

  -- autocompletion
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('cosmic.plugins.nvim-cmp')
    end,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('cosmic.plugins.luasnip')
        end,
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        config = function()
          require('cosmic.plugins.auto-pairs')
        end,
        after = 'nvim-cmp',
      },
    },
    event = 'InsertEnter',
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'nvim-cmp'),
  })

  -- git commands
  use({
    'tpope/vim-fugitive',
    opt = true,
    cmd = 'Git',
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'fugitive'),
  })

  -- git column signs
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    opt = true,
    event = 'BufRead',
    config = function()
      require('cosmic.plugins.gitsigns')
    end,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'gitsigns'),
  })

  -- floating terminal
  use({
    'voldikss/vim-floaterm',
    opt = true,
    event = 'BufWinEnter',
    config = function()
      require('cosmic.plugins.terminal')
    end,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'terminal'),
  })


  -- file navigation
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('cosmic.plugins.telescope.mappings').init()
      require('cosmic.plugins.telescope')
    end,
    event = 'BufWinEnter',
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'telescope'),
  })

    use({
       "liuchengxu/vista.vim",
    })
  use {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
      tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      enable_backwards = true, -- well ...
      completion = true, -- if the tabkey is used in a completion pum
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
      },
      ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude = {} -- tabout will ignore these filetypes
  }
    end,
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }

   use({
       "tzachar/cmp-tabnine",
       run = "./install.sh",
       after = "nvim-cmp",
   })

    use({
       "github/copilot.vim",
       after = "nvim-cmp",
    })

    use({
       "psliwka/vim-smoothie",
    })

  -- session/project management
  use({
    'glepnir/dashboard-nvim',
    config = function()
      require('cosmic.plugins.dashboard')
    end,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'dashboard'),
  })

  use({
    'rmagatti/auto-session',
    config = function()
      require('cosmic.plugins.auto-session')
    end,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'auto-session'),
  })

  use({
    'mbbill/undotree',
  })

  use({
    "tpope/vim-surround",
  })

  use({
    "Pocco81/TrueZen.nvim",
  })

  use({
    "godlygeek/tabular",
  })

  use({
    "preservim/vim-markdown",
  })

  -- use({
  --   "vimwiki/vimwiki",
  -- })

  use({
    "lervag/vimtex",
    config = function()
      require('cosmic.plugins.vimtex')
    end,
  })

  use({
    'ggandor/lightspeed.nvim',
  })

  use({
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function()
      require('cosmic.plugins.neogit')
    end,
  })
  -- lang/syntax stuff
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    run = ':TSUpdate',
    config = function()
      require('cosmic.plugins.treesitter')
    end,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'treesitter'),
  })

  -- comments and stuff
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('cosmic.plugins.comments')
    end,
    event = 'BufWinEnter',
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'comment-nvim'),
  })

  use({
      'ahmedkhalf/project.nvim',
      config = function ()
          require('project_nvim').setup{}
      end,
  })

  -- todo highlights
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('cosmic.plugins.todo-comments')
    end,
    event = 'BufWinEnter',
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'todo-comments'),
  })
  use({
    'arkav/lualine-lsp-progress',
  })
  -- colorized hex codes
  use({
    'norcalli/nvim-colorizer.lua',
    opt = true,
    cmd = {
      'ColorizerAttachToBuffer',
      'ColorizerToggle',
    },
    config = function()
      require('colorizer').setup()
    end,
    disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'colorizer'),
  })

  if user_config.add_plugins and not vim.tbl_isempty(user_config.add_plugins) then
    for _, plugin in pairs(user_config.add_plugins) do
      use(plugin)
    end
  end

  if cosmic_packer.first_install then
    packer.sync()
  end
end)
