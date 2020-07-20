package main
import "fmt"


func a_sum(array []int ) int {
	s:=0
	for _,v := range array {
		s += v
	}
	return s
}

func main(){
	var a [100]int ;
	for i:=0;i<len(a);i++{
		a[i] = i
	}

	fmt.Println(len(a))

	var sa [10]string = [10]string{"hello","world"}
	for i:=0;i<len(sa);i++ {
		fmt.Println(sa[i])
	}
	fmt.Println(len(sa))

	q:=[...]int{1,2,3,4}   //数组？
	for k,v := range q{
		fmt.Println(k,v)
	}

	fmt.Println(a_sum(q[:]))
	fmt.Println(a_sum(q[:2]))
	fmt.Println(a_sum(q[1:]))


	fmt.Println(q)   

    q2 := []int{1,2,3,4,6}  //slice 切片
	fmt.Println(a_sum(q2))
}