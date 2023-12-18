# Smart Contract Lottery

This is a smart contract written in Solidity for conducting an on-chain lottery. This contract utilize ChainLinkVRFv2 for generating random numbers and ChainLink Automation for picking the winner of the raffle.

## Features

- Participants can enter the raffle by calling ```enterRaffle()``` with minimum of deposit that stated in the contract.
- The contract randomly selects a winner at the end of the raffle.
- The winner receives the prize pool, which is the total Ether collected from all participants.

## Usage

1. Deploy the contract to the Ethereum network.
2. Set the duration of the raffle and the ticket price.
3. Participants can buy tickets by sending Ether to the contract.
4. At the end of the raffle, the contract will select a winner randomly.
5. The winner can claim the prize by calling the appropriate function on the contract.

## Contract Structure

The contract consists of the following main functions:

- User only need to interact with this function:
    - `enterRaffle()`: Allows participants to participate in the raffle.

- These functions are meant to be called using ChainLink Automation:
    - `checkUpkeep()`: Checking the current state of raffle.
    - `performUpkeep()`: Perform random number generation using ChainLinkVRF.
    - `fulfillRandomWords()`: Pick the winner and reset the current state of the contract.


## Commands

- Testing Local
    
    ```
    make test / forge test
    ```
- Testing Sepolia
    
    ```
    forge test --rpc-url $SEPOLIA_RPC_URL
    ```
- Deploy Contract Local

    ```
    forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(LOCAL_HOST) --account defaultKey --sender $(MAIN_ADDRESS) --broadcast
    ```
- Deploy Contract Sepolia

    ```
    make deploy
    ```
