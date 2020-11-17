-- 有序链表

local function node(v)
	return {value=v,next=nil}
end


local list = {}

function list.new(cmp)
	local inst = {}
	inst.head = nil
	inst.size = 0
	inst.cmp = cmp or function(a,b) return a.value<b.value end
	setmetatable(inst,{__index=list})
	return inst
end


function list:Size()
	return self.size
end

function list:IsEmpty()
	return self:Size() == 0
end


-- 插入，保证有序
function list:Insert(v)
	local n = node(v)
	if self.head == nil then
		self.head = n
		self.size = self.size + 1
		return
	end
	local p = self.head
	local b
	while p do
		if self.cmp(n,p) then
			break
		end 
		b = p
		p = p.next
	end
	if b==nil then
		n.next = p
		self.head = n
	else
		b.next = n 
		n.next = p
	end
	self.size = self.size + 1
end



function list:Find(v)
	local p = self.head
	while p do
		if p==v or p.value == v then
			return true
		end
		p=p.next
	end
	return false
end


function list:Remove(v)
	local p = self.head
	local b
	while p do
		if p==v or p.value==v then
			break
		end 
		b = p
		p=p.next
	end
	if p then
		local t = p.next
		if b then
			b.next = t
		end
		if p == self.head then
			self.head = t
		end
		p.next = nil
		self.size = self.size - 1
		return true
	end
	return false
end

function list:print()
	local t = {}
	local p = self.head
	while p do
		t[#t+1] = tostring(p.value)
		p=p.next
	end
	print("order list:",table.concat(t,','))
end


function list:Clear()
	local p = self.head
	while p do
		local t = p
		p=p.next
		t.next = nil
	end
	self.size = 0
	self.head = nil
end



local function test()

	-- math.randomseed(os.time())
	-- local l = list.new()
	-- local count = 15
	-- for i=1,count do 
	-- 	local n = math.random(200)
	-- 	print(n)
	-- 	l:Insert(n)
	-- end
	-- l:print()

	local arr = {41,80,61,73,110,78,35,68,81,82,136,186,147,150,125,}
	local l = list.new()
	for _,v in pairs(arr) do
		l:Insert(v)
	end

	l:print()

	print(l:Find(73))
	print(l:Find(83))
	print(l:Find(82))
	print(l:Find(81))
	print(l:Remove(150))
	print(l:Remove(1508))
	l:print()

	l:Clear()
	l:print()

end

test()


return list

