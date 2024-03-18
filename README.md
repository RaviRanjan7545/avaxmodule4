# DegenGamingToken Smart Contract

This is a Solidity smart contract for DegenGamingToken, an ERC-20 token designed for gaming applications. The contract includes various functionalities such as minting tokens, transferring tokens, approving spending limits, burning tokens, checking balances, claiming rewards, and handling in-game purchases.

## Overview

- **Name:** Degen Token
- **Symbol:** DGN
- **Decimals:** 18

## Functionality

1. **Minting Tokens:**
   - Function: `mint(address account, uint256 amount)`
   - Description: Mints a specified amount of tokens and adds them to the balance of the specified account.
   - Reward: Grants 3 tokens to the recipient.

2. **Transferring Tokens:**
   - Function: `transfer(address recipient, uint256 amount)`
   - Description: Transfers a specified amount of tokens from the sender's balance to the recipient's balance.
   - Reward: Grants 2 tokens to the recipient.

3. **Approving Spending Limits:**
   - Function: `approve(address spender, uint256 amount)`
   - Description: Approves a spender to transfer a specified amount of tokens on behalf of the owner.
   - Reward: Grants 4 tokens to the spender.

4. **Transferring Tokens From:**
   - Function: `transferFrom(address sender, address recipient, uint256 amount)`
   - Description: Transfers a specified amount of tokens from the sender's balance to the recipient's balance, using the allowance mechanism.
   - Reward: Grants 5 tokens to the sender.

5. **Burning Tokens:**
   - Function: `burn(uint256 amount)`
   - Description: Burns a specified amount of tokens, reducing the total supply.
   - Note: No rewards are given for burning tokens.

6. **Checking Balances:**
   - Function: `balanceOf(address account)`
   - Description: Returns the balance of tokens for a specified account.

7. **Claiming Rewards:**
   - Function: `claimReward()`
   - Description: Claims any accumulated rewards for the caller.
   - Reward: Claims the accumulated rewards for the caller.

8. **In-Game Purchases:**
   - Function: `InGamePurchase(uint256 amount)`
   - Description: Allows users to make in-game purchases using tokens.
   - Reward: Grants 4 tokens to the user making the purchase.

9. **Adding Rewards Manually:**
   - Function: `addReward(address account, uint256 amount)`
   - Description: Allows the contract owner to manually add rewards to a user's account.

## Usage

1. Deploy the contract to an Ethereum-compatible blockchain.
2. Use the provided functions to interact with the token, transfer tokens, approve spending limits, claim rewards, and make in-game purchases.
3. Use the `addReward` function to manually add rewards to user accounts.
