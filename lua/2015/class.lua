--支持不了继承？
function class(classname,super)
	local superType = type(super)
	local c = {}
	
	if superType ~= "function" and superType ~= "table" then
        superType = nil
        super = nil
 
    elseif superType == 'table' then
    -- our new class is a shallow copy of the base class!
        for i,v in pairs(super) do
            c[i] = v
        end
        c.super = super
    end
	
	if super then
		setmetatable(c, {__index = super})
		c.super = super
	else
		c = {ctor = function() end}
	end
	
	c.__index = c
	
	local mt={}
	
	mt.__call = function(class_tbl, ...)
		local obj = {}
		setmetatable(obj,c)
		if c.ctor then
		   c.ctor(obj,...)
		end
		return obj
    end
	setmetatable(c, mt)
	
	return c
end