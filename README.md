# AI Model Marketplace dApp

This is a decentralized application (dApp) that allows users to list, purchase, and rate AI models on the Ethereum blockchain. The marketplace features a smart contract that manages model listings, transactions, ratings, and fund withdrawals. The frontend interacts with the smart contract, enabling users to perform all necessary actions directly from their browser.

## Features

- **List a Model**: Creators can list their AI models for sale, specifying the model's name, description, and price.
- **Purchase a Model**: Users can purchase listed models by paying the specified price in Wei.
- **Rate a Model**: After purchasing, users can rate models on a scale of 1 to 5, which will be reflected in the model’s average rating.
- **Withdraw Funds**: Creators can withdraw the funds they earn from model sales.

## Technologies

- **Solidity**: Smart contracts are written in Solidity (v0.8.27).
- **Web3.js**: The frontend interacts with the Ethereum blockchain using Web3.js.
- **MetaMask**: Users interact with the dApp via MetaMask for Ethereum transactions.
- **HTML/CSS/JavaScript**: The frontend is built using standard web technologies.

## Smart Contract

The smart contract is deployed on the Holesky Ethereum test network and includes the following key functions:

- `listModel`: Allows creators to list AI models for sale.
- `purchaseModel`: Enables users to purchase models and transfers funds to the creator.
- `rateModel`: Lets users rate the models they have purchased.
- `withdrawFunds`: Creators can withdraw their earnings from model sales.

### Smart Contract Address

- **Contract Address**: `0x088FFCb25FD1D24c53EaFCf31BCb98E4BA815ce5` (Holesky Testnet)

## Setup Instructions

### Prerequisites

- **MetaMask**: Install [MetaMask](https://metamask.io/) to interact with the dApp.
- **Node.js & NPM**: Install [Node.js](https://nodejs.org/) and npm if you want to modify or run the project locally.

### Running the dApp Locally

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/ai-model-marketplace.git
   cd ai-model-marketplace

