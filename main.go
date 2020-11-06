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
	fmt.Println("Hi! I'm yuliz")
}
