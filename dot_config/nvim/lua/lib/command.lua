local M = {}

function M.ExecuteCommand(command)
  if command == nil then
    return nil, "Command is nil"
  end

  local result = vim.system(command):wait()
  if result.code ~= 0 then
    local cmd_str = type(command) == "table" and table.concat(command, " ") or command
    local error_msg = string.format(
      "Command failed (exit code %d): %s\nstderr: %s",
      result.code,
      cmd_str,
      result.stderr or ""
    )
    return nil, error_msg
  end

  return string.gsub(result.stdout, "\n$", "")
end

return M
