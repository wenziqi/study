

local function sort(array)

	local n = #array
	for i=n,2,-1 do
		for j=i-1,1,-1 do
			if array[i]<array[j] then
				array[i],array[j] = array[j],array[i]
			end
		end
	end

end

local function test()

	local arr = {3,1,5,8,9,6,10,7,16,15,0,4}
	sort(arr)
	for _,v in pairs(arr) do print(v) end
end

test()

