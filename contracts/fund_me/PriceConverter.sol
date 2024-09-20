
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
    
    function getPrice() internal view returns(int256) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
        (,int256 answer,,,) = dataFeed.latestRoundData();
        return answer;
    }

    function getConversionRate(uint256 etherumAmount) internal view returns(int256) {
        int256 ethPrice = getPrice();
        int256 ethInUsd = (int256(etherumAmount) * ethPrice) / 1e18;
        return ethInUsd;
    }

    
}