const { ethers } = require("hardhat");

ORDER_ADDRESS="0x63636eff2b9ba00bb4a90aa013743267b5507897";

async function main() {
  const [signer] = await ethers.getSigners();

  const order = (await ethers.getContractAt("GATOrder", ORDER_ADDRESS))
    .connect(signer);

  console.log(`cancelling order for ${signer.address}`);
  const cancellation = await order.cancel();
  await cancellation.wait();
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});