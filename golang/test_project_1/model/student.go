package model

type Student struct{
	name string
	age int
}


func NewStudent(myname string ) *Student{
	return &Student{name:myname}
}


func (s *Student) GetName() string {
	return s.name
}

func (s *Student) SetAge(n int) {
	s.age = n
}

func (s *Student) GetAge() int {
	return s.age
}

