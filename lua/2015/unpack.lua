function _unpack(tb)
	local n = table.getn(tb)
	local function func(i)
		if i==n then
			return tb[i]
		end
		return tb[i],func(i+1)
	end
	return func(1)
end

print(_unpack({1,2,3,4,5,6,7,"who are you"}))

tb={_unpack({1,2,3,4,5,6,7,"who are you"})}
print(_unpack(tb))


-- 尾递归实现unpack
function unpack(tb,n,...)
	n = n or table.getn(tb)
	if n==0 then return ... end
	return unpack(tb,n-1,tb[n],...)
end


t = {1,2,3,4,"wen",100}
print(unpack(t))