

--双向链表,尾插入，一个头指针，一个尾指针


local function node(v)
	local n = {value=v,next=nil,pre=nil}
	setmetatable(n,{
		__tostring=function (tb)
			return "node(value="..tostring(tb.value)..")"
		end,
	})
	return n
end

local list = {}

function list.new()
	local inst = {}
	inst.size = 0
	inst.head = nil
	inst.tail = nil
	setmetatable(inst,{__index=list})
	return inst
end

function list:Size() 
	return self.size
end

function list:IsEmpty()
	return self:Size() == 0
end

function list:Insert(v)
	local n = node(v)
	if self.head == nil then
		self.head = n
		self.tail = n
		self.size = self.size + 1
		return
	end
	local t = self.tail
	t.next = n
	n.pre = t
	self.tail = n
	self.size = self.size + 1
end

function list:Find(v)
	local p = self.head
	while p do
		if p == v or p.value==v then
			return p
		end
		p = p.next
	end
end

-- 有bug?
function list:Remove(v)
	local p = self.head
	local pf = p
	while pf do
		if pf==v or pf.value==v then
			break
		end
		p = pf
		pf=pf.next
	end
	if pf then
		local t = pf.next
		if p then
			p.next = t
		end
		if t then
			t.pre = p
		end
		pf.next = nil
		pf.pre = nil
		if pf==self.head then
			self.head = t
		end
		self.size = self.size - 1
	end
end


function list:Reverse()
	if self.head==nil or self.head.next==nil then
		return
	end
	local p=self.head
	local n,t
	while p do
		t = p          -- t goto next
		p = p.next     -- p goto next
		t.next = n     -- set the node.next point to before n
		t.pre = p
		n = t          -- n goto next
	end
	self.head = t
end


function list:Sort(cmp,reverse)
	cmp = cmp or function(a,b) return a.value>b.value end
	local __cmp = cmp
	if reverse then
		__cmp = function(a,b) return not cmp(a,b) end
	end

	local i=self.head
	while i do
		local j = i.next
		while j do
			if __cmp(i,j) then 
				i.value,j.value = j.value,i.value
			end
			j = j.next
		end
		i=i.next
	end
end

function list:Print()
	local t = {}
	local p = self.head
	while p do 
		table.insert(t,tostring(p.value))
		p=p.next
	end
	print("list:",table.concat(t,","))

end

function list:Clear()
	local p = self.head
	self.size = 0
	self.head = nil
	while p do
		local t = p.next
		p=p.next
		if t then
			t.next = nil
			t.pre = nil
		end
	end
end


--[[
local function test()
	local l = list.new()
	l:Insert(1)
	l:Insert(2)
	l:Insert(133)
	print("size:",l:Size())
	l:Print()
	l:Reverse()
	l:Print()

	print(l:Find(2))
	print(l:Find(133))
	l:Remove(133)
	l:Print()
	l:Remove(2)
	l:Remove(1)
	print("size:",l:Size())
	l:Print()
	l:Sort()

end

test()

]]--



return list
