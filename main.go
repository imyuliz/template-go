package main

import (
	"fmt"

	"github.com/imyuliz/template-go/version"
)

func main() {
	fmt.Println(version.GitCommit)
	fmt.Printf("commit: %+10s\n", version.GitCommit)
	fmt.Printf("built on %+10s\n", version.BuildGoVersion)
	fmt.Printf("built on %+10s\n", version.BuildSystem)
	fmt.Println("Hi! I'm yuliz")
}
