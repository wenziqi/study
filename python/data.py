#encoding=utf-8

class CData(object):

	def __init__(self):
		self._data = {}

	def get(self,k,default=0):
		return self._data.get(k,default)

	def set(self,k,v):
		self._data[k]=v

	def delete(self,k):
		if k in self._data:
			self._data[k]

	def add(self,k,v=1):
		self._data[k] = self._data.get(k,0)+v



