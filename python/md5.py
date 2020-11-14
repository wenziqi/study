# -*- encoding=utf-8 -*-



def MD5(src):
	import hashlib
	mhash = hashlib.md5()
	mhash.update(src)
	return mhash.hexdigest().upper()


