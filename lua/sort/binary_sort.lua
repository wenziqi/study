
-- 二分插入排序
local function sort_binary(array)

	local n=#array
	for i=2,n do

		local s = 1
		local e = i-1
		local m = (s+e)//2

		while s<=e do   --等号非常重要
			if array[m]<array[i] then
				s=m+1
			else
				e=m-1
			end
			m = (s+e)//2
		end

		local pos = s 
		local v = array[i]
		for k=i,pos+1,-1 do
			array[k] = array[k-1] 
		end
		array[pos] = v

		--print(table.concat(array,',',1,i))

	end
	
end


local function test()

	local arr = {3,1,5,8,9,6,10,7,16,15,0,4}
	sort_binary(arr)
	for _,v in pairs(arr) do print(v) end
end

test()




