const { ethers, network } = require("hardhat")
const SuperfluidSDK = require("@superfluid-finance/js-sdk")
const { env } = require("process")
let { goerli } = require("../addresses.json")
const { ConstantFlowAgreementV1, Framework } = require("@superfluid-finance/sdk-core")
const env_addresses = goerli

async function main() {
    const signer = ethers.provider.getSigner()
    const sf = await Framework.create({
        chainId: 5,
        provider,
    })

    await sf.initialize()
    const signerSuperfluid = sf.user({
        address: signer.address,
        token: env_addresses.fusdcx.address, // address of the Super Token
    })

    const config = {
        hostAddress: env_addresses.host,
        cfaV1Address: env_addresses.cfav1,
        idaV1Address: env_addresses.idav1,
    }

    const cfaV1 = new ConstantFlowAgreementV1({ options: config })
    const SmartCowsFactory = await ethers.getContractFactory("SmartCoWOrders")
    const SmartCows = await SmartCowsFactory.deploy(env_addresses.host, env_addresses.settlement)

    await SmartCows.deployed()
    console.log("SmartCows deployed to", SmartCows.address)
    // deploy smartCows
    // upgrade my ethx
    // authorize smart cows to spend my ethx

    const token = await ethers.getContractAt("IERC20", env_addresses.fusdc)
    const supertoken = await ethers.getContractAt("ISuperToken", env_addresses.fusdcx)
    console.log("upgrading...")
    await token.approve(supertoken.address, ethers.constants.MaxUint256)
    await supertoken.upgrade(ethers.utils.parseEther("0.1"))
    console.log("fusdcx balance...")

    console.log(await supertoken.balanceOf(signer.getAddress()))

    console.log("Approving smart cow for flow...")

    const flowRate = 385802469135 // 1 per month
    await sf.cfaV1.updateFlowOperatorPermissions({
        flowOperator: SmartCows.address,
        permissions: 1, // should enter 1-7
        flowRateAllowance: flowRate,
        superToken: env_addresses.fusdcx,
    })

    console.log("Set up done")
    console.log("Placing Order")

    const data = {
        sellToken: env_addresses.fusdc,
        buyToken: env_addresses.weth,
        receiver: ethers.constants.AddressZero,
        sellAmount: ethers.utils.parseEther("10000"),
        buyAmount: ethers.utils.parseEther("1"),
        deadline: 3660 * 24 * 7,
        feeAmount: ethers.utils.parseEther("10"),
        meta: "0x",
    }

    const placeTx = await SmartCows.place(data, env_addresses.fusdcx, flowRate)
    const myInstance = await SmartCows.addressToContract(signer.address)
    console.log(myInstance)

    // place(
    //     SmartCoWOrder.Data calldata data,
    //     ISuperToken superToken,
    //     int96 flowRate
    // )
}

main().catch((error) => {
    console.error(error)
    process.exit(1)
})
