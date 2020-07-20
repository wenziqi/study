package main

import "fmt"
import "github.com/garyburd/redigo/redis"



func main(){
	c,err :=redis.Dial("tcp","127.0.0.1:6379")
	if err != nil {
		fmt.Println("Connect to redis error ",err)
		return
	}

	defer c.Close()

	username, err := redis.String(c.Do("GET", "name"))
	if err != nil {
		
	}
	fmt.Println(username,err)
}