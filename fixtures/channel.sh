#!/bin/bash

# manipulate Fabric
docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org1.example.com/msp" peer0.org1.example.com peer channel create -o orderer.example.com:7050 -c channel1 -f /peer/channel.tx --tls --cafile /peer/tlsca.example.com-cert.pem
docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b channel1.block

docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org1.example.com/msp" peer1.org1.example.com peer channel fetch 0 channel1.block -o orderer.example.com:7050 -c channel1 --tls --cafile /peer/tlsca.example.com-cert.pem
docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org1.example.com/msp" peer1.org1.example.com peer channel join -b channel1.block

#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org1.example.com/msp" peer2.org1.example.com peer channel fetch 0 channel1.block -o orderer.example.com:7050 -c channel1 --tls --cafile /peer/tlsca.example.com-cert.pem
#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org1.example.com/msp" peer2.org1.example.com peer channel join -b channel1.block

#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org2.example.com/msp" peer0.org2.example.com peer channel fetch 0 channel1.block -o orderer.example.com:7050 -c channel1 --tls --cafile /peer/tlsca.example.com-cert.pem
#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org2.example.com/msp" peer0.org2.example.com peer channel join -b channel1.block

#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org2.example.com/msp" peer1.org2.example.com peer channel fetch 0 channel1.block -o orderer.example.com:7050 -c channel1 --tls --cafile /peer/tlsca.example.com-cert.pem
#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org2.example.com/msp" peer1.org2.example.com peer channel join -b channel1.block

#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org2.example.com/msp" peer2.org2.example.com peer channel fetch 0 channel1.block -o orderer.example.com:7050 -c channel1 --tls --cafile /peer/tlsca.example.com-cert.pem
#docker-compose exec -e "CORE_PEER_MSPCONFIGPATH=/peer/Admin@org2.example.com/msp" peer2.org2.example.com peer channel join -b channel1.block
