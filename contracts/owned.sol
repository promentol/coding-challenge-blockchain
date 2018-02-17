pragma solidity ^0.4.18;

contract owned {
    address _owner;

    modifier onlyOwner() {
       if (msg.sender == _owner) {
          _;
       }
    }

    function owned() public {
        _owner = msg.sender;
    }
}