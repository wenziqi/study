package main

import "fmt"


func quick_sort(list []int,low,high int){
	if low>high {
		return
	}

	middle := (low+high)/2
	v := list[middle]
	i,j:= low,high
	for ;i<j;{
		for ;i<middle && list[i]<=list[middle]; {
			i++
		}
		if i<middle {		
			list[middle],list[i] = list[i],list[middle]
			middle = i
		}
		for ;middle<j && list[j]>=list[middle]; {
			j--
		}
		if j>middle {
			list[middle],list[j] = list[j],list[middle]
			middle = j
		}
	}
	list[middle] = v
	
	quick_sort(list,low,middle-1)
	quick_sort(list,middle+1,high)

}

func main(){

	fmt.Println("start....")
	list := []int{3,1,5,6,2,9,10,4,88,66,45,90,78,10}
	quick_sort(list,0,len(list)-1)
	fmt.Println(list)

}