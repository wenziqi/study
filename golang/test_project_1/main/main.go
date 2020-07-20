package main
import "fmt"
import "../model"

func main(){

	p:=model.NewStudent("Youzhen")
	p.SetAge(20)
	fmt.Println(p.GetName())
	fmt.Println(p.GetAge())

}