// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {MyStorage} from "./MyStorage.sol";

contract MySecondStorage is MyStorage {
    
        function updateNumber(uint32 _luckNumber) public override {
            person.luckNumber = _luckNumber + 10;
        }

}