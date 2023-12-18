# Raffle Contract

This is a smart contract written in Solidity for conducting a raffle. 

## Features

- Participants can buy tickets for the raffle by sending Ether to the contract.
- The contract randomly selects a winner at the end of the raffle.
- The winner receives the prize pool, which is the total amount of Ether collected from ticket sales.

## Usage

1. Deploy the contract to the Ethereum network.
2. Set the duration of the raffle and the ticket price.
3. Participants can buy tickets by sending Ether to the contract.
4. At the end of the raffle, the contract will select a winner randomly.
5. The winner can claim the prize by calling the appropriate function on the contract.

## Contract Structure

The contract consists of the following main functions:

- `buyTicket()`: Allows participants to buy tickets for the raffle.
- `endRaffle()`: Ends the raffle and selects a winner.
- `claimPrize()`: Allows the winner to claim the prize.

## Testing

Unit tests for the contract are available in the `Raffle.test.js` file.

## License

This project is licensed under the [MIT License](LICENSE).