-- @ver lua 5.2,5.3,5.4
-- @desc 项目里大量用了公式计算，每次都是用load函数来加载，没做缓存。故优化之。
-- @date 2020-11-17
-- @另一种优化思路是，策划填的公式直接导出未函数，格式如_template所示，服务器启动就加载了这个函数。之前的公司项目就是这么做的。


local string = string
local _cache = {}
local _template = [[
local function __eval(env)
	local _ENV = env
	return %s
end
return __eval
]]

local function eval(formula,env)
	local chunk = _cache[formula]
	if not chunk then
		chunk = load(string.format(_template,formula),"eval","bt")
		_cache[formula] = chunk
	end
	return chunk()(env)
end


local function eval2(formula,env)
	return load("return ".. formula,"eval","bt",env)()
end

local function test(n)
	--[[
	eval	0.069091
	eval2	0.478332
	]]--

	n = n or 10*10000
	local t0 = os.clock()
	for i=1,n do
		eval("a+b",{a=1,b=2})
	end
	print("eval",os.clock()-t0)

	local t0 = os.clock()
	for i=1,n do
		eval2("a+b",{a=1,b=2})
	end
	print("eval2",os.clock()-t0)
end


test()


local formula = {
	eval = eval,
}

print(eval('a+b',{a=1,b=2}))
print(eval2('a+b',{a=1,b=2}))
print(eval('a*b',{a=1,b=2}))
print(eval('a*b+c',{a=1,b=2,c=10}))

return formula

