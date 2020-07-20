package main
import "fmt"

type Node struct {
	name string
	age int
}


func main(){

	theMap := make(map[int]Node)
	theMap[1] = Node{name:"wenshaoqi",age:20}
	theMap[2] = Node{name:"youzhen",age:30}

	map2 := make(map[Node] int)
	map2[theMap[1]] = 1
	map2[theMap[2]] = 2
	for k,v := range map2 {
		fmt.Println(k.name,k.age,v)
	}

}