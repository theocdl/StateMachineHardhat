const {expect} = require("chai");

describe("Mini State Machine contract", function () {

  let MiniStateMachine;
  let hardhatMSM;
  let owner;
  let address1;

  beforeEach(async function () {
    // Get the ContractFactory and Signers here.
    MiniStateMachine = await ethers.getContractFactory("MiniStateMachine"); //NOM CONTRACT
    [owner, address1, address2] = await ethers.getSigners();

    hardhatMSM = await MiniStateMachine.deploy();
    await hardhatMSM.deployed();

    // We can interact with the contract by calling `hardhatToken.method()`
    await hardhatMSM.deployed();
  });

  describe("Deployment", function () {

    it("Set owner", async function () {
      expect(await hardhatMSM.owner()).to.equal(owner.address);
    });

  });

  describe("Change value", function () {
    let a;
    it("Owner change value by setValue", async function ()
    {
      await hardhatMSM.setValue(15);
      a =await hardhatMSM.getX();
      expect(a).to.equal(15);
    });

    it("Address1 can't change value by setValue", async function() {
      await expect(hardhatMSM.connect(address1).setValue(3)).to.be.revertedWith("You're not owner");
    });

    it("Owner change value by setValuePayable", async function()
    {
      await expect(hardhatMSM.connect(owner).setValuePayable(3)).to.be.revertedWith("Fonds insuffisants");
    });

    it("Address1 change value by setValuePayable without ETH", async function (){
      await expect(hardhatMSM.connect(address1).setValuePayable(3)).to.be.revertedWith("Fonds insuffisants");
    });

    it("Address1 change value by setValuePayable with ETH", async function (){
      const res = await hardhatMSM.connect(address1).setValuePayable(3,{
    value: 1});
    const res2 = await hardhatMSM.getX();
      expect(res2).to.equal(3);
    });
    });
    });
