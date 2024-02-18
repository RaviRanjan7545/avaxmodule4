# RanjanToken Contract

The RanjanToken contract is a Solidity smart contract based on the ERC20 token standard. It provides functionalities for creating, transferring, and managing tokens on the Ethereum blockchain.

## Overview

The `RanjanToken` contract represents a token named "RAN" (RanjanToken) with unique functionalities. It is deployed as an ERC20 token with the ability to collect sand, fight demons, and purchase swords.

### Token Details

- **Name**: RanjanToken
- **Symbol**: RAN

### Initial Token Supply

The contract initializes the token with an initial supply of 10 RAN tokens, which are minted to the contract deployer upon deployment.

## Functions

The contract provides the following functions:

- `collectSand(uint256 sandAmt)`: Allows the contract owner to collect additional sand by minting new RAN tokens.
  
- `fightDemons()`: Enables token holders to fight demons by burning a specified amount of sand and decreasing sword strength.

- `buySword()`: Allows token holders to purchase swords by burning a specific amount of sand and increasing sword strength.

### Ownership

The contract is Ownable, meaning the deployer has special privileges, including the ability to collect sand and manage the contract.

## Deployment

To deploy the `RanjanToken` contract, use a compatible Ethereum wallet or development environment. The contract initializes with an initial supply of 10 RAN tokens and 60 sands.

## Usage

1. **Collecting Sand**: The contract owner can collect additional sand using the `collectSand` function.

2. **Fighting Demons**: Token holders can use the `fightDemons` function to fight demons, requiring a minimum sand amount and sword strength.

3. **Purchasing Swords**: Token holders can buy swords using the `buySword` function, requiring a specific amount of sand.

## Security Considerations

- The contract should be deployed and interacted with using secure wallets and client applications.
- Ensure that only authorized parties have access to privileged functions such as `collectSand`.

## License

This contract is licensed under the MIT License.
