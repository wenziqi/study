
local function functor(func,...)

	local args1 = {...}

	return function(...)
			local args2 = {...}
			local args = {}
			for i=1,#args1 do args[#args+1] = args1[i] end
			for i=1,#args2 do args[#args+1] = args2[i] end
			return func(unpack(args))
		end
end


--[[

local function test()

	local function add(a,b)
		local s = a+b
		return s
	end

	local f = functor(add,1)
	print(f(1))
	print(f(2))
	print(f(3))
end

test()

]]--


return {
	functor = functor,
}