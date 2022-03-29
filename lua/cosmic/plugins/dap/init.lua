local dap = require("dap")
local breakpoint = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    }
local breakpoint_rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    }
local stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    }
local config = {
  host = "127.0.0.1",
  port = "8787",
}

dap.adapters.codelldb = function(callback)
-- specify in your configuration host = your_host , port = your_port
    callback({ type = "server", host = config.host, port = config.port })
end

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}

dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
vim.fn.sign_define("DapBreakpoint", breakpoint)
vim.fn.sign_define("DapBreakpointRejected", breakpoint_rejected)
vim.fn.sign_define("DapStopped", stopped)
