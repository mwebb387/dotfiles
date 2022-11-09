local M = {}

function M.make(arg)
  local lines = {""}
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)

  local makeprg = vim.api.nvim_buf_get_option(bufnr, "makeprg")
  if not makeprg then return end

  local cmd = vim.fn.expandcmd(makeprg .. ' ' .. arg)

  local function on_event(job_id, data, event)
    if event == "stdout" or event == "stderr" then
      if data then
        vim.list_extend(lines, data)
      end
    end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = cmd,
        lines = lines,
        efm = vim.api.nvim_buf_get_option(bufnr, "errorformat")
      })
      vim.api.nvim_command("doautocmd QuickFixCmdPost")
    end
  end

  local job_id =
    vim.fn.jobstart(
    cmd,
    {
      on_stderr = on_event,
      on_stdout = on_event,
      on_exit = on_event,
      stdout_buffered = true,
      stderr_buffered = true,
    }
  )
end

function M.grep(arg)
  local lines = {""}
  -- local winnr = vim.fn.win_getid()
  -- local bufnr = vim.api.nvim_win_get_buf(winnr)

  local grepprg = vim.o.grepprg
  if not grepprg then
    print'No grepprg'
    return
  end

  local cmd = vim.fn.expandcmd(grepprg .. ' ' .. arg)
  print('Cmd: ' .. cmd)

  local function on_event(job_id, data, event)
    print('Event: ' .. vim.inspect(event))
    print('Data: ' .. vim.inspect(data))
    if event == "stdout" or event == "stderr" then
      if data then
        vim.list_extend(lines, data)
      end
    end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = cmd,
        lines = lines,
        efm = vim.o.grepformat
      })
      vim.api.nvim_command('copen')
      vim.api.nvim_command("doautocmd QuickFixCmdPost")
    end
  end

  local job_id = vim.fn.jobstart(
    cmd,
    {
      on_stderr = on_event,
      on_stdout = on_event,
      on_exit = on_event,
      stdout_buffered = true,
      stderr_buffered = true,
    }
  )
  print('Job ID: ' .. job_id)
end

M.grep('conf')

return M
