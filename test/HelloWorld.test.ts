import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("HelloWorld", function () {

  async function deployFixture() {

    // Contracts are deployed using the first signer/account by default
    const [owner, other] = await ethers.getSigners();

    const HelloWorld = await ethers.getContractFactory("HelloWorld");
    const hello = await HelloWorld.deploy();

    return { hello, owner, other };
  }

  it("Should get Hello World", async function () {
    const { hello, owner, other } = await loadFixture(deployFixture);
    expect(await hello.message()).to.equal("Hello World");
  });

});

