package main // import "ypeckstadt/fabric-data-tracker/cmd/tracker"

import (
	"ypeckstadt/fabric-data-tracker/pkg/tracker"
)

func main() {
	checkErr(tracker.Start())
}

func checkErr(err error) {
	if err != nil {
		panic(err.Error())
	}
}
