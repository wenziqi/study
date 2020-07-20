package main
import "fmt"

func main() {
	var a []int;
	a = append(a,1)
	a = append(a,2,3,4)
	a = append(a,[]int{5,6,7,8,9}...)
	fmt.Println(a)
	fmt.Println(len(a))
	fmt.Println(cap(a))

	var s = make([]int,10)
	s[1]=10
	
	fmt.Println(s)
}