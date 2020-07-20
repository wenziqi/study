package main
import "fmt"


func Fibbonacci(n int ) int {
	return fib(n,1,1)
}

func fib(n int,a int,b int ) int {
	if n<=2 {
		return b
	}
	return fib(n-1,b,a+b)

}

func main(){

    for i:=1;i<=10;i++{
    	fmt.Println(Fibbonacci(i))
    }

}