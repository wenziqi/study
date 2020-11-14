function SortPairs(tb,func)
	local tmp={}
	for k,v in pairs(tb) do
		table.insert(tmp,{k,v})
	end
	func = func or function (a,b) return a[1]<b[1] end
	table.sort(tmp,func)

	local i = 0
	local n = table.getn(tmp)
	return function () 
		i = i+1
		if i<=n then
			return tmp[i][1],tmp[i][2]
		end
	end
end

a={[1]=1,[2]=2,[3]=3,[4]=4}

for k,v in pairs(a) do print(k,v) end
print("------------------------------")

for k,v in SortPairs(a) do print(k,v) end