local function concat(list1, list2)
  for _, v in ipairs(list2) do
    table.insert(list1, v)
  end
  return nil
end
local function includes(list, value)
  local _let_1_ = list
  local first = _let_1_[1]
  local rest = (function (t, k, e) local mt = getmetatable(t) if 'table' == type(mt) and mt.__fennelrest then return mt.__fennelrest(t, k) elseif e then local rest = {} for k, v in pairs(t) do if not e[k] then rest[k] = v end end return rest else return {(table.unpack or unpack)(t, k)} end end)(_let_1_, 2)
  return ((first == value) or ((#rest > 0) and includes(rest, value)))
end
local function filter(list, filter_fn)
  local tbl_15_auto = {}
  local i_16_auto = #tbl_15_auto
  for _, v in ipairs(list) do
    local val_17_auto
    if filter_fn(v) then
      val_17_auto = v
    else
      val_17_auto = nil
    end
    if (nil ~= val_17_auto) then
      i_16_auto = (i_16_auto + 1)
      do end (tbl_15_auto)[i_16_auto] = val_17_auto
    else
    end
  end
  return tbl_15_auto
end
local function map(list, map_fn)
  local tbl_15_auto = {}
  local i_16_auto = #tbl_15_auto
  for _, v in ipairs(list) do
    local val_17_auto = map_fn(v)
    if (nil ~= val_17_auto) then
      i_16_auto = (i_16_auto + 1)
      do end (tbl_15_auto)[i_16_auto] = val_17_auto
    else
    end
  end
  return tbl_15_auto
end
local function first(list, filter_fn)
  local matches = filter(list, filter_fn)
  if (#matches > 0) then
    return matches[1]
  else
    return nil
  end
end
local function any(list, filter_fn)
  return (filter(list, filter_fn) > 0)
end
return {any = any, concat = concat, filter = filter, first = first, includes = includes, map = map}