-- 两个栈实现一个队列

local stack = require("stack")

local queue = {}

function queue.new()
	local inst = {}
	inst.stack_1 = stack.new()
	inst.stack_2 = stack.new()
	setmetatable(inst,{__index=queue})
end

function queue:Size()
	return self.stack_1:Size() + self.stack_2:Size()
end

function queue:IsEmpty()
	return self:Size() == 0
end


function queue:Push(v)
	return self.stack_1.Push(v)
end

function queue:Pop()
	if self.stack_2:IsEmpty() then
		while not self.stack_1:IsEmpty() do
			local v = self.stack_2:Pop()
			self.stack_1:Push(v)
		end
	end
	return self.stack_2:Pop()
end



