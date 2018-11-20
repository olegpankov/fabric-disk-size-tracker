#!/usr/bin/env bash

CC_NAME=test-chaincode
CHANNEL=channel1

echo "Remove existing chaincode containers"
docker ps -f "name=-$CC_NAME-" -aq | xargs -r docker rm -fv
echo "Remove existing chaincode images"
docker images --filter=reference="*-$CC_NAME-*" -q | xargs -r docker rmi -f


#docker exec  \
#-e "CORE_PEER_ADDRESS=peer0.org1.example.com:7051"  \
#-e "CORE_PEER_LOCALMSPID=Org1MSP"  \
#-e "CORE_PEER_TLS_CERT_FILE=/cli/peer0.org1.example.com/tls/server.crt"  \
#-e "CORE_PEER_TLS_KEY_FILE=/cli/peer0.org1.example.com/tls/server.key"  \
#-e "CORE_PEER_TLS_ROOTCERT_FILE=/cli/peer0.org1.example.com/tls/ca.crt"  \
#-e "CORE_PEER_MSPCONFIGPATH=/cli/Admin@org1.example.com/msp"  \
docker exec cli peer chaincode install -n $CC_NAME -p chaincode -v v0
#docker exec cli peer chaincode list -C $CHANNEL --instantiated | grep Version
docker exec cli peer chaincode instantiate -o orderer.example.com:7050 -C channel1 -n $CC_NAME -v v0 -c '{"Args":["init"]}' -P "OR ('Org1MSP.peer')" --tls --cafile /cli/orderer/tls/server.crt
