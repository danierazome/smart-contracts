// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;
    int256 constant minimumDollers = 5;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmount;

    // PAYABLE MEANS THAT CONTRACT CAN RECIVE ETHER AND HAVE A BALANCE ASSOCIATED
    function fundMe() public payable  {
        require(msg.value.getConversionRate() >= minimumDollers);
        addressToAmount[msg.sender] = addressToAmount[msg.sender] + msg.value;
    }

    function withdraw() public IsOwner {
        require(owner == msg.sender);
        for (uint256 i=0; i < funders.length; i++) 
        {
            address funder = funders[i];
            addressToAmount[funder] = 0;
        }
        funders = new address[](0);
        // 3 DIFFERENT WAYS TO TRANSFER CRYPTO
        payable(msg.sender).transfer(address(this).balance);
        bool isSuccessful =payable(msg.sender).send(address(this).balance);
        require(isSuccessful, "Sending failed");
        (bool isOk, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(isOk, "Call failed"); // IT IS IMPORTANT TO REVERSE THE CHANGES;
    }
    
    // MODIFIER ARE USED TO ADD VALIDATIONS AND FUNCTIONALIES TO FUNCTIONS
    // _; DEFINE WHEN THE FUNCTION WILL BE EXECUTED
    modifier IsOwner() {
        //require(owner == msg.sender, "It is not the owner");
        if (owner != msg.sender) {revert NotOwner();}
        _;
    }

    // WHEN msg.data IS EMPTY AND ETHER IS SENT THIS FUNCTION IS CALLED
    receive() external payable {
        fundMe();
     }

    // WHEN THERE IS NOT DEFINE FUNCTION FOR THE CALL
    // THIS FUNCTION IS CALLED
     fallback() external payable {
        fundMe();
      }
}