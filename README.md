# dora-metrics  
clone this repo  
cd dora-metrics  
kubectl apply -k .  
 

# Makefile for building the argocd-policy-plugin

BINARY_NAME := argocd-policy-plugin
BUILD_DIR := bin

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build:
	@echo "Building $(BINARY_NAME) for Linux amd64"
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o $(BUILD_DIR)/$(BINARY_NAME)

# Clean target to remove build artifacts
.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)
	@rm -f test-report.json
	@rm -f coverage.out

# Format Go files
.PHONY: fmt
fmt:
	@go fmt ./...

# Tidy up Go modules
.PHONY: tidy
tidy:
	@go mod tidy -v

