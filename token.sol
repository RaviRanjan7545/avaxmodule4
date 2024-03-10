// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FreeFireToken is ERC20, Ownable {

    uint256 public currAmmo = 10;
    mapping(address => uint256) prize;
    mapping(address => bool) prizeRedeemed;
    mapping(address => bool) specialItemsRedeemed;

    constructor(address initialOwner) ERC20("FreeFireToken", "COD") Ownable(initialOwner) {
        _mint(msg.sender, currAmmo);
    }

    function buyAmmo(uint256 ammo) public {
        _mint(msg.sender, ammo);
        currAmmo += ammo;
    }

    function shootEnemies(uint256 enemy) public {
        require(currAmmo > 0, "Not enough ammo");
        require(enemy > 0, "Enemy shot down must be greater than 0");

        currAmmo -= enemy;
        _burn(msg.sender, enemy);
    }

    function addPrizes(address addr, uint256 prz) public onlyOwner {
        prize[addr] = prz;
        prizeRedeemed[addr] = false;
    }

    function redeemPrizes() public {
        require(!prizeRedeemed[msg.sender], "Prize already redeemed");
        prizeRedeemed[msg.sender] = true;
    }

    function redeemSpecialItem() public {
        require(!specialItemsRedeemed[msg.sender], "Special item already redeemed");
        require(balanceOf(msg.sender) >= 100, "Insufficient balance to redeem special item");
        specialItemsRedeemed[msg.sender] = true;
        _mint(msg.sender, 50); 
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(amount <= balanceOf(msg.sender), "Insufficient balance");
        _transfer(msg.sender, recipient, amount);
        return true;
    }
}
