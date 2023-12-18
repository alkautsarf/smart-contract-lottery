-include .env

.PHONY: all test deploy

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

help:
	@echo "Usage: make [target]"
	@echo " make deploy [ARGS=...]"

build:; forge build

install:; forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit && forge install transmissions11/solmate --no-commit && forge install Cyfrin/foundry-devops --no-commit  

test:; forge test

format:; forge fmt

NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

anvil:;  anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

# deploy local: 
# 	@forge script script/DeployRaffle.s.sol:DeployRaffle $(NETWORK_ARGS)

deploy: 
	@forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(SEPOLIA_RPC_URL) --account defaultKey --sender $(MAIN_ADDRESS) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

createSubscription:
	@forge script script/Interactions.s.sol:CreateSubscription $(NETWORK_ARGS)

addConsumer:
	@forge script script/Interactions.s.sol:AddConsumer $(NETWORK_ARGS)

fundSubscription:
	@forge script script/Interactions.s.sol:FundSubscription $(NETWORK_ARGS)