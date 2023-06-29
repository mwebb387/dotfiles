local previewOpts = {
	bat = {
		color = "always",
		style = "changes",
		theme = "Coldark-Dark",
		["map-syntax"] = "*fnl:Lisp"
	},
	type = { }
}
local bindOpts = {
	["ctrl-d"] = "preview-half-page-down",
	["ctrl-u"] = "preview-half-page-up"
}
local fzfPlugOpts = {
	sink = "e",
	options = ""
}
local bindOptsToString
bindOptsToString = function(opts)
	return table.concat((function()
		local _accum_0 = { }
		local _len_0 = 1
		for key, val in pairs(opts) do
			_accum_0[_len_0] = tostring(key) .. ":" .. tostring(val)
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(), ",")
end
local previewOptsToString
previewOptsToString = function(opts)
	return table.concat((function()
		local _accum_0 = { }
		local _len_0 = 1
		for key, val in pairs(opts) do
			_accum_0[_len_0] = "--" .. tostring(key) .. " " .. tostring(val)
			_len_0 = _len_0 + 1
		end
		return _accum_0
	end)(), " ")
end
local createFzfOpts
createFzfOpts = function()
	return {
		"--preview",
		"bat " .. tostring(previewOptsToString(previewOpts.bat)) .. " {}",
		"--bind",
		bindOptsToString(bindOpts)
	}
end
-- print(table.concat(createFzfOpts(), " "))
return {
	create_opts = createFzfOpts
}
