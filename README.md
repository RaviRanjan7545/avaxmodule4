## FreeFireToken

FreeFireToken is an ERC20-compliant token contract built on the Ethereum blockchain. It represents an in-game currency for the Free Fire game, allowing players to interact with the game economy and perform various actions.

### Features

- **Kill Count Tracking**: The contract tracks the kill count of each player, recording the number of enemies defeated by them.
- **Villain Defeat**: Players can mark villains as defeated within the game.
- **Reward Issuance**: Game administrators can issue rewards to players based on their performance or participation.
- **Reward Redemption**: Players can redeem rewards they have earned in the game.
- **Balance Checking**: Players can check their token balance at any time.
- **Token Transfer**: Players can transfer tokens to other addresses.
- **Token Burning**: Players have the option to burn tokens, removing them from circulation.

### Events

- `PlayerKilled`: Triggered when a player defeats enemies and increases their kill count.
- `VillainDefeated`: Triggered when a player defeats a villain within the game.
- `RewardsIssued`: Triggered when rewards are issued to a player by the game administrator.
- `RewardsRedeemed`: Triggered when a player redeems their earned rewards.

### Functions

- `collectKillCount(uint256 enemies)`: Records the number of enemies defeated by the calling player.
- `defeatVillain()`: Marks the calling player as having defeated a villain.
- `issueRewards(address player, uint256 rewards)`: Allows the game administrator to issue rewards to a player.
- `redeemRewards()`: Allows players to redeem their earned rewards.
- `checkBalance(address account)`: Retrieves the token balance of a specified account.
- `transferTokens(address recipient, uint256 amount)`: Transfers tokens from the caller's address to the specified recipient.
- `burn(uint256 amount)`: Burns a specified amount of tokens, removing them from circulation.

### Deployment

The FreeFireToken contract can be deployed on the Ethereum blockchain. Ensure to specify an initial owner address during deployment.

### License

This contract is licensed under the MIT License, allowing for open use and modification.
