package main
import "fmt"


func reverse(lst []int ){
	for i:=0;i<=len(lst)/2;i++{
		var j int = len(lst)-i-1
		lst[i],lst[j]= lst[j],lst[i]
	}
}

func main(){

	lst := [...]int{1,2,3,4,5}
	reverse(lst[:])
	fmt.Println(lst)

}