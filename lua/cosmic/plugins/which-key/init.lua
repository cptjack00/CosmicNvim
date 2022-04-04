local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers theme=ivy<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["d"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["u"] = { "<cmd>UndotreeToggle<cr>", "Toggle Undo Tree" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },
  D = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    S = { "<cmd>lua require'dap.ui.variables'.scopes()<cr>", "Scope" },
    h = { "<cmd>lua require'dap.ui.variables'.hover(function() return vim.fn.expand('<cexpr>') end)<cr>", "Visual hover" },
    v = { "<cmd>lua require'dap.ui.variables'.visual_hover()<cr>", "Visual hover" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics theme=get_ivy<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
    k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    F = { "<cmd>Lspsaga lsp_finder<cr>", "Finder" },
    t = {
      name = "Trouble",
      x = {"<cmd>TroubleToggle<CR>", "Toggle"},
      w = {"<cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle workspace diagnostics"},
      d = {"<cmd>TroubleToggle document_diagnostics<CR>", "Toggle document diagnostics"},
      l = {"<cmd>TroubleToggle loclist<CR>", "Toggle loclist"},
      q = {"<cmd>TroubleToggle quickfix<CR>", "Toggle quickfix"},
      r = {"<cmd>TroubleToggle lsp_references<CR>", "Toggle References"},
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches theme=ivy<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme theme=ivy<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags theme=ivy<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages theme=ivy<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles theme=ivy<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers theme=ivy<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps theme=ivy<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands theme=ivy<cr>", "Commands" },
    w = { "<cmd>Telescope terms theme=ivy<cr>", "Terminal" },
    p = {
      "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
    f = { "<cmd>Telescope find_files theme=ivy<cr>", "Find files" },
    t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find text" },
  },

  H = {
    name = "Gitsigns",
    s = {'<cmd>Gitsigns stage_hunk<CR>', 'Stage Hunk'},
    u = {'<cmd>Gitsigns undo_stage_hunk<CR>', 'Undo Stage Hunk'},
    r = {'<cmd>Gitsigns reset_hunk<CR>', 'Reset Hunk'},
    R = {'<cmd>Gitsigns reset_buffer<CR>', 'Reset Buffer'},
    p = {'<cmd>Gitsigns preview_hunk<CR>', 'Preview Hunk'},
    b = {'<cmd>lua require"gitsigns".blame_line{full=true}<CR>', 'Blame'},
    S = {'<cmd>Gitsigns stage_buffer<CR>', 'Stage Buffer'},
    U = {'<cmd>Gitsigns reset_buffer_index<CR>', 'Reset Buffer Index'},
    t = {
        name = "Toggle",
        d = {'<cmd>Gitsigns toggle_deleted<CR>', 'Deleted'},
        b = {'<cmd>Gitsigns toggle_current_line_blame<CR>', 'Current Line Blame'},
        l = {'<cmd>Gitsigns toggle_linehl<CR>', 'Line Highlight'},
        n = {'<cmd>Gitsigns toggle_numhl<CR>', 'Number Highlight'},
        s = {'<cmd>Gitsigns toggle_signs<CR>', 'Signs'},
        w = {'<cmd>Gitsigns toggle_word_diff<CR>', 'Word Diff'},
    },
  },

  t = {
    name = "Terminal",
    t = {':FloatermToggle<CR>', 'Toggle FLoating Terminal'},
    N = {':FloatermNew<CR>', 'New Floating Terminal'},
    k = {':FloatermKill<CR>', 'Kill Floating Terminal'},
    n = {':FloatermNext<CR>', 'Next Floating Terminal'},
    p = {':FloatermPrev<CR>', 'Prev Floating Terminal'},
    h = {":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>", "Horizontal Terminal"},
    v = {":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>", "Vertical Terminal"},
  },

  S = {
    name = "Sessions",
    s = {'<cmd>SaveSession<CR>', 'Save Session'},
    r = {'<cmd>silent RestoreSession<CR>', 'Restore Session'},
    d = {'<cmd>DeleteSession<CR>', 'Delete Session'},
  },

  ["r"] = { "<cmd>NvimTreeRefresh<cr>", "Refresh Tree" }
  -- t = {
  --   name = "Terminal",
  --   n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
  --   u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
  --   t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
  --   p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
  --   f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  --   h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
  --   v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  -- },
}

require("which-key").setup(setup)
require("which-key").register(mappings, opts)
