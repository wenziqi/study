package main
import "fmt"

type Base interface{
	Say()
}


type SubClass struct{

}


func (p SubClass) Say(){
	fmt.Println("I am a instance of SubClass")
}

type FooClass struct{

}


func (p FooClass) Say(){
	fmt.Println("I am a instance of FooClass")
}


func main() {

	var p Base
	p = new(SubClass)
	p.Say()

	p = new(FooClass)
	p.Say()

}