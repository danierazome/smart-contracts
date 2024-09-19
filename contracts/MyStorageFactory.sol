// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {MyStorage} from "./MyStorage.sol";


contract MyStorageFactory {
    
    MyStorage[] public store;

    function addStorage() public  {
        MyStorage newStorage = new MyStorage();
        store.push(newStorage);
    }

    function updateNumber(uint128 _index, uint32 luckNumver) public  {
        MyStorage s = store[_index];
        s.updateNumber(luckNumver);
    }

    function getStorage(uint128 _index) public view returns(uint32)  {
        MyStorage s = store[_index];
        return s.getNumber();
    }
}