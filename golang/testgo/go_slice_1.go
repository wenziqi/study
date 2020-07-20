package main
import "fmt"

func main() {

	var s = make([]int,10)
	var ss = &s
	s[1]=10
	s=append(s,2)
	
	fmt.Println(s)
	fmt.Println(ss)
	fmt.Println(len(s))
	fmt.Println(len(*ss))

	for i,v := range s {
		fmt.Println(i,v)
	}

	// for i,v := range *ss {  // same as before
	// 	fmt.Println(i,v)
	// }
}