// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 minimumDollers = 5;

    // PAYABLE MENAS THAT FUNCTIONS CAN RECIVE ETHER
    
    function getPrice() view public returns(int) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int answer,,,) = dataFeed.latestRoundData();
        return answer;
    }

    function getConversionRate(int etherumAmount) public view returns(int) {
        int ethPrice = getPrice();
        int ethInUsd = (ethPrice * etherumAmount) / 1e18;
        return ethInUsd;
    }
}