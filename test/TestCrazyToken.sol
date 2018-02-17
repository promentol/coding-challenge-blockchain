pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CrazyToken.sol";

contract TestCrazyToken {
    function testOwnersFunds() public {
        CrazyToken token = CrazyToken(DeployedAddresses.CrazyToken());

        uint256 totalNumbers = token.totalSupply();
        uint256 balanceOfOwner = token.balanceOf(tx.origin);

        Assert.equal(balanceOfOwner, totalNumbers, "Owner Should have all funds"); 

    }
}
