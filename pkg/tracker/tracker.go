package tracker

import (
	"log"
	"ypeckstadt/fabric-data-tracker/pkg/utl/wrapper"
)

func Start() error {


	wrapper := wrapper.New()
	err := wrapper.InitializeByFile("/tmp/fixtures/config/sdk-config.yaml", "Admin", "org1")
	if err != nil {
		log.Printf(err.Error())
	}

	channelID := "channel1"
	chaincodeID := "test-chaincode"
	userName := "Admin"
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
	//payload, err := wrapper.Invoke(channelID, "User1", chaincodeID, "jefke", []string{
	//	"hello",
	//	"5",
	//})
	////
	//fmt.Println(string(payload))
	payload, err := wrapper.Query(channelID, userName, chaincodeID, "qTestQuery", []string{"hello", "hello"})
	if err != nil {
		log.Printf(err.Error())
	}
	log.Println(string(payload))
	//err = wrapper.EnrollUser("User1", "org1")
	//fmt.Println(err)
	//user, err := wrapper.GetEnrolledUser("User1", "org1")
	//fmt.Println(err)
	//fmt.Println(user)

	wrapper.Close()


	return nil
}
