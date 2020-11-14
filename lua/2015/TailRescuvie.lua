-- 尾递归 1+2+3+...+n
function sum(n,r)
	r = r or 0
	if n > 0 then return sum(n-1,r+n) end
	return r
end

s=10
n=100
print(sum(n))


-- 尾递归 tb[1]+tb[2]+...tb[n]
function table.sum(tb,r,i)
	i = i or 1
	r = r or 0
	if tb[i] then 
		return table.sum(tb,r+tb[i],i+1)
	else 
		return r
	end
end

print(table.sum({1,2,3,4,100}))