pragma solidity ^0.6.10;

contract DAOWallet {
    mapping(address => uint) public balances;
    bool internal locked; //mutex

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    modifier noReentrant() {
        require(!locked, "No reentrancy!");
        locked = true;
        _;
        locked = false;
    }

    function withdraw(uint _amount) public noReentrant {
        require(balances[msg.sender] >= _amount);

        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "money transfer failed");

        balances[msg.sender] -= _amount; //should be before external function call to prevent reentrancy (checks effects interactions)
    }

    function getAccountBalance() public view returns (uint) {
        return address(this).balance;
    }

}