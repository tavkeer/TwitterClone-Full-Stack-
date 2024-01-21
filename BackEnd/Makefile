# build: 
# 	go build -o server main.go 

# run: build
# 	./server

# watch:
# 	reflex -s -r '\.go$$' make run

PID = ./obsly.pid
GO_FILES = $(wildcard *.go)
APP = ./obsly

serve: start
	@fswatch -x -o --event Created --event Updated --event Renamed -r -e '.*' -i '\.go$$'  . | xargs -n1 -I{}  make restart || make kill

kill:
	@kill `cat $(PID)` || true

before:
	@echo "actually do nothing"

build: $(GO_FILES)
	@go build -o $(APP)

$(APP): $(GO_FILES)
	@go build $? -o $@

start:
	# @sh -c "$(APP) & echo $$! > $(PID)"
	@./obsly & echo $$! > $(PID)

restart: kill before build start

.PHONY: start serve restart kill before # let's go to reserve rules names
