const { ethers } = require("hardhat");
let { gnosis } = require("../addresses.json");
const env_addresses = gnosis;

async function main() {

    const whale = await ethers.getImpersonatedSigner("0x7f90122BF0700F9E7e1F688fe926940E8839F353"); // Viper contract lmao

    const SmartCowsFactory = await ethers.getContractFactory("SmartCoWOrders");
    const SmartCows = await SmartCowsFactory.deploy(
        env_addresses.host, env_addresses.settlement
    );

    // await SmartCows.deployed();

    // console.log(env_addresses.usdcx);

    // const supertoken = (await ethers.getContractAt("ISuperToken", env_addresses.usdcx)).connect(whale);

    // console.log(supertoken);

    // await supertoken.upgrade(
    //     ethers.utils.parseEther(2000)
    // );

    // console.log(
    //     await whale.getAddress()
    // );

    // console.log(
    //     await supertoken.balanceOf(whale.getAddress())
    // );

    // console.log(`SmartCows deployed to ${SmartCows.address}`);
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});