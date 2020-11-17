
-- 队列，双向链表实现


local function node(v)
	return {value=v,next=nil,pre=nil}
end

local queue = {}

function queue.new()
	local inst = {}
	inst.size = 0
	inst.head = nil
	inst.tail = nil
	setmetatable(inst,{__index=queue})
	return inst
end


function queue:Size()
	return self.size
end

function queue:IsEmpty()
	return self:Size() == 0
end

function queue:Push(v)
	local n = node(v)
	if self.head==nil then
		self.head = n
		self.tail = self.head
		self.size = self.size + 1
		return
	end
	self.tail.next = n 
	n.pre = self.tail
	self.tail = n
	self.size = self.size + 1
end

function queue:Pop()
	if self:IsEmpty() then
		return
	end
	local n = self.head
	self.head = n.next
	if self.head then
		self.head.pre = nil
	end
	n.next = nil
	n.pre = nil
	self.size = self.size - 1
	if self:IsEmpty() then
		self.head = nil
		self.tail = nil
	end
	return n.value
end

function queue:clear()
	while not self:IsEmpty() do
		self:Pop()
	end
end

function queue:print()
	local t = {}
	local p = self.head
	while p do
		table.insert(t,tostring(p.value))
		p = p.next
	end
	print("queue:",table.concat(t,","))
end


--[[

queue = require("queue")

local function test()
	local s = queue.new()
	print(s:Size())
	print(s:IsEmpty())
	for i = 1,5 do
		s:Push(i)
		s:print()
	end
	s:print()

	print(s:Pop())
	print("size:",s:Size())
	s:print()
	s:clear()
	print("size:",s:Size())
end

test()
]]--


return queue

