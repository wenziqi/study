-- @date 2020-11-18
-- @auth rocky

-- local tableEx = table or {}
local tableEx = {}

local type = type

function tableEx.isArray(t)
	if type(t) ~= 'table' then
		return false
	end
	local n = #t
	for i,v in pairs(t) do
		if type(i) ~= 'number' then
			return false
		end
		if i<1 or i>n then
			return false
		end
	end
	return true
end


tableEx.getn = table.getn or 
	function (t)
		local n = 0
		for i,v in pairs(t) do
			n = n + 1
		end 
		return n
	end


function tableEx.keys(t)
	local ks = {}
	for k,v in pairs(t) do 
		ks[#ks+1] = k
	end
	return ks 
end

function tableEx.values(t)
	local vs = {}
	for k,v in pairs(t) do
		vs[#vs+1] = v
	end
	return vs
end

function tableEx.hasKey(t,k)
	return t[k] ~= nil
end

function tableEx.max(t)
	local _max
	for i,v in pairs(t) do
		if not _max or v>_max then
			_max = v
		end
	end
	return _max
end

function tableEx.min(t)
	local _min
	for i,v in pairs(t) do
		if not _min or v<_min then
			_min = v
		end
	end
	return _min
end


function tableEx.copy(t)
	local cp = {}
	for k,v in pairs(t) do
		cp[k]=v
	end
	return cp
end

function tableEx.deepcopy(t)
	local cp = {}
	for k,v in pairs(t) do
		if type(v)=='table' then
			cp[k] = tableEx.copy(v)
		else
			cp[k] = v
		end
	end
	return cp
end


function tableEx.filter(t,funcK,funcV,cond) 
	local p = {}
	cond = cond or 'and'
	for k,v in pairs(t) do
		local bk = funcK and funcK(k) or true
		local bv = funcV and funcV(v) or true
		if cond == 'and' then
			if bk and bv then
				p[k] = v
			end
		else
			if bk or bv then
				p[k] = v
			end
		end
	end
	return p
end

function tableEx.isAll(t,func)
	for _,v in pairs(t) do
		if func and not func(v) then
			return false
		end
	end
	return true
end

function tableEx.isAny(t,func)
	for _,v in pairs(t) do
		if func and func(v) then
			return true
		end
	end
	return false
end

function tableEx.iterKeys(t,func)
	for k,v in pairs(t) do
		if func then
			func(k)
		end
	end
end

function tableEx.iterValues(t,func)
	for k,v in pairs(t) do
		if func then
			func(v)
		end
	end
end


function tableEx.iterItems(t,func)
	for k,v in pairs(t) do
		if func then
			func(k,v)
		end
	end
end

local function  test()
	print(table.concat(tableEx.keys(tableEx),','))
	print(tableEx.max({1,4,6,3,5,10,89}))
	print(tableEx.min({1,4,6,3,5,10,89}))

	local t = {1,4,6,3,5,10,89}
	print(tableEx.isAny(t,function(v) return v%2==0 end))
	print(tableEx.isAll(t,function(v) return v%2==0 end))
	print(tableEx.isArray(t))

	tableEx.iterKeys(t,function(k) print("key:",k) end)
	tableEx.iterValues(t,function(v) print("value:",v) end)
	tableEx.iterItems(t,function(k,v) print("k-v:",k,v) end)

	print(tableEx.hasKey({name='rocky'},'name'))
	print(table.concat(tableEx.values(t),','))
end

test()


return tableEx


