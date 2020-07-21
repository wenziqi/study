#encoding=utf-8

def ConsoleWorker():
	while 1:
		try:
			exec raw_input("") in locals()
		except Exception,e:
			print(Exception,e)



def Console():
	import threading
	t = threading.Thread(target=ConsoleWorker)
	t.start()


if __name__ == "__main__":
	Console()
