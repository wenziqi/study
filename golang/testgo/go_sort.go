package main
import "fmt"


func select_sort(list []int ) {

	for i:=0;i<len(list);i++ {
		k:= i
		for j:=i+1;j<len(list);j++ {
			if list[j]>list[k] {
				k = j
			}
		}
		list[i],list[k] = list[k],list[i]
	}
}

func main(){

	list := []int{2,6,1,8,9,10,6,7,5,90,45,77,33}
	select_sort(list)
	fmt.Println(list)

}