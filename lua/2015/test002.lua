tableA = {1,2,3,}
tableB = {1,2,3}

if tableA == tableB then	--���Ƚϱ��������ֵ��ֻ�Ƚ�����������ã�tableA��tableB��������ͬ�Ķ���
	print("they are the same")

else
	print("they are not the same")
end

print("")


function Sum(n)
	local s=0
	for index = 1,n,2 do
		s = s + index
	end
	print(s)
end


Sum(100)

print(type(Sum))

