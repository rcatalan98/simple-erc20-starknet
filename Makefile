deps:
	curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh -s -- -v  0.7.0 \
	&& curl https://get.starkli.sh | sh

build:
	scarb build

declare: 
	starkli declare target/dev/erc20_MyToken.sierra.json --keystore ~/.starkli-wallets/keystore.json --account ~/.starkli-wallets/account.json

declare_local:
	starkli declare target/dev/erc20_MyToken.sierra.json --keystore ${STARKNET_KEYSTORE} --account ${STARKNET_ACCOUNT} --rpc http://0.0.0.0:5050

INIT_SUPPLY:=1234
RECIPIENT:=0x0x04043Cf20596f1A9D1DA04EDd222BE30d348b8d7427D858611a6057F97adA4C2
deploy:
	starkli deploy 0x07b4b81da58ccc62585d06194485b85f37ef73bf1f9611d6c14dbdf11c11b8b5 u256:${INIT_SUPPLY} ${RECIPIENT} --keystore ~/.starkli-wallets/keystore.json  --account ~/.starkli-wallets/account.json

RECIPIENT_local:=0x517ececd29116499f4a1b64b094da79ba08dfd54a3edaa316134c41f8160973
shitcoin_hash:=0x07b4b81da58ccc62585d06194485b85f37ef73bf1f9611d6c14dbdf11c11b8b5
pepecoin_hash:=0x05f76b0ff6fd36c352a6a6a6a727f0cf411f82e317dafc76dfb840bd4fa6ae6d
deploy_local:
	starkli deploy ${pepecoin_hash} u256:${INIT_SUPPLY} ${RECIPIENT_local} --keystore ${STARKNET_KEYSTORE} --account ${STARKNET_ACCOUNT} --rpc http://0.0.0.0:5050

CONTRACT_ADDRESS:=0x055f572986a172653c2d46819c3e7a7647904a1b16970bcdcc2eb5a60200bf4b
TO:=0x026142a6B0f2Bf5E646ae0AC96B9CB787De15279ad4616d4E522A7e1093BD8Aa
AMOUNT:=100
transfer:
	starkli invoke ${CONTRACT_ADDRESS} transfer ${TO} u256:${AMOUNT} --keystore ~/.starkli-wallets/keystore.json --account ~/.starkli-wallets/account.json
