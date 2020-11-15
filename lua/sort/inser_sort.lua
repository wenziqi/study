
local function sort_insert(array)

	local n = #array
	for i=2,n do
		local pos = 1
		for j=i-1,1,-1 do
			if array[j] < array[i] then
				pos = j + 1
				break
			end
		end

		local t = array[i]
		for k=i,pos+1,-1 do
			array[k] = array[k-1]
		end
		array[pos] = t
	end
end



local function test()

	local arr = {3,1,5,8,9,6,10,7,16,15,0,4}
	sort_insert(arr)
	for _,v in pairs(arr) do print(v) end
end

test()

