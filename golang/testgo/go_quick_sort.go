package main

import "fmt"


func quick_sort(list []int,low,high int){
	if low>=high {
		return
	}

	middle := (low+high)/2
	v := list[middle]
	i:= low
	j:= high
	for ;i<j;{
		if list[i]<list[middle] {
			i++
		}
		if list[j]>list[middle]{
			j--
		}
	}
	list[middle] = v
		
	
	quick_sort(list,low,middle-1)
	quick_sort(list,middle+1,high)

}

func main(){

	list := []int{3,1,5,6,2,9,10,4,88,66,45,90,78}
	quick_sort(list,0,len(list)-1)
	fmt.Println(list)

}