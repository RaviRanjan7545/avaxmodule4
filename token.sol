
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RanjanToken is ERC20, Ownable {
    uint256 public sands;
    uint256 public swordStrength;

    constructor() ERC20("RanjanToken", "RAN") {
        _mint(msg.sender, 10 * 10 ** decimals());
        sands = 60;
        swordStrength = 10;
    }

    function collectSand(uint256 sandAmt) public onlyOwner {
        _mint(msg.sender, sandAmt);
        sands += sandAmt;
    }

    function fightDemons() public {
        require(sands >= 15 && swordStrength > 0, "Not enough strength to fight demons");
        _burn(msg.sender, 15);
        sands -= 10;
        swordStrength--;
    }

    function buySword() public {
        require(sands >= 30, "Not enough sand to forge sword");
        _burn(msg.sender, 30);
        sands -= 30;
        swordStrength += 10;
    }
}
