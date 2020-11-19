-- @desc 公式导表为函数，避免load动态加载
-- @date 2020-11-19
-- @auth rocky

local formula_list = {}

--<<formula begin>>
formula_list[1001] = function(env) local _ENV = env return a*b+10 end
formula_list[1002] = function(env) local _ENV = env return math.ceil(lv*3.5+15) end
--<<formula end>>

local function exec(idx,env)
    if not formula_list[idx] then
        return
    end
	env = env or _G
	env.math = math
	return formula_list[idx](env)
end

local function test()
	print(exec(1001,{a=10,b=5}))
	print(exec(1001,{a=20,b=8}))
	print(exec(1002,{lv=20}))
end

test()

return {
	exec = exec
}
