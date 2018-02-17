pragma solidity ^0.4.18;

import "./ERC20Interface.sol";
import "./owned.sol";

contract CrazyToken is ERC20Interface, owned {
    string public constant symbol = "CRAZY";
    string public constant name = "CRAZY TOKEN";
    uint8 public constant decimals = 0;
    uint256 _totalSupply = 10000000000;

    mapping (address => uint256) _balances;

    mapping (address => mapping (address => uint256)) _allowed;
   
    function CrazyToken() public {
        _balances[_owner] = _totalSupply;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function transfer(address to, uint256 value) public returns (bool) {
        if (value > 0 && _balances[msg.sender] >= value && _balances[to] + value > _balances[to]) {
            _balances[msg.sender] -= value;
            _balances[to] += value;
            //Emit Event
            Transfer(msg.sender, to, value);
            return true;
        } else {
            return false;
        }
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        if (_allowed[from][to] >= value && value > 0 ) {
            if (_balances[from] >= value && _balances[to] + value > _balances[to]) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;   
        }
    }

    function approve(address spender, uint256 value) public returns (bool) {
        _allowed[msg.sender][spender] = value;
        Approval(msg.sender, spender, value);
        // We are not checking if the balance still allowing to do transaction. This will be checked in transferForm.
        
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

}