
function class (name,super) -- 
	super = super or function() end

	local cls = {}
	_G[name] = cls
	cls.__name__ = name
	cls.__new__ = 
		function(cls,...) 
			local self = {}
			setmetatable(self,{__index=cls})
			self.super=cls
			self:__init__(...)
			return self
		end
	cls.__init__ = function (...) end
	cls.new = cls.__new__

	setmetatable(cls,{__call=cls.__new__,__index=super})

	local setmethod =
		function (name,func)
			cls[name] = 
				function (self,...)
					local old_self = _ENV["self"]
					_ENV["self"] = self
					local ret = func(...) 
					_ENV["self"] = old_self
					return ret
				end
		end


	local copyattr = 
		function (args)
			for _,v in pairs(args) do
				local name,value = v.name,v.value
				if type(value) == 'table'  and type(value[1])=='function' then
					setmethod(name,value[1])
				else
					cls[name] = attv
				end
			end
		end--function copyattr

	return 
		function (args)
			copyattr(args)
			return cls
		end
end


function def(name)
	assert(type(name)=='string','attr or method name must be a string')
	local t = {}
	return 
		function (value)
			t.name = name
			t.value = value
			return t
		end
end



------------------------------------------

class "CPerson"  {

	def "m_Name" ("test");


	def "__init__" {
		function(name,age)
			self.m_Name = name
			self.m_Age = age 
		end
	};


	def "getName" {
		function () 
			return self.m_Name 
		end
	};


	def "setName" {
		function (name) 
			self.m_Name = name 
		end
	};

	def "getAge" {
		function () 
			return self.m_Age 
		end
	};

}

local p = CPerson('rocky',30)
print(p:getName())
print(p:getAge())
p:setName("new name")
print(p:getName())




