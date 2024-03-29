// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegenGamingToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;
    mapping(address => bool) private isAdmin;
    mapping(address => uint256) private rewards;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event RewardAdded(address indexed account, uint256 amount);
    event RewardClaimed(address indexed account, uint256 amount);

    constructor() {
        name = "Degen Token";
        symbol = "DGN";
        decimals = 18;
        totalSupply = 0;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    function mint(address account, uint256 amount) external onlyOwner {
        require(account != address(0), "Invalid address");
        require(amount > 0, "Invalid amount");

        balances[account] += amount;
        totalSupply += amount;

        emit Transfer(address(0), account, amount);
        rewards[account] += 3;
        emit RewardAdded(account, 3); 
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
        require(recipient != address(0), "Invalid address");
        require(amount > 0, "Invalid amount");
        require(amount <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        rewards[recipient] += 2;
        emit RewardAdded(recipient, 2); 
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        require(spender != address(0), "Invalid address");

        allowances[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        rewards[spender] += 4;
        emit RewardAdded(spender, 4); 
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        require(sender != address(0), "Invalid address");
        require(recipient != address(0), "Invalid address");
        require(amount > 0, "Invalid amount");
        require(amount <= balances[sender], "Insufficient balance");
        require(amount <= allowances[sender][msg.sender], "Insufficient allowance");

        balances[sender] -= amount;
        balances[recipient] += amount;
        allowances[sender][msg.sender] -= amount;

       
        rewards[sender] += 5;
        emit RewardAdded(sender, 5); 
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function burn(uint256 amount) external {
        require(amount > 0, "Invalid amount");
        require(amount <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= amount;
        totalSupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
       
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function claimReward() external returns (uint256) {
        uint256 amount = rewards[msg.sender];
        require(amount > 0, "No rewards to claim");

        rewards[msg.sender] = 0;
        emit RewardClaimed(msg.sender, amount);

        return amount;
    }

    function InGamePurchase(uint256 amount) external {
        require(amount > 0, "Invalid amount");
        require(amount <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= amount;
        totalSupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
        rewards[msg.sender] += 4;
        emit RewardAdded(msg.sender, 4); 
    }

    function addReward(address account, uint256 amount) external onlyOwner {
        require(account != address(0), "Invalid address");
        require(amount > 0, "Invalid amount");

        rewards[account] += amount;
        emit RewardAdded(account, amount);
    }
}
