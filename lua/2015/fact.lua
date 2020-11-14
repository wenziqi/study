function fact (n)
	if n==0 then
		return 1
	else
		return n * fact(n-1)
	end
end

-- 尾递归
function fact2(n,r)
	r = r or 1
	if n > 1 then
		return fact2(n-1,r*n)
	end
	return r
end

a=5
print(fact(a))
print(fact2(a))