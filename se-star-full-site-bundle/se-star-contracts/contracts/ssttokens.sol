// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SSTToken is ERC20, Ownable {
    uint256 private constant INITIAL_SUPPLY = 1_000_000_000 * 10 ** 18;

    constructor(address ownerWallet) ERC20("SE-STAR Token", "SST") Ownable(ownerWallet) {
        _mint(ownerWallet, INITIAL_SUPPLY);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
