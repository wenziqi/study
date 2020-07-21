package main

import "fmt"
import "math/rand"
import "time"


func randint(start,end int) int {
	if start > end {
		start,end = end,start
	}
	seed := time.Now().UnixNano()
	theRand := rand.New(rand.NewSource(seed))
	i := theRand.Int()%(end-start)+start
	return i
}


func shufflelist(list []int){
	size := len(list)
	for i:=0;i<=2*size;i++ {
		j,k := randint(0,size),randint(0,size)
		if j!=k {
			list[j],list[k] = list[k],list[j]
		}
	}
}


func main(){
	fmt.Println(randint(10,110))

	list:=[]int{1,2,3,4,5,6,7,8,9,10}
	shufflelist(list)
	fmt.Println(list)
}