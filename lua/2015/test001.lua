function Say()
	print("hello")

end

function Fib(n)
	if n<=1 then return 1	end
	return Fib(n-1)+Fib(n-2)
end

Say()

print(Fib(6))

print(n)
