package main

import (
	"fmt"

	"github.com/imyuliz/template-go/version"
)

func main() {
	fmt.Println(version.GitCommit)
	fmt.Printf("commit: %s\n", version.GitCommit)
	fmt.Printf("built on %s\n", version.BuildGoVersion)
	fmt.Printf("built on %s\n", version.BuildSystem)
	fmt.Println("form branch ci-test")
	fmt.Println("Hi! I'm yuliz")
	fmt.Println("Hi! I'm yuliz")

}

// HelloWorld define hello world
func HelloWorld() {
	fmt.Println("hello world")
}
