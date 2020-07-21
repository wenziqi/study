#encoding=utf-8


class Functor():
	
	def __init__(self,func,*args):
		self._func = func
		self._args = args

	def __call__(self,*args):
		self._func(*(self._args+args))



if __name__ == "__main__":
	
	def Say(msg):
		print(msg)

	func = Functor(Say,"hello")
	func()
