-- 尾递归 fibonacci

function fib(n,r1,r2)
	r1 = r1 or 1
	r2 = r2 or 1
	if n > 1 then
		return fib(n-1,r2,r1+r2) 
	end
	return r1
end

print(fib(10))