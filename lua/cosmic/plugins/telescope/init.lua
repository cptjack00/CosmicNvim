local actions = require('telescope.actions')
local config = require('cosmic.core.user')
local icons = require('cosmic.theme.icons')
local u = require('cosmic.utils')

local default_mappings = {
  n = {
    ['Q'] = actions.smart_add_to_qflist + actions.open_qflist,
    ['q'] = actions.smart_send_to_qflist + actions.open_qflist,
    ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
    ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
    ['v'] = actions.file_vsplit,
    ['s'] = actions.file_split,
    ['<cr>'] = actions.file_edit,
    ['<C-n>'] = actions.move_selection_next,
    ['<C-p>'] = actions.move_selection_previous,
  },
  i = {
    ["<C-n>"] = actions.move_selection_next,
    ["<C-p>"] = actions.move_selection_previous,
    ["<C-c>"] = actions.close,
    ["<C-j>"] = actions.cycle_history_next,
    ["<C-k>"] = actions.cycle_history_prev,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    ["<CR>"] = actions.select_default + actions.center,
  },
}

local opts_cursor = {
  initial_mode = 'normal',
  sorting_strategy = 'ascending',
  theme = 'ivy',
  results_title = false,
}

local opts_vertical = {
  initial_mode = 'normal',
  sorting_strategy = 'ascending',
  theme = 'ivy',
  results_title = false,
}

local opts_flex = {
  theme = 'ivy',
}

require('telescope').setup(u.merge({
  defaults = {
    prompt_prefix = '🔍 ',
    selection_caret = icons.folder.arrow_closed,
    file_ignore_patterns = {
      '.git/',
    },
    dynamic_preview_title = true,
    vimgrep_arguments = {
      'rg',
      '--ignore',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    terms = {
        fuzzy = true,
        case_mode = 'smart_case',
        override_generic_sorter = true,
        override_file_sorter = true,
    }
  },
  pickers = {
    buffers = u.merge(opts_flex, {
      prompt_title = '✨ Search Buffers ✨',
      mappings = u.merge({
        n = {
          ['d'] = actions.delete_buffer,
        },
      }, default_mappings),
      sort_mru = true,
      preview_title = false,
    }),
    lsp_code_actions = u.merge(opts_cursor, {
      prompt_title = 'Code Actions',
    }),
    lsp_range_code_actions = u.merge(opts_vertical, {
      prompt_title = 'Code Actions',
    }),
    lsp_document_diagnostics = u.merge(opts_vertical, {
      prompt_title = 'Document Diagnostics',
      mappings = default_mappings,
    }),
    lsp_implementations = u.merge(opts_cursor, {
      prompt_title = 'Implementations',
      mappings = default_mappings,
    }),
    lsp_definitions = u.merge(opts_cursor, {
      prompt_title = 'Definitions',
      mappings = default_mappings,
    }),
    lsp_references = u.merge(opts_vertical, {
      prompt_title = 'References',
      mappings = default_mappings,
    }),
    find_files = u.merge(opts_flex, {
      prompt_title = '✨ Find Files ✨',
      mappings = default_mappings,
      hidden = true,
    }),
    diagnostics = u.merge(opts_vertical, {
      mappings = default_mappings,
    }),
    git_files = u.merge(opts_flex, {
      prompt_title = '✨ Search Git Project ✨',
      mappings = default_mappings,
      hidden = true,
    }),
    live_grep = u.merge(opts_flex, {
      prompt_title = '✨ Live Grep ✨',
      mappings = default_mappings,
    }),
    grep_string = u.merge(opts_vertical, {
      prompt_title = '✨ Grep String ✨',
      mappings = default_mappings,
    }),
    terms = u.merge(opts_vertical, {
      prompt_title = '✨ Terminal Buffers ✨',
      mappings = default_mappings,
    }),
  },
}, config.telescope or {}))

require('telescope').load_extension('themes')
require('telescope').load_extension('fzf')
require('telescope').load_extension('terms')
require('telescope').load_extension('projects')
