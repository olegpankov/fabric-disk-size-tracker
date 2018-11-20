cp ../config/crypto-config/peerOrganizations/org1.example.com/ca/*_sk ca.org1.example.com/key.pem
cp ../config/crypto-config/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem ca.org1.example.com/cert.pem

cp ../config/crypto-config/peerOrganizations/org2.example.com/ca/*_sk ca.org2.example.com/key.pem
cp ../config/crypto-config/peerOrganizations/org2.example.com/ca/ca.org2.example.com-cert.pem ca.org2.example.com/cert.pem

cp ../config/genesis.block orderer.example.com/
rm -rf orderer.example.com/msp
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp orderer.example.com
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls orderer.example.com

cp ../config/channel.tx peer0.org1.example.com/
rm -rf peer0.org1.example.com/Admin@org1.example.com/msp peer0.org1.example.com/peer0.org1.example.com/msp
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp peer0.org1.example.com/Admin@org1.example.com/
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp peer0.org1.example.com/peer0.org1.example.com/
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls peer0.org1.example.com
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem peer0.org1.example.com
cp -R ../chaincode peer0.org1.example.com/

cp ../config/channel.tx peer1.org1.example.com/
rm -rf peer1.org1.example.com/Admin@org1.example.com/msp peer1.org1.example.com/peer1.org1.example.com/msp
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp peer1.org1.example.com/Admin@org1.example.com/
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp peer1.org1.example.com/peer1.org1.example.com/
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls peer1.org1.example.com
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem peer1.org1.example.com
cp -R ../chaincode peer1.org1.example.com/

cp ../config/channel.tx peer2.org1.example.com/
rm -rf peer2.org1.example.com/Admin@org1.example.com/msp peer2.org1.example.com/peer2.org1.example.com/msp
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp peer2.org1.example.com/Admin@org1.example.com/
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/peers/peer2.org1.example.com/msp peer2.org1.example.com/peer2.org1.example.com/
cp -R ../config/crypto-config/peerOrganizations/org1.example.com/peers/peer2.org1.example.com/tls peer2.org1.example.com
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem peer2.org1.example.com
cp -R ../chaincode peer2.org1.example.com/

cp ../config/channel.tx peer0.org2.example.com/
rm -rf peer0.org2.example.com/Admin@org2.example.com/msp peer0.org2.example.com/peer0.org2.example.com/msp
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp peer0.org2.example.com/Admin@org2.example.com/
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/msp peer0.org2.example.com/peer0.org2.example.com/
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls peer0.org2.example.com
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem peer0.org2.example.com
cp -R ../chaincode peer0.org2.example.com/

cp ../config/channel.tx peer1.org2.example.com/
rm -rf peer1.org2.example.com/Admin@org2.example.com/msp peer1.org2.example.com/peer1.org2.example.com/msp
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp peer1.org2.example.com/Admin@org2.example.com/
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/msp peer1.org2.example.com/peer1.org2.example.com/
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls peer1.org2.example.com
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem peer1.org2.example.com
cp -R ../chaincode peer1.org2.example.com/

cp ../config/channel.tx peer2.org2.example.com/
rm -rf peer2.org2.example.com/Admin@org2.example.com/msp peer2.org2.example.com/peer2.org2.example.com/msp
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp peer2.org2.example.com/Admin@org2.example.com/
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/peers/peer2.org2.example.com/msp peer2.org2.example.com/peer2.org2.example.com/
cp -R ../config/crypto-config/peerOrganizations/org2.example.com/peers/peer2.org2.example.com/tls peer2.org2.example.com
cp -R ../config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem peer2.org2.example.com
cp -R ../chaincode peer2.org2.example.com/
