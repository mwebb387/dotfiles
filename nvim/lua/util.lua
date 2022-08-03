local function concat(list1, list2)
  for _, v in ipairs(list2) do
    table.insert(list1, v)
  end
  return nil
end
local function includes(list, value)
  local _let_0_ = list
  local first = _let_0_[1]
  local rest = {(table.unpack or unpack)(_let_0_, 2)}
  return ((first == value) or ((#rest > 0) and includes(rest, value)))
end
local function filter(list, filter_fn)
  local tbl_0_ = {}
  for _, v in ipairs(list) do
    local _0_
    if filter_fn(v) then
      _0_ = v
    else
    _0_ = nil
    end
    tbl_0_[(#tbl_0_ + 1)] = _0_
  end
  return tbl_0_
end
local function map(list, map_fn)
  local tbl_0_ = {}
  for _, v in ipairs(list) do
    tbl_0_[(#tbl_0_ + 1)] = map_fn(v)
  end
  return tbl_0_
end
local function first(list, filter_fn)
  local matches = filter(list, filter_fn)
  if (#matches > 0) then
    return matches[1]
  end
end
local function any(list, filter_fn)
  return (filter(list, filter_fn) > 0)
end
return {any = any, concat = concat, filter = filter, first = first, includes = includes, map = map}