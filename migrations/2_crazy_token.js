var Owned = artifacts.require("./owned.sol");
var CrazyToken = artifacts.require("./CrazyToken.sol");
module.exports = function (deployer) {
    deployer.deploy(Owned);
    deployer.link(Owned, CrazyToken);
    deployer.deploy(CrazyToken);
};