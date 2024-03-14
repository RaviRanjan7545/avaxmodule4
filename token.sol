// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    uint256 xP;
    uint256 coins;
    uint256 ammo;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        _mint(msg.sender, 10);
        coins = 10;
        xP = 0;
        ammo = 4;
    }

    function redeemXP() public {
        require(xP > 0, "No xP to redeem");
        if (xP > 20) {
            coins += xP * 2;
            _mint(msg.sender, xP * 2);
        } else {
            coins += xP;
            _mint(msg.sender, xP);
        }
        xP = 0;
    }

    function buyBullet(uint256 amount) public {
        require(coins >= amount, "Amount should be less than coins");
        coins -= amount;
        _burn(msg.sender, amount);
        ammo += amount;
    }

    function shootEnemy() public {
        require(ammo > 0, "At least one bullet required to kill enemy");
        ammo--;
        xP += 2;
    }

    function transfer(address to, uint256 amount)
        public
        override
        returns (bool)
    {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _transfer(msg.sender, to, amount);
        return true;
    }

    function getBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
