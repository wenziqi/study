function eval(str,var)
	var = var or {}
	local f=loadstring("return " .. str)
	setmetatable(var, {__index = _G})
	setfenv(f,var)	--修改f的作用域为var
	return f()
end


b=100
print(b)
str="print(b+1)"
eval(str,{b=13})
print(b)

f=loadstring("a+b*c+100")


print(eval("a+b*c+100",{a=1,b=100,c=3}))

