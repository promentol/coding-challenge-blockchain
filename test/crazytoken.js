var CrazyToken = artifacts.require("./CrazyToken.sol");

contract('CrazyToken', function (accounts) {
  it("Owner should have all tokens", async function () {
    const instance = await CrazyToken.deployed({
      from: accounts[0]
    })
    const balanceOfOwner = await instance.balanceOf(accounts[0]);
    const initialSupply = await instance.totalSupply();
    assert.equal(balanceOfOwner.toNumber(), initialSupply.toNumber());
  })

  it("Owner should have all tokens", async function () {
    const instance = await CrazyToken.deployed({
      from: accounts[0]
    })
    const balanceOfUserNarekBefore = await instance.balanceOf(accounts[1]);
    assert.equal(balanceOfUserNarekBefore.toNumber(), 0);

    const FUNDS_TO_TRANSFER = 1000;

    await instance.transfer(accounts[1], FUNDS_TO_TRANSFER);

    const balanceOfUserNarekAfter = await instance.balanceOf(accounts[1]);
    assert.equal(balanceOfUserNarekAfter.toNumber(), FUNDS_TO_TRANSFER);

    const initialSupply = await instance.totalSupply();
    const balanceOfOwner = await instance.balanceOf(accounts[0]);

    assert.equal(balanceOfOwner.toNumber(), initialSupply.toNumber() - FUNDS_TO_TRANSFER);

  })

});
