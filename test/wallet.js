const { expect } = require("chai");

describe("Wallet", function() {
    it("should deposit Ether", async function() {
        const Wallet = await ethers.getContractFactory("Wallet");
        const wallet = await Wallet.deploy();

        await wallet.deposit({ value: 100 });
        const balance = await wallet.balances(accounts[0]);

        expect(balance).to.equal(100);
    });
});
