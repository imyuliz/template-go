LDFLAGS := "-s -w -X 'github.com/imyuliz/template-go/version/git.GitCommit=`git log | grep commit | head -1 | cut -d" " -f2 | cut -c1-8`' -X 'github.com/imyuliz/template-go/version/git.BuildGoVersion=`go version | cut -d" " -f3`' -X 'github.com/imyuliz/template-go/version/git.BuildSystem=`go version | cut -d" " -f4`'"
.PHONY: build
build:
	mkdir -p bin
	go build -ldflags=${LDFLAGS} -o bin/main 

run:
	./bin/main