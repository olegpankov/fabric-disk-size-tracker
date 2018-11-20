Fabric configuration includes static MSP files, genesis block and channel setting.

|File|What's this|
|----|-----------|
|crypto-config|Static MSPs|
|channel.tx|Channel setting|
|genesis.block|Genesis block|

These files are generated already.

File `configtx.yaml` and `crypto-config.yaml` are used by `generate.sh` to generate these files.

Use `generate.sh` to re-generate certificates and channel configurations

We will use these files to build up our Fabric images in another place.
