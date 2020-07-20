package main
import "fmt"

func main(){
	var s = [...]int{1,2,3,4}
	var s2 = []int{1,2,3,4,5,4}
	fmt.Println(s,s2)

	fmt.Println(cap(s))
	fmt.Println(cap(s2))
}