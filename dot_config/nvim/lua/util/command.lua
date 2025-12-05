local M = {}

function M.ExecuteCommand(command)
  if command == nil then
    return nil, "Command is nil"
  end

  local result = vim.system(command):wait()
  if result.code ~= 0 then
    return nil, "Failed to execute command"
  end

  return string.gsub(result.stdout, "\n$", "")
end

return M
