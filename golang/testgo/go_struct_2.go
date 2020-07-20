package main
import "fmt"


type Student struct {
	name string
	age int
	sex int
}

func (st *Student) getName() string {
	return st.name
}

func main() {

	var s = new(Student)
	s.name = "wenshaoqi"
	s.age = 30
	s.sex = 1
	fmt.Println(s.getName())
	
}