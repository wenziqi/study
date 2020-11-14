require("class")

CPlayer = class("CPlayer")

function CPlayer:ctor(sName)
	print("----------------- ",self,sName)
	self.m_Name=sName
end

function CPlayer:Name()

	return self.m_Name
end

obj=CPlayer("wenshaoqi")
print(obj:Name())


CNpc = class("CNpc",CPlayer)

function CNpc:ctor(sName)
	self.super(self,sName)
	print("------------ ",self,sName)
end

obj2=CNpc("who")
print(obj2:Name())
--print(obj:Name())