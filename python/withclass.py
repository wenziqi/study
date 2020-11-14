# -*- encoding=utf-8 -*-
"""
通过装饰器给一个类动态添加成员函数

>>> class Test(object):pass
>>>
>>> @WithClass(Test)
... def __init__(self):
...		self.a = "unknown"
...
>>> @WithClass(Test)
... def SetA(self,v):
...		self.a = v
...
>>> @WithClass(Test)
... def GetA(self):
...		return self.a
...
>>> t = Test()
>>> t.GetA()
'unknown'
>>> t.SetA("hello")
>>> t.GetA()
'hello'
"""


def WithClass(klass):
	def wrap(function):
		setattr(klass,function.__name__,function)
		def f(*args,**kwargs):
			return function(*args,**kwargs)
		return f
	return wrap


__all__ = ["WithClass",]

if __name__ == "__main__":
	import doctest
	doctest.testmod()