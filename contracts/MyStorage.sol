// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyStorage {
    struct Person {
        string name;
        uint32 luckNumber;
    }

    Person public person = Person({name: "daniel", luckNumber: 0});

    // VIRTUAL IS ADDED TO MAKE THE FUNCTION OVERWRITEABLE
    function updateNumber(uint32 _luckNumber) public virtual{
        person.luckNumber = _luckNumber;
    }

    function getNumber() public view returns(uint32) {
        return person.luckNumber;
    }

}