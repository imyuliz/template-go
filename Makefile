LDFLAGS := "-s -w -X 'github.com/imyuliz/template-go/version.GitCommit=`git log | grep commit | head -1 | cut -d" " -f2 | cut -c1-8`' -X 'github.com/imyuliz/template-go/version.BuildGoVersion=`go version | cut -d" " -f3`' -X 'github.com/imyuliz/template-go/version.BuildSystem=`go version | cut -d" " -f4`'"
.PHONY: build
build:
	make clean
	mkdir -p bin
	go build -ldflags=${LDFLAGS} -o bin/main 
run:
	./bin/main
local:
	make build
	make run
linux:
	rm -rf bin
	mkdir -p bin
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags=${LDFLAGS} -o bin/main
clean:
	rm -rf bin