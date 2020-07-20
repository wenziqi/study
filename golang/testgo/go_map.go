package main
import "fmt"

func main(){
	// var m map[string]int = map[string]int {"age":20} 
	var m map[string]int = map[string]int {} 
	m["month"] = 12
	fmt.Println(m)
	fmt.Println(m["age"])   //居然不报错,0

	m2:=make(map[string]string)
	m2["name"] = "youzhen"
	fmt.Println(m2)
	fmt.Println(m2["name"])
	fmt.Println(m2["name2"])

	fmt.Println(len("name"))
	fmt.Println(len("中国人"))

}