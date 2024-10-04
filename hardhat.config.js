require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  solidity: "0.8.27", 
  networks: {
    mainnet: {
      url: process.env.ALCHEMY_API_URL, 
      accounts: [process.env.PRIVATE_KEY], 
    },
    holesky: {
      url: "https://eth-holesky.g.alchemy.com/v2/S433g3rPceebcv6GRTkDIdOrL0fXe9Sq", 
      accounts: [`0x${"0ca945c8491b505acd504a152146c994adaa125b21edae6d3dff70e157f01484"}`] 
    }
  },
};



