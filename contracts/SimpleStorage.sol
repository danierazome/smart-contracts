// SPDX-License-Identifier: MIT
pragma solidity  0.8.26;

contract SimpleStorage {
    uint64 public favoriteNumber;

    function store(uint64 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    struct Person {
        string name;
        uint age;
    }

    Person public daniel = Person("daniel", 10);

    Person public erazo = Person("erazo", 42); 

    // VIEW FUNCTION ONLY READ INFORMATION WHICH DOES NOT NEED TO PERFORMA TRANSACTION
    // ON THE BLOCKCHAIN
    function getStore() public view returns(uint64) {
        return favoriteNumber;
    }

    // PURE CAN NEITHER MODIFY NOR READ ANY STATE
    function calculate() public pure returns(int) {
        return 10 * 10;
    }

    Person[] public  persons;


    // MEMORY AND CALLBACK ARE TEMPORABLE VARIABLES WHICH 
    // ONLY LAST FOR THE FUNCTION EXECUTION
    // THE DIFERENCE BETWEEN MEMORY AND CALLBACK IS
    // THAT CALLBACK ARE INMUTABLE
    function pushPerson(string memory _name, uint _age) public {
        persons.push(Person(_name, _age));
        nameToAge[_name] = _age;
    }


    mapping (string => uint) public nameToAge;

}

