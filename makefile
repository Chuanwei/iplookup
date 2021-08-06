GOCMD			:=$(shell which go)
GOBUILD			:=$(GOCMD) build
FLAG			:="-w -s "

BINARY_DIR=bin
BINARY_NAME:=ipgo

# linux
build-linux:
	@CGO_ENABLED=0 GOOS=linux GOARCH=386 $(GOBUILD) -ldflags $(FLAG) -trimpath -o $(BINARY_DIR)/$(BINARY_NAME)_linux_386 cmd/iplookup/main.go
	@CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -ldflags $(FLAG) -trimpath -o $(BINARY_DIR)/$(BINARY_NAME)_linux_amd64 cmd/iplookup/main.go

#mac
build-darwin:
	CGO_ENABLED=0 GOOS=darwin $(GOBUILD) -ldflags $(FLAG) -trimpath -o $(BINARY_DIR)/$(BINARY_NAME)_darwin_amd64 cmd/iplookup/main.go

# windows
build-win:
	CGO_ENABLED=0 GOOS=windows GOARCH=386 $(GOBUILD) -ldflags $(FLAG) -trimpath -o $(BINARY_DIR)/$(BINARY_NAME)_win_386.exe cmd/iplookup/main.go
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 $(GOBUILD) -ldflags $(FLAG) -trimpath -o $(BINARY_DIR)/$(BINARY_NAME)_win_amd64.exe cmd/iplookup/main.go
# 全平台
build-all:
	make build-linux
	make build-darwin
	make build-win
	#upx $(BINARY_DIR)/$(BINARY_NAME)-*
