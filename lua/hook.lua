
local _info = {}

local function hook(event)
	if event ~= "call" then
		return
	end
	local inf = debug.getinfo(2,"fnS")
	local func = inf.func
	if not _info[func] then
		_info[func] = {count=0}
	end

	_info[func].count = _info[func].count + 1
	_info[func].name = inf.name
	_info[func].source = inf.source

end


local function start()
	debug.sethook(hook,"c")
end

local function stop()
	debug.sethook()
end

local function output()

	local _max = 150
	local t = {}
	for func,info in pairs(_info) do
		t[#t+1] = {func,info.name,info.count,info.source}
	end
	table.sort(t,function(a,b) return a[3]>b[3] end)

	for i=1,_max do
		if not t[i] then
			break
		end
		print(t[i][1],t[i][2],t[i][3],t[i][4])
	end

end

--[[
local function test()
	local function add(a,b)
		return a+b
	end

	start()
	for i=1,10 do
		print(add(i,5))
	end
	stop()
	output()
end

test()
]]


--[[
function: 0x418ce0	print	10	=[C]
function: 0x418840	nil	10	=[C]
function: 0x2203e30	add	10	@/usercode/file.lua
function: 0x2203350	stop	1	@/usercode/file.lua
function: 0x41a850	sethook	1	=[C]
]]--


return {
	start = start,
	stop=stop,
	output = output,
}
