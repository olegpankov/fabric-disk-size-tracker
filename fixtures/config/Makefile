all: crypto-config/ genesis.block channel.tx

channel.tx: configtx.yaml crypto-config/
	configtxgen -profile TwoOrgsChannel -channelID channel1 -outputCreateChannelTx channel.tx

genesis.block: configtx.yaml crypto-config/
	configtxgen -profile TwoOrgsOrdererGenesis -outputBlock genesis.block

crypto-config/: crypto-config.yaml
	cryptogen generate --config=crypto-config.yaml
	touch crypto-config/

clean:
	rm -rf crypto-config
	rm -f genesis.block
	rm -f channel.tx
