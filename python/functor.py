# -*- encoding=utf-8 -*-



class Functor(object):
    '''
    >>> def foo(something):print something
    >>> f=Functor(foo,'say hello')
    >>> f()
    say hello
    '''
    def __init__(self,func,*args):
        self.func=func
        self.args=args
    
    def __call__(self,*args):
        ret = self.func(*(self.args+args))
        return ret


if __name__ == '__main__':
    import doctest
    doctest.testmod()
