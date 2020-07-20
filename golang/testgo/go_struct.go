package main
import "fmt"


type Student struct {
	name string
	age int
	sex int
}

func getName(st *Student) string {
	return st.name
}

func main() {

	var s = new(Student)
	s.name = "wenshaoqi"
	s.age = 30
	s.sex = 1
	fmt.Println(s)

	var ss = &Student{}
	ss.name = "wenshaoqi"
	ss.age = 30
	ss.sex = 1
	fmt.Println(ss)

	st := &Student{name:"Wenshaoqi",age:20}
	fmt.Println(st)

	fmt.Println(getName(s))
	fmt.Println(getName(st))

	var s2 Student
	s2.name = "YouZshen"
	fmt.Println(getName(&s2))
	

	s3:=Student{name:"John"}
	fmt.Println(s3.name)
}