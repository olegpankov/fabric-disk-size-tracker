package tracker

import (
	"encoding/csv"
	"fmt"
	"log"
	"math/rand"
	"os"
	"os/exec"
	"strconv"
	"time"
	"ypeckstadt/fabric-data-tracker/pkg/utl/wrapper"
)

const (
	letterBytes   = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	letterIdxBits = 6                    // 6 bits to represent a letter index
	letterIdxMask = 1<<letterIdxBits - 1 // All 1-bits, as many as letterIdxBits
	letterIdxMax  = 63 / letterIdxBits   // # of letter indices fitting in 63 bits
)

func Start() error {

	// based on the following input settings
	// length of input data string, for example if 5000 generate a string of 5000 characters
	// number of times run,  for example if 365 run the save transaction 365 times
	// division number,   for example if 4 then we need to actually save the 5000 characters not in one time
	// but 4 times.  So that means we need to do 365 * 4 transactions and each transaction data size is 5000 /4

	// ---> at the start just hard code the settings

	// after each transaction or in an interval, connect to the docker peer image and use the du command on the couch db folder and transction history folder
	// to get the currently used disk size MB/GB

	// example command in CLI to run du is
	// docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org1.example.com/msp" peer0.org1.example.com du <folderPath>
	// use the go exec package to run an CLI command from the application

	wrapper := wrapper.New()
	err := wrapper.InitializeByFile("/tmp/fixtures/config/sdk-config.yaml", "Admin", "org1")
	if err != nil {
		log.Printf(err.Error())
	}

	channelID := "channel1"
	chaincodeID := "test-chaincode"
	userName := "Admin"
	characters := 37110
	savingTimes := 18
	transactions := 365
	inputDataLength := characters / savingTimes
	timesRun := transactions * savingTimes
	csvOutput := [][]string{}
	csvOutput = append(csvOutput, []string{"transaction number", "peer size", "couchdb size"})

	//var outputType int
	//flag.IntVar(&outputType, "type", 0, "step for input data")
	//flag.Parse()

	//wrapper.CreateChannel(channelID, channelConfig, ordererID)
	//wrapper.JoinChannel(channelID,ordererID)
	//pkg,_ := wrapper.CreateChaincodePackage(chaincodePath, chaincodeGoPath)
	//wrapper.InstallChaincode(chaincodeID, chaincodePath, pkg)
	//
	//ccPolicy := cauthdsl.SignedByAnyMember([]string{orgFullPath})
	//err := wrapper.InstantiateChaincode(channelID, chaincodeID, chaincodeGoPath,"0", ccPolicy)
	//if err != nil {
	//	fmt.Println(err)
	//}
	//

	dataString := RandStringBytesMaskImprSrc(inputDataLength)

	//// Invoke
	//payload, err := wrapper.Invoke(channelID, userName, chaincodeID, "iCreateRandomData", []string{"1", dataString})
	//if err != nil {
	//	log.Printf(err.Error())
	//}
	//log.Println(string(payload))
	//
	//
	//// Query
	//payload, err = wrapper.Query(channelID,userName,chaincodeID,"qTestQuery", []string{strconv.Itoa(1)})
	//if err != nil {
	//	log.Printf(err.Error())
	//}
	//log.Println(string(payload))

	ticker := time.NewTicker(time.Millisecond * 100)
	counter := 0

	for {
		select {
		case <-ticker.C:
			if counter == timesRun {
				ticker.Stop()
			}
			go func(counter int) {

				// Invoke
				payload, err := wrapper.Invoke(channelID, userName, chaincodeID, "iCreateRandomData", []string{strconv.Itoa(counter), dataString})
				log.Println(string(payload))

				// check disk usage size for /var/lib/docker/volumes --> needs sudo access
				//cmd := exec.Command("/bin/sh", "-c", "sudo find ...")
				peerOutPut, err := exec.Command("/bin/sh", "-c", "sudo du -sh /var/lib/docker/volumes/peer0.org1.example.com").Output()
				if err != nil {
					log.Fatal(err)
				}
				fmt.Printf("The du is %s\n", peerOutPut)

				dbOutPut, err := exec.Command("/bin/sh", "-c", "sudo du -sh /var/lib/docker/volumes/couchdb.peer0.org1.example.com").Output()
				if err != nil {
					log.Fatal(err)
				}
				fmt.Printf("The du is %s\n", dbOutPut)

				//if outputType == 100 {
				//	if counter % 100 == 0 {
				//		csvOutput = append(csvOutput, []string{strconv.Itoa(counter) ,string(peerOutPut), string(dbOutPut)})
				//	}
				//} else if outputType == 10 {
				//	if counter % 10 == 0  {
				//		csvOutput = append(csvOutput, []string{strconv.Itoa(counter) ,string(peerOutPut), string(dbOutPut)})
				//	}
				//} else {
				//	csvOutput = append(csvOutput, []string{strconv.Itoa(counter) ,string(peerOutPut), string(dbOutPut)})
				//}

				csvOutput = append(csvOutput, []string{strconv.Itoa(counter), string(peerOutPut), string(dbOutPut)})

			}(counter)

			// check du size and save
			if err := csvExport(csvOutput); err != nil {
				log.Fatal(err)
			}

			counter++
		}
	}

	//for i := 0; i < timesRun; i++ {
	//	payload, err := wrapper.Invoke(channelID, userName, chaincodeID, "iCreateRandomData", []string{dataString})
	//	if i % 10 == 0 && i != 0 {
	//		fmt.Println("Created another 10 data transactions")
	//	}
	//	if err != nil {
	//		log.Printf(err.Error())
	//	}
	//	log.Println(string(payload))
	//}

	////
	//fmt.Println(string(payload))
	//payload, err := wrapper.Query(channelID, userName, chaincodeID, "qTestQuery", []string{"hello", "hello"})
	//if err != nil {
	//	log.Printf(err.Error())
	//}
	//log.Println(string(payload))
	//err = wrapper.EnrollUser("User1", "org1")
	//fmt.Println(err)
	//user, err := wrapper.GetEnrolledUser("User1", "org1")
	//fmt.Println(err)
	//fmt.Println(user)

	wrapper.Close()

	return nil
}

func RandStringBytesMaskImprSrc(n int) string {
	src := rand.NewSource(time.Now().UnixNano())
	b := make([]byte, n)

	// A src.Int63() generates 63 random bits, enough for letterIdxMax characters!
	for i, cache, remain := n-1, src.Int63(), letterIdxMax; i >= 0; {
		if remain == 0 {
			cache, remain = src.Int63(), letterIdxMax
		}
		if idx := int(cache & letterIdxMask); idx < len(letterBytes) {
			b[i] = letterBytes[idx]
			i--
		}
		cache >>= letterIdxBits
		remain--
	}

	return string(b)
}

func csvExport(data [][]string) error {
	file, err := os.Create("result.xlsx")
	if err != nil {
		return err
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	for _, value := range data {
		if err := writer.Write(value); err != nil {
			return err
		}
	}
	return nil
}
