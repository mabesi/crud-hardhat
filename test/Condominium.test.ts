import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Condominium", function () {

  async function deployFixture() {

    // Contracts are deployed using the first signer/account by default
    const [manager, resident] = await ethers.getSigners();

    const Condominium = await ethers.getContractFactory("Condominium");
    const cc = await Condominium.deploy();

    return { cc, manager, resident };
  }

  it("Should be residence", async function () {
    const { cc, manager, resident } = await loadFixture(deployFixture);
    expect(await cc.residenceExists(2102)).to.equal(true);
  });

  it("Should be resident", async function () {
    const { cc, manager, resident } = await loadFixture(deployFixture);
    expect(await cc.isResident(resident.address)).to.equal(true);
  });

});

