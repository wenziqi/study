local function sort(array)

	local n = #array
	for i=1,n do
		local pos = i
		for j=i+1,n do
			if array[j]<array[pos] then
				pos = j
			end
		end
		array[i],array[pos] = array[pos],array[i]
	end

end

local function test()

	local arr = {3,1,5,8,9,6,10,7,16,15,0,4}
	sort(arr)
	for _,v in pairs(arr) do print(v) end
end

test()

