// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Ownable.sol";

abstract contract Balances is Ownable {
     function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdraw(address payable _to) public override virtual onlyOwner {
        _to.transfer(getBalance());
    }
}

contract MyContract is Ownable, Balances {
    constructor (address _owner) {
        owner = _owner;
    }

    function withdraw(address payable _to) public override(Ownable, Balances) onlyOwner {
        // Balances.withdraw(_to);
        super.withdraw(_to);
    }
}