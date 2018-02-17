var CrazyToken = artifacts.require("./CrazyToken.sol");

contract('CrazyToken', function(accounts) {
  it("simpleTest", async function() {
    const instance = await CrazyToken.deployed();
  })
});
