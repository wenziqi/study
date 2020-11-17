--栈，双向链表实现

local stack = {}


local function node(v)
	return {value=v,next=nil,pre=nil}
end


function stack.new()
	local inst = {}
	inst.size =0
	inst.tail = nil
	setmetatable(inst,{__index=stack})
	return inst
end

function stack:Size()
	return self.size
end

function stack:IsEmpty()
	return self:Size()==0
end

function stack:Push(v)
	local n = node(v)
	if self.tail==nil then
		self.tail = n
		self.size = self.size + 1
		return
	end
	self.tail.next = n
	n.pre = self.tail
	self.tail = n 
	self.size = self.size + 1 
end

function stack:Pop()
	if self:IsEmpty() then
		return
	end
	local n = self.tail
	self.tail = self.tail.pre
	if self.tail then
		self.tail.next = nil
	end
	n.next = nil
	n.pre = nil
	self.size = self.size - 1 
	if self:IsEmpty() then
		self.tail = nil
	end
	return n.value
end


function stack:print()
	local t = {}
	local p = self.tail
	while p do
		table.insert(t,1,tostring(p.value))
		p = p.pre
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

