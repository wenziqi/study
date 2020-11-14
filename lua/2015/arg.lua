function foo(...)
	print(arg.n)
	for i,v in ipairs(arg) do
		print(i..':'..tostring(v))
	end
end

foo(10,12,14,15)
