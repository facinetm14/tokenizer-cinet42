# CinetK42 - Technical Overview

This document explains the architecture, technology stack, choices, behind the CinetK42 (FK42) ERC20 token.

## Blockchain Platform

CinetK42 is deployed on BNB Smart Chain (BSC), a fully compatible Ethereum Virtual Machine blockchain

### Key Reasons

1. High-performance
2. Tooling compatibility
3. Lower transaction costs
4. Easy development and testing

## Repository Structure

```
root/
│
├── code/                   Contains our smart contract
│   └── CinetK42.sol
│
├── deployment/             Containt our deployment logic using hardhat ignition
│   └── modules/
│       └── CinetK42.ts
|
├── documentation/
│   └── README.md           Technical Overview 
|
├── hardhat.config.ts       Configuration 
|
├── package.json            Dependancies
│
└── README.md               Project Overview

```

## Stack

### Smart Contract Layer

- **Solidity** ^0.8.33 A statically-typed curly-braces programming language designed for developing smart contracts that run on Ethereum. Read more 👉 <a href='https://docs.soliditylang.org/en/v0.8.33/' title='https://docs.soliditylang.org/en/v0.8.33/'>here</a>

- **OpenZeppelin Contracts** is the battle-tested industry stantard library for building smart contract with solidity. It prevent us from reiventing the wheel, speed up our development process and minimize risk. Read more 👉 <a href='https://docs.openzeppelin.com/contracts' title='https://docs.openzeppelin.com/contracts'>here</a>


### Development Environment

- **Node.js / Yarn**
- **Hardhat /Hardhat Ignition** a flexible and extensible development environment for Ethereum software. It helps you write, test, debug, and deploy your smart contracts with ease. And Hardhat 3 is its deployment solution. Read more 👉 <a href='https://hardhat.org/docs/getting-started' title='https://hardhat.org/docs/getting-started'>here</a>
- **BSC Testnet Network**

### Token Standart

CinetK42 is **ERC20 standard**, which defines:

- `transfer`
- `transferFrom`
- `approve`
- `allowance`
- `balanceOf`
- `totalSupply`

Compliance ensures:

- Wallet compatibility (MetaMask, TrustWallet, etc.)
- DEX compatibility
- Standardized token behavior
- Ecosystem interoperability

Fixed Supply Model
- Total supply: **10,000,000 PK42**
- Minted once at deployment
- No additional minting possible

Rationale:
- Predictable supply
- No inflation risk
- Simplified trust model

Constructor-Based Minting

```Solidity

contract CinetK42 is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 10_000_000 * 10 ** 18;

    constructor(
        address initialOwner
    ) ERC20("CinetK42", "FK42") Ownable(initialOwner) {
        _mint(initialOwner, MAX_SUPPLY);
    }
}

```

## Security

- ### OpenZeppelin Usage

  Using OpenZeppelin ensures:
  - Audited ERC20 implementation
  - Safe math (Solidity 0.8+ built-in overflow checks)
  - Battle-tested access control
  - No custom token logic was implemented.

- ### No Mint Function

  There is:
  - No public mint function
  - No inflation mechanism
  - No hidden supply changes

  Supply is immutable after deployment.

## Deployment
  Deployment is handled using Hardhat Ignition. Ignition advantages:

  - Declarative deployment modules
  - Deterministic deployment tracking
  - Reconciliation of deployment state
  - Reduced human error

Deployment module passes deployer address as constructor argument:

```Ts 
export default buildModule("FK42Module", (m) => {
  const adress = `${process.env.INITIAL_OWNER}`;

  const FK42 = m.contract("CinetK42", [adress]);

  return { FK42 };
});

```

This ensures the deployer receives the total supply.
