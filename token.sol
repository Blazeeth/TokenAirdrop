// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
      }
contract token {
    address public owner;

  constructor(){
   owner = msg.sender;
      }
  
   modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
      }
  
  function airdropTokens(address token, address[] memory recipients, uint256[] memory amounts) external onlyOwner {
        require(recipients.length == amounts.length, "Mismatched arrays");
   
         IERC20 erc20 = IERC20(token);
        for (uint256 i = 0; i < recipients.length; i++) {
            require(recipients[i] != address(0), "Invalid address");
            erc20.transfer(recipients[i], amounts[i]);
                }
            }

  }
