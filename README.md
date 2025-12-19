# Condominium Voting System - Hardhat Smart Contract

[![Solidity](https://img.shields.io/badge/Solidity-0.8.17-blue)](https://soliditylang.org/)
[![Hardhat](https://img.shields.io/badge/Hardhat-2.14.1-yellow)](https://hardhat.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

> 🇧🇷 [Versão em Português](./README-PT.md)

A simple and educational example of a **Condominium Voting System** built with Solidity and Hardhat. This project demonstrates CRUD operations, access control patterns, and voting mechanisms on the Ethereum blockchain.

Perfect for beginners learning smart contract development! 🚀

---

## 📋 Table of Contents

- [About the Project](#-about-the-project)
- [Features](#-features)
- [Technologies](#-technologies)
- [Project Structure](#-project-structure)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Configuration](#-configuration)
- [Usage](#-usage)
- [Testing](#-testing)
- [Deployment](#-deployment)
- [Smart Contract Overview](#-smart-contract-overview)
- [Learning Resources](#-learning-resources)
- [License](#-license)

---

## 🎯 About the Project

This project simulates a **condominium management system** where residents can:
- Register and manage residents
- Create discussion topics
- Vote on proposals
- Track voting results

The smart contract implements common blockchain patterns like:
- **Ownable Pattern** (manager role)
- **Access Control** (manager, counselors, residents)
- **CRUD Operations** (Create, Read, Update, Delete)
- **State Machine** (topic status management)

---

## ✨ Features

### 👥 Resident Management
- ✅ Add residents to specific units (apartments)
- ✅ Remove residents
- ✅ Assign counselor roles
- ✅ Transfer manager ownership

### 📝 Topic Management
- ✅ Create discussion topics
- ✅ Remove idle topics
- ✅ Open topics for voting
- ✅ Close voting and calculate results

### 🗳️ Voting System
- ✅ Vote YES, NO, or ABSTENTION
- ✅ One vote per residence
- ✅ Automatic result calculation
- ✅ Topic approval/denial based on votes

---

## 🛠️ Technologies

This project uses modern Web3 development tools:

- **[Solidity](https://soliditylang.org/)** `^0.8.17` - Smart contract programming language
- **[Hardhat](https://hardhat.org/)** `^2.14.1` - Ethereum development environment
- **[Ethers.js](https://docs.ethers.org/)** - Ethereum library for deployment and testing
- **[TypeScript](https://www.typescriptlang.org/)** - Type-safe development
- **[Chai](https://www.chaijs.com/)** - Testing assertions
- **[dotenv](https://www.npmjs.com/package/dotenv)** - Environment variable management

---

## 📁 Project Structure

```
crud-hardhat/
├── contracts/
│   └── Condominium.sol      # Main smart contract
├── scripts/
│   └── deploy.ts            # Deployment script
├── test/
│   └── Condominium.test.ts  # Comprehensive test suite
├── hardhat.config.ts        # Hardhat configuration
├── .env.example             # Environment variables template
├── package.json             # Project dependencies
└── tsconfig.json            # TypeScript configuration
```

---

## 📦 Prerequisites

Before you begin, ensure you have installed:

- **[Node.js](https://nodejs.org/)** (v16 or higher)
- **[npm](https://www.npmjs.com/)** or **[yarn](https://yarnpkg.com/)**
- A code editor (we recommend [VS Code](https://code.visualstudio.com/))
- Basic knowledge of JavaScript/TypeScript
- Basic understanding of blockchain concepts

---

## 🚀 Installation

1. **Clone the repository** (or download the project):
```bash
git clone <repository-url>
cd crud-hardhat
```

2. **Install dependencies**:
```bash
npm install
```

This will install:
- Hardhat and its toolbox
- Ethers.js for blockchain interactions
- Testing utilities
- TypeScript support

---

## ⚙️ Configuration

### 1. Create Environment File

Copy the example environment file:
```bash
cp .env.example .env
```

### 2. Configure Environment Variables

Edit the `.env` file with your credentials:

```env
# For local development (Ganache)
GANACHE_SECRET=your twelve word mnemonic phrase here

# For Ethereum testnet (Sepolia, Goerli, etc.)
ETHER_SECRET=your twelve word mnemonic phrase here

# For BSC testnet
BSC_SECRET=your twelve word mnemonic phrase here

# RPC Node URL (example for BSC testnet)
NODE_URL=https://data-seed-prebsc-1-s3.binance.org:8545

# Chain ID (97 for BSC testnet, 11155111 for Sepolia)
CHAIN_ID=97

# Block Explorer API Keys (for contract verification)
ETHERSCAN_API_KEY=your_etherscan_api_key
BSC_API_KEY=your_bscscan_api_key
```

### 3. Where to Get These Values

- **Mnemonic Phrase**: From your wallet (MetaMask, Trust Wallet, etc.)
  - ⚠️ **NEVER share your mainnet mnemonic!** Use testnet wallets only for learning
- **NODE_URL**: Get free RPC endpoints from:
  - [Infura](https://infura.io/)
  - [Alchemy](https://www.alchemy.com/)
  - [QuickNode](https://www.quicknode.com/)
- **API Keys**: Register at:
  - [Etherscan](https://etherscan.io/apis) for Ethereum
  - [BscScan](https://bscscan.com/apis) for BSC

---

## 💻 Usage

### Compile the Smart Contract

```bash
npx hardhat compile
```

This generates:
- `artifacts/` - Compiled contract artifacts
- `typechain-types/` - TypeScript type definitions

### Run Tests

```bash
npx hardhat test
```

Expected output:
```
  Condominium
    ✓ Should be residence
    ✓ Should add resident
    ✓ Should NOT add resident (not council or manager)
    ... (and many more tests)

  29 passing (2s)
```

### Deploy Locally

Start a local Hardhat node:
```bash
npx hardhat node
```

In another terminal, deploy:
```bash
npx hardhat run scripts/deploy.ts --network localhost
```

### Deploy to Testnet

Deploy to BSC testnet (or any configured network):
```bash
npx hardhat run scripts/deploy.ts --network bsctest
```

### Verify Contract on Block Explorer

After deployment, verify your contract:
```bash
npx hardhat verify --network bsctest <CONTRACT_ADDRESS>
```

---

## 🧪 Testing

The project includes **29 comprehensive tests** covering:

### Test Categories

1. **Residence Management**
   - Checking residence existence
   - Validating residence IDs

2. **Resident Operations**
   - Adding residents
   - Removing residents
   - Permission checks
   - Counselor restrictions

3. **Counselor Management**
   - Setting counselors
   - Removing counselors
   - Validation rules

4. **Manager Operations**
   - Transferring ownership
   - Permission validation

5. **Topic CRUD**
   - Creating topics
   - Removing topics
   - Status validation
   - Duplicate prevention

6. **Voting Flow**
   - Opening voting
   - Casting votes
   - Closing voting
   - Result calculation
   - Duplicate vote prevention

### Run Specific Tests

```bash
# Run all tests
npx hardhat test

# Run with gas reporting
REPORT_GAS=true npx hardhat test

# Run specific test file
npx hardhat test test/Condominium.test.ts
```

---

## 🚀 Deployment

### Local Deployment (for testing)

```bash
# Terminal 1: Start local node
npx hardhat node

# Terminal 2: Deploy
npx hardhat run scripts/deploy.ts --network localhost
```

### Testnet Deployment

1. **Get testnet tokens**:
   - BSC Testnet: [BSC Faucet](https://testnet.binance.org/faucet-smart)
   - Ethereum Sepolia: [Sepolia Faucet](https://sepoliafaucet.com/)

2. **Configure your network** in `hardhat.config.ts`

3. **Deploy**:
```bash
npx hardhat run scripts/deploy.ts --network bsctest
```

4. **Save the contract address** from the output:
```
Contract deployed to: 0xa018Fc9DecA4A08661Cb214f666538ED988fdfB3
```

---

## 📖 Smart Contract Overview

### Contract Architecture

```
Condominium.sol
├── Enums
│   ├── Status (IDLE, VOTING, APPROVED, DENIED)
│   └── Options (EMPTY, YES, NO, ABSTENTION)
├── Structs
│   ├── Topic (title, description, status, dates)
│   └── Vote (resident, residence, option, timestamp)
├── State Variables
│   ├── manager (address)
│   ├── residences (mapping)
│   ├── residents (mapping)
│   ├── counselors (mapping)
│   ├── topics (mapping)
│   └── votings (mapping)
└── Functions
    ├── Resident Management (add, remove, check)
    ├── Counselor Management (set, remove)
    ├── Manager Management (transfer ownership)
    ├── Topic Management (add, remove, get)
    └── Voting (open, vote, close, count)
```

### Key Concepts

#### 1. **Residence System**
The contract manages 50 residences (apartments):
- 2 blocks (1000, 2000)
- 5 floors per block (100-500)
- 5 units per floor (1-5)
- Example: `2102` = Block 2, Floor 1, Unit 2

#### 2. **Access Control**
Three permission levels:
- **Manager**: Full control (initially the deployer)
- **Counselors**: Can add residents
- **Residents**: Can create topics and vote

#### 3. **Topic Lifecycle**
```
IDLE → VOTING → APPROVED/DENIED
  ↓       ↓
DELETE   CLOSE
```

#### 4. **Voting Rules**
- One vote per residence (not per person)
- Options: YES, NO, ABSTENTION
- Approval: YES votes > NO votes
- Manager closes voting and calculates results

---

## 📚 Learning Resources

### Recommended Learning Path

1. **Blockchain Basics**
   - [Blockchain Demo](https://andersbrownworth.com/blockchain/)
   - [Ethereum Whitepaper](https://ethereum.org/en/whitepaper/)

2. **Solidity**
   - [Solidity Documentation](https://docs.soliditylang.org/)
   - [CryptoZombies](https://cryptozombies.io/)
   - [Solidity by Example](https://solidity-by-example.org/)

3. **Hardhat**
   - [Hardhat Documentation](https://hardhat.org/docs)
   - [Hardhat Tutorial](https://hardhat.org/tutorial)

4. **Testing**
   - [Hardhat Testing Guide](https://hardhat.org/hardhat-runner/docs/guides/test-contracts)
   - [Chai Matchers](https://hardhat.org/hardhat-chai-matchers/docs/overview)

### Next Steps

After mastering this project, try:
- Adding events for important actions
- Implementing time-based voting deadlines
- Creating a frontend with React + Ethers.js
- Adding weighted voting (by residence size)
- Implementing proposal categories
- Adding quorum requirements

---

## 🤝 Contributing

This is an educational project. Feel free to:
- Report bugs
- Suggest improvements
- Create pull requests
- Use it as a learning template

---

## 📄 License

This project is licensed under the **MIT License** - see the contract header for details.

---

## ⚠️ Security Notice

**This is an educational project!** 

- ⚠️ Not audited for production use
- ⚠️ Use testnet tokens only
- ⚠️ Never share your private keys or mnemonic phrases
- ⚠️ Review and understand the code before deploying

---

## 📞 Support

If you're learning and have questions:
- Read the [Hardhat Documentation](https://hardhat.org/docs)
- Check [Ethereum Stack Exchange](https://ethereum.stackexchange.com/)
- Join [Hardhat Discord](https://hardhat.org/discord)

---

**Happy Learning! 🎓✨**

Built with ❤️ for blockchain education
