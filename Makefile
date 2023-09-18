deps:
	curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh -s -- -v  0.7.0 \
	&& curl https://get.starkli.sh | sh

build:
	scarb build

declare: 
	starkli declare target/dev/erc20_MyToken.sierra.json --keystore ~/.starkli-wallets/keystore.json --account ~/.starkli-wallets/account.json

INIT_SUPPLY:=1000000
RECIPIENT:=0x53b3c105ab9397a425ec9e6731265e36251743c2b4fce60f220e64c14de77c7
deploy:
	starkli deploy 0x07b4b81da58ccc62585d06194485b85f37ef73bf1f9611d6c14dbdf11c11b8b5 u256:${INIT_SUPPLY} ${RECIPIENT} --keystore ~/.starkli-wallets/keystore.json  --account ~/.starkli-wallets/account.json

TO:=0x026142a6B0f2Bf5E646ae0AC96B9CB787De15279ad4616d4E522A7e1093BD8Aa
AMOUNT:=100
transfer:
	starkli invoke 0x055f572986a172653c2d46819c3e7a7647904a1b16970bcdcc2eb5a60200bf4b transfer ${TO} u256:${AMOUNT} --keystore ~/.starkli-wallets/keystore.json --account ~/.starkli-wallets/account.json
