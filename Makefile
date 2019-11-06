build:
	cp src/gossa.go gossa.go
	make -C gossa-ui/
	go vet && go fmt
	CGO_ENABLED=0 go build gossa.go
	rm gossa.go

run:
	make build
	./gossa -verb=true test-fixture

run-extra:
	make build
	./gossa -verb=true -prefix="/fancy-path/" -k=false -symlinks=true test-fixture

ci:
	-@cd test-fixture && ln -s ../support .
	make build
	timeout 15 make run &
	sleep 16 && timeout 15 make run-extra &
	cp src/gossa_test.go . && go test
	rm gossa_test.go

watch:
	ls src/* gossa-ui/* | entr -rc make run

watch-extra:
	ls src/* gossa-ui/* | entr -rc make run-extra

watch-ci:
	ls src/* gossa-ui/* | entr -rc make ci

build-all:
	cp src/gossa.go gossa.go
	make -C gossa-ui/
	env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build gossa.go
	mv gossa gossa-linux64
	env GOOS=linux GOARCH=arm go build gossa.go
	mv gossa gossa-linux-arm
	env GOOS=linux GOARCH=arm64 go build gossa.go
	mv gossa gossa-linux-arm64
	env GOOS=darwin GOARCH=amd64 go build gossa.go
	mv gossa gossa-mac
	env GOOS=windows GOARCH=amd64 go build gossa.go
	mv gossa.exe gossa-windows.exe
	rm gossa.go

clean:
	-rm gossa.go
	-rm gossa_test.go
	-rm gossa
	-rm gossa-linux64
	-rm gossa-linux-arm
	-rm gossa-linux-arm64
	-rm gossa-mac
	-rm gossa-windows.exe
