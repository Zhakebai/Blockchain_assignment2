require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  networks: {
    rinkeby: {
      provider: () => new HDWalletProvider('your-mnemonic', `https://rinkeby.infura.io/v3/YOUR_INFURA_PROJECT_ID`),
      network_id: 4,       // Rinkeby's id
      gas: 5500000,        // Gas limit
    }
  }
  
};

