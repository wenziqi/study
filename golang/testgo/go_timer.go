package main

import "fmt"
import "time"


func Timer(i time.Duration,function func()) {
	timeObj := time.NewTimer(time.Second*i)
	go func(){
		fmt.Println("timer begin")
		<- timeObj.C
		function()
		fmt.Println("timer end")
	}()
}

func main(){

	Timer(3,func(){
		fmt.Println("call timer func")
	})

	for{

	}

}