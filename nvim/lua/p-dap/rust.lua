local dap = require('dap')

dap.adapters.rust = {
  type = 'executable',
  attach = {pidProperty = "pid", pidSelect = "ask"},
  command = 'lldb-vscode',
  env = {LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"},
  name = "lldb"
}

local M = {}
local last_gdb_config

M.start_rust_debugger = function(args, mi_mode, mi_debugger_path)
  if args and #args > 0 then
    last_gdb_config = {
      type = "rust",
      name = args[1],
      request = "launch",
      program = table.remove(args, 1),
      args = args,
      cwd = vim.fn.getcwd(),
      env = function()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
      end,
      externalConsole = true,
      MIMode = mi_mode or "gdb",
      MIDebuggerPath = mi_debugger_path
    }
  end

  if not last_gdb_config then
    print('No binary to debug set! Use ":DebugRust <binary> <args>"')
    return
  end

  dap.run(last_gdb_config)
end

return M
