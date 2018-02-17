pragma solidity ^0.4.18;

/*
ERC20 interface
https://github.com/ethereum/eips/issues/20
*/

contract ERC20Interface {

    function totalSupply() public view returns (uint256);

    function balanceOf(address owner) public view returns (uint256);

    function transfer(address to, uint256 value) public returns (bool);

    function transferFrom(address from, address to, uint256 value) public returns (bool);

    function approve(address spender, uint256 value) public returns (bool);

    function allowance(address owner, address spender) public view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed to, uint256 value);
}