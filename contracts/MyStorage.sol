// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MyStorage {
    struct Person {
        string name;
        uint32 luckNumber;
    }

    Person public person = Person({name: "daniel", luckNumber: 0});

    function updateNumber(uint32 _luckNumber) public {
        person.luckNumber = _luckNumber;
    }

    function getNumber() public view returns(uint32) {
        return person.luckNumber;
    }

}