-- DEFAULT USER SETTINGS
local ok, user_config = pcall(require, 'cosmic.config.config')

if not ok then
  user_config = {}
end

local default_config = {
  border = 'rounded',
  disable_builtin_plugins = {},
  add_plugins = {},
  -- theme = 'nightfox',
  lsp = {
    format_on_save = false, -- true/false or table of filetypes {'.ts', '.js',}
    rename_notification = true,
    servers = {
      jsonls = {
        format = true,
      },
      pylsp = true,
      sumneko_lua = {
        format = true,
      },
      html = true,
      tsserver = {
        format = true,
      },
      clangd = true,
    },
  },
}

local u = require('cosmic.utils')
local config = u.merge(default_config, user_config)
local user_servers = vim.tbl_keys(config.lsp.servers)

function config.lsp.can_client_format(client_name)
  if config.lsp.servers[client_name] == true then
    return true
  end

  if vim.tbl_contains(user_servers, client_name) and config.lsp.servers[client_name] then
    return (config.lsp.servers[client_name].format == true)
  end

  return true
end

return config
