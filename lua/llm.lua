local M = {}

local system_prompt =
  'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks'
local helpful_prompt =
  'You are a helpful assistant. What I have sent are my notes so far. You are very curt, yet helpful.'

local function get_visual_selection()
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

function M.run_llm()
  local input
  local is_visual = vim.fn.mode() == 'v' or vim.fn.mode() == 'V'

  if is_visual then
    input = get_visual_selection()
  else
    input = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
  end

  local tmp_file = os.tmpname()
  local f = io.open(tmp_file, 'w')
  if is_visual then
    f:write(system_prompt .. '\n\n' .. input)
  else
    f:write(input)
  end
  f:close()

  local cmd = { 'howdoi', '-v=false', tmp_file }
  local output = {}

  local function on_stdout(_, data)
    if data then
      for _, line in ipairs(data) do
        if line ~= '' then
          table.insert(output, line)
        end
      end
    end
  end

  local function on_exit()
    os.remove(tmp_file)

    vim.schedule(function()
      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      local cursor_line = cursor_pos[1]
      local cursor_col = cursor_pos[2]

      if is_visual then
        local start_line = vim.fn.line "'<" - 1
        local end_line = vim.fn.line "'>"
        vim.api.nvim_buf_set_lines(0, start_line, end_line, false, output)
      else
        vim.api.nvim_buf_set_lines(0, cursor_line - 1, cursor_line - 1, false, output)
      end

      vim.api.nvim_win_set_cursor(0, { cursor_line + #output, cursor_col })
    end)
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_stdout,
    on_stderr = on_stdout,
    on_exit = on_exit,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

vim.api.nvim_create_user_command('LLM', M.run_llm, { range = true })

return M
