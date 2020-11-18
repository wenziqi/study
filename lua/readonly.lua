-- @ver Lua 5.2
-- @date 2020-11-18
-- @desc 只读table,不可修改，不可增加
-- @auth rocky

local function readonly(t)
	local tmp = {}
	for k,v in pairs(t) do
		tmp[k] = v
		t[k] = nil
	end

	setmetatable(t,{
		__index = function(tb,k) return tmp[k] end,
		__newindex = function(tb,k,v) end
	})
	return t 
end



local function test()
	local const = readonly({name='rocky',age=20})
	print(const.name,const.age)                    -- rocky	20
	const.name = 'kitto'
	const.age='25'
	const.sex =  1
	print(const.name,const.age,const.sex)          -- rocky	20	nil
end


test()

return {
	readonly = readonly,
}
