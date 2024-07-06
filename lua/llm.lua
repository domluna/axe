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

function M.run_llm_normal()
  local input = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
  M.process_llm(input, false)
end

function M.run_llm_visual()
  local input = get_visual_selection()
  M.process_llm(input, true)
end

function M.process_llm(input, is_visual)
  -- Create a temporary file to store the input
  local tmp_file = os.tmpname()
  local f = io.open(tmp_file, 'w')
  if is_visual then
    f:write(system_prompt .. '\n\n' .. input)
  else
    f:write(input)
  end
  f:close()

  -- Run the howdoi command asynchronously
  local cmd = { 'howdoi', '-m', 'haiku', '-v', tmp_file }
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
    -- Remove the temporary file
    os.remove(tmp_file)

    vim.schedule(function()
      if is_visual then
        -- Replace the selected text with the output
        local start_line = vim.fn.line "'<" - 1
        local end_line = vim.fn.line "'>"
        vim.api.nvim_buf_set_lines(0, start_line, end_line, false, output)
      else
        -- Append the output to the end of the buffer
        vim.api.nvim_buf_set_lines(0, -1, -1, false, output)
      end
    end)
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_stdout,
    on_stderr = on_stdout, -- Capture stderr as well
    on_exit = on_exit,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

vim.api.nvim_create_user_command('LLM1', M.run_llm_normal, {})
vim.api.nvim_create_user_command('LLM2', M.run_llm_visual, { range = true })

return M
