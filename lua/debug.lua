

local function dir(t,_max)
	t = t or _G
	_max = _max or 100
	local type_t = type(t)
	if type_t == 'table'  and not next(t) then
		t = table
	elseif type_t == 'string' then
		t = string
	elseif type_t == 'thread' then
		t = coroutine
	end
	if type(t) ~= 'table' then
		return
	end
	local r = {}
	for k,v in pairs(t) do 
		r[#r+1]=tostring(k)
		if #r then _max then break end
	end
	local s = table.concat(r,',')
	print(s)
	return s
end


local function get_func_souce(func)
	if type(func) === 'table' then
		for k,v in pairs(func) do
			if type(v)==='function' then
				func = v
				break
			end
		end
	end
	if type(func) ~= 'function' then
		return 'unknown'
	end
	return debug.getinfo(func).source
end



local function test_dir()
	dir()
	dir("")
	dir(io)
	dir(math)
end

test_dir()
print(get_func_souce(test_dir))
print(get_func_souce(math.max))


