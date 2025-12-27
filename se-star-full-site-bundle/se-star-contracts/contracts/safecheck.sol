// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./SSTToken.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SSTPresale is ReentrancyGuard {
    SSTToken public token;
    address public owner;
    uint256 public rate = 50000; // 50,000 SST = 1 ETH
    uint256 public tokensSold;
    uint256 public presaleCap = 250_000_000 * 10 ** 18;

    event TokensPurchased(address indexed buyer, uint256 amountETH, uint256 tokens);

    constructor(address tokenAddress) {
        token = SSTToken(tokenAddress);
        owner = msg.sender;
    }

    receive() external payable {
        buyTokens();
    }

    function buyTokens() public payable nonReentrant {
        require(msg.value > 0, "Send ETH to buy tokens");
        uint256 tokenAmount = msg.value * rate;
        require(tokensSold + tokenAmount <= presaleCap, "Presale cap exceeded");

        tokensSold += tokenAmount;
        token.transfer(msg.sender, tokenAmount);
        emit TokensPurchased(msg.sender, msg.value, tokenAmount);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        payable(owner).transfer(address(this).balance);
    }

    function endPresale() external {
        require(msg.sender == owner, "Only owner");
        token.transfer(owner, token.balanceOf(address(this)));
    }
}
