function permgen(a,n)
	if n == 0 then
		coroutine.yield(a)
	else
		for i=n,1,-1 do
			a[n],a[i]=a[i],a[n]
			permgen(a,n-1)
			a[n],a[i]=a[i],a[n]
		end
	end
end

function printResult(a)
	for i,v in ipairs(a) do
		io.write(v,"	")
	end
	io.write("\n")
end

function perm(a)
	local n = table.getn(a)
	local co = coroutine.create(function () permgen(a,n) end)
	return function()
		local code,res = coroutine.resume(co)
		return res
	end
end

for p in perm({1,2,3,4}) do
	printResult(p)
end


