# DegenToken

DegenToken is an ERC20 token contract named "Degen" with the symbol "DGN". It provides functionality for managing experience points (xP), coins, and ammunition (ammo). Users can earn xP by shooting enemies, redeem xP for coins, buy bullets using coins, and transfer tokens between accounts.

## Features

- `redeemXP`: Allows users to redeem their accumulated experience points for coins.
- `buyBullet`: Enables users to purchase bullets using coins.
- `shootEnemy`: Deducts ammunition to shoot enemies and awards experience points.
- `transfer`: Overrides the ERC20 `transfer` function to enforce additional balance checks.

## Initial State

- Upon deployment, the contract mints 10 Degen tokens to the deploying address.
- 10 coins are also allocated to the deploying address.
- Initially, there are 0 experience points and 4 ammunition available.

## Requirements

- Solidity compiler version: ^0.8.0
- OpenZeppelin library for ERC20 and Ownable functionalities.

## Usage

1. **Redeeming Experience Points (xP)**
   - Call the `redeemXP` function to exchange accumulated xP for coins.

2. **Buying Bullets**
   - Use the `buyBullet` function to purchase ammunition using coins.

3. **Shooting Enemies**
   - Execute the `shootEnemy` function to consume ammunition and gain experience points.

4. **Transferring Tokens**
   - Transfer Degen tokens to other accounts using the standard ERC20 `transfer` function.

5. **Viewing Balances**
   - Use the `getBalance` function to check the token balance of a specific account.

