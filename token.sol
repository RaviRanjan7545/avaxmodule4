// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FreeFireToken is ERC20, Ownable {
    mapping(address => uint256) public killCount;
    mapping(address => bool) public rewardsRedeemed;
    mapping(address => bool) public villainsDefeated;

    event PlayerKilled(address indexed player, uint256 enemies);
    event VillainDefeated(address indexed villain);
    event RewardsIssued(address indexed player, uint256 rewards);
    event RewardsRedeemed(address indexed player);

    constructor(address initialOwner) ERC20("FreeFireToken", "FF") Ownable(initialOwner) {
        _mint(msg.sender, 1 * 10 ** uint(decimals()));
    }

    function issueRewards(address player, uint256 rewards) public onlyOwner {
        rewardsRedeemed[player] = false;
        _mint(player, rewards);
        emit RewardsIssued(player, rewards);
    }

    function redeemRewards() public {
        require(!rewardsRedeemed[msg.sender], "Rewards already redeemed");
        rewardsRedeemed[msg.sender] = true;
        emit RewardsRedeemed(msg.sender);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function transferTokens(address recipient, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _transfer(msg.sender, recipient, amount);
    }

   function collectKillCount(uint256 enemies) public {
        killCount[msg.sender] += enemies;
        emit PlayerKilled(msg.sender, enemies);
    }

    function defeatVillain() public {
        villainsDefeated[msg.sender] = true;
        emit VillainDefeated(msg.sender);
    }
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
