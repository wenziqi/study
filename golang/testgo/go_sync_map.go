package main
import "fmt"
import "sync"

func main(){
	var theMap sync.Map
	theMap.Store("age",20)
	theMap.Store("name","youzhen")
	theMap.Store(1,100)

	theMap.Delete(1)


	fmt.Println(theMap)
}