package main
import "fmt"

func max(list []int ) int {
	if len(list) == 0 {
		return 0
	}
	s := list[0]
	for _,v := range list{
		if v>s {
			s = v
		}
	}
	return s
}

func main(){
	list := []int{1,3,4,9,100,89,7}
	fmt.Println(max(list[:]))

}