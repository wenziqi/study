package main

import "fmt"
import "time"


//var c  chan int= make(chan int)

func reader(name string , ch chan int){
	for {
		i:= <-ch
		fmt.Println("reader:",name,i)
	}
}



func writer(name string,ch chan int){
	for i:=0;i<20;i++ {
		fmt.Println("writer:",name,i)
		ch <- i
		time.Sleep(time.Second)
	}
}


func main() {
	ch := make(chan int)
	go writer("1",ch)
	go writer("2",ch)
	go writer("3",ch)

	go reader("1",ch)
	go reader("2",ch)
	go reader("3",ch)

	defer close(ch)

	for {

	}

}