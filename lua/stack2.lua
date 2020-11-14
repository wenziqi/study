-- 栈，数组实现

local stack = {}


function stack.new()
	local inst = {}
	inst.top = 0
	inst.array = {}
	setmetatable(inst,{__index=stack})
	return inst
end

function stack:Size()
	return self.top
end

function stack:IsEmpty()
	return self:Size()==0
end

function stack:Push(v)
	local t = self.top + 1
	self.array[t] = v
	self.top = t
	return self.top
end


function stack:Pop()
	if self:IsEmpty() then
		return
	end
	local v = self.array[self.top]
	self.array[self.top] = nil
	self.top = self.top - 1
	return v
end



function stack:print()
	local t = {}
	for i=1,self.top do
		t[#t+1] = tostring(self.array[i])
	end
	print("stack:",table.concat(t,","))
end


function stack:clear()
	while not self:IsEmpty() do
		self:Pop()
	end
end

--[[

stack = require("stack")

local function test()
	local s = stack.new()
	print(s:Size())
	print(s:IsEmpty())
	for i = 1,5 do
		s:Push(i)
	end
	s:print()

	print(s:Pop())
	print("size:",s:Size())
	s:print()
	s:clear()
end

test()

]]--

--[[
0
true
stack:	1,2,3,4,5
5
size:	4
stack:	1,2,3,4

]]--


return stack

