
--双端队列


local dqueue = {}

local function node(v) 
	return {value=v,next=nil,pre=nil}
end

function dqueue.new()
	local inst = {}
	inst.head = nil
	inst.tail = nil
	inst.size = 0
	setmetatable(inst,{__index=dqueue})
	return inst
end

function dqueue:Size()
	return self.size 
end

function dqueue:IsEmpty()
	return self:Size() == 0
end

function dqueue:AddFront(v)
	local n = node(v)
	if self.head == nil then
		self.head = n
		self.tail = n
		self.size = self.size + 1
		return
	end
	local t = self.head
	n.next = t
	t.pre = n
	self.head = n
	self.size = self.size + 1
end

function dqueue:PopFront()
	if self.head==nil then
		return
	end
	local t = self.head
	self.head = t.next
	self.size = self.size - 1
	if self.head == nil then
		self.tail = nil
	end
	t.next = nil
	t.pre = nil
	return t.value
end

function dqueue:AddBack(v)
	local n = node(v)
	if self.head == nil then
		self.head = n
		self.tail = n
		self.size = self.size + 1
		return
	end
	local t=self.tail
	t.next = n
	n.pre = t
	self.tail = n
	self.size = self.size + 1

end


function dqueue:PopBack()
	if self.head == nil then
		return
	end
	local t = self.tail
	self.tail = t.pre
	self.tail.next = nil
	t.next = nil
	t.pre = nil
	if self.tail==nil then
		self.head = nil
	end
	self.size = self.size - 1
	return t.value
end


function dqueue:print()
	local t={"dqueue:"}
	local p = self.head
	while p do
		t[#t+1] = tostring(p.value)
		p=p.next
	end
	print(table.concat(t,','))
end



local function test()
	local q = dqueue.new()
	for i = 1,6 do
		q:AddFront(i)
		print("size:",q:Size())
		q:print() 
	end


	for i = 1,6 do
		q:AddBack(i+10)
		print("size:",q:Size())
		q:print() 
	end

	while not q:IsEmpty() do
		print("PopFront ",q:PopFront())
		print("size:",q:Size())
		q:print()
		print("PopBack ",q:PopBack())
		print("size:",q:Size())
		q:print()
	end

	print("size:",q:Size())
	print("IsEmpty:",q:IsEmpty())


end


test()


function dqueue
