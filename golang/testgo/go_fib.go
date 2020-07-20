package main
import "fmt"

func fib(n int ) int {
	if n <= 2{
		return 1
	}
	return fib(n-1)+fib(n-2)
}

func sum(start int,end int ) int {
	var s int =0
	for i:=start;i<=end;i++{
		s += i
	}
	return s
}

func main(){

	for i:=1;i<=10;i++{
	    var s = fib(i)
	    //fmt.Println(s)
	    fmt.Println(s,sum(1,i))

	}
}