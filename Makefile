.DEFAULT: help
.PHONY: help build gen lint test race clean

GOLANG_PATH=$(CURDIR)/.go
JOCKO_BIN := cmd/jocko/jocko

help:
	@echo "Please use \`$(MAKE) <target>' where <target> is one of the following:"
	@echo "  help       - show help information"
	@echo "  build      - build the project"
	@echo "  gen        - run generate"
	@echo "  lint       - lint the project"
	@echo "  test       - run project tests"
	@echo "  race       - run project tests with race detector enabled"
	@echo "  clean      - clean up project environment and all the build artifacts"

build:
	GOPATH=$(GOLANG_PATH) go build -o $(JOCKO_BIN) cmd/jocko/main.go

gen:
	GOPATH=$(GOLANG_PATH) go generate

lint:
	GOPATH=$(GOLANG_PATH) go list ./... | grep -v vendor | xargs go vet

test:
	GOPATH=$(GOLANG_PATH) go test -v ./...

race:
	GOPATH=$(GOLANG_PATH) go test -v -race -p=1 ./...

clean:
	GOPATH=$(GOLANG_PATH) go clean -modcache
	rm $(JOCKO_BIN)
	rm -rf $(GOLANG_PATH)
