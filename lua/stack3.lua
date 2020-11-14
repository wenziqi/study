--两个队列实现栈

local queue = requie("queue")

local stack = {}

function stack.new()
	local inst = {}
	inst.queue_1 = queue.new()
	inst.queue_2 = queue.new()
	setmetatable(inst,{__index=stack})
	return inst
end

function stack:Size()
	return self.queue_1:Size() + self.queue_2:Size()
end

function stack:IsEmpty()
	return self:Size() == 0
end

function stack:Push(v)
	local q = self.queue_1
	if q:IsEmpty() then
		q = self.queue_2
	end
	return q:Push(v)
end

function stack:Pop()
	local q=self.queue_1
	local t=self.queue_2
	if not q:IsEmpty() then
		q=self.queue_2
		t=self.queue_1
	end
	while not q:IsEmpty() then
		local v = q:Pop()
		if q:IsEmpty() then
			return v
		end
		t:Push(v)
	end
end