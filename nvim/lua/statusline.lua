local function highlight(hl)
  return ("%#" .. hl .. "#")
end
local function buffer_number()
  return "%n"
end
local function buffer_lines()
  return "%L"
end
local function filename_relative()
  return "%f"
end
local function filename_full()
  return "%F"
end
local function filename_tail()
  return "%t"
end
local function filetype()
  return "%y"
end
local function eval(str)
  return ("%{" .. str .. "}")
end
local function format(str)
  return ("%{%" .. str .. "%}")
end
local function flag_preview()
  return "%w"
end
local function flag_modified()
  return "%M"
end
local function flag_quickfix()
  return "%q"
end
local function flag_readonly()
  return "%R"
end
local function current_column()
  return "%c"
end
local function current_line()
  return "%l"
end
local function current_percent()
  return "%p"
end
local function visible_percent()
  return "%P"
end
local function separator()
  return "%="
end
local function truncate()
  return "%<"
end
local function highlight_group(hl, grp)
  return (highlight(hl) .. "%(" .. grp .. "%)")
end
return {buffer_lines = buffer_lines, buffer_number = buffer_number, current_column = current_column, current_line = current_line, current_percent = current_percent, eval = eval, filename_full = filename_full, filename_relative = filename_relative, filename_tail = filename_tail, filetype = filetype, flag_modified = flag_modified, flag_preview = flag_preview, flag_quickfix = flag_quickfix, flag_readonly = flag_readonly, format = format, highlight = highlight, highlight_group = highlight_group, separator = separator, truncate = truncate, visible_percent = visible_percent}