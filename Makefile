PROJECT_NAME := "github.com/imyuliz/template-go"
PKG := "$(PROJECT_NAME)"
PKG_LIST := $(shell go list ${PKG}/... | grep -v /vendor/)
LDFLAGS := "-s -w -X '$(PROJECT_NAME)/version.GitCommit=`git log | grep commit | head -1 | cut -d" " -f2 | cut -c1-8`' -X '$(PROJECT_NAME)/version.BuildGoVersion=`go version | cut -d" " -f3`' -X '$(PROJECT_NAME)/version.BuildSystem=`go version | cut -d" " -f4`'"
.PHONY: build
build: ## Build the binary file
	make clean
	mkdir -p bin
	go build -ldflags=${LDFLAGS} -o bin/main 
clean: ## Remove previous build
	rm -rf bin
dep: ## Get the dependencies
	@go mod download
local: ## Built on local env and run project
	make build
	make run
linux: ## Build the linux version binary file
	rm -rf bin
	mkdir -p bin
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags=${LDFLAGS} -o bin/main
lint: ## Lint Golang files
	@golint -set_exit_status ${PKG_LIST}
run: ## run project
	./bin/main
test: ## Run unittests
	@go test -short ${PKG_LIST}
test-coverage: ## Run tests with coverage
	@go test -short -coverprofile cover.out -covermode=atomic ${PKG_LIST}
	@cat cover.out >> coverage.txt
help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'