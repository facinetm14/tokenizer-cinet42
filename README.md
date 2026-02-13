# CinetK42

CinetK42 (FK42) is a fixed-supply ERC20 token built with Solidity and OpenZeppelin.
The full supply (10,000,000 FK42) is minted once at deployment and assigned to the initial owner.
This project uses Hardhat and Hardhat Ignition for deployment.

## Overview

- Standard: ERC20
- Name: CinetK42
- Symbol: FK42
- Total Supply: 10,000,000
- Decimals: 18
- Supply Model: Fixed
- Network: BSC Testnet (configurable)

The token is deployed using a constructor that mints the full supply to the deployer.

## Requirements

- Node.js
- Yarn (or npm)
- BSC Testnet account with test BNB

## Setup

Crate a .env file and set:

``` 
    MNEMONIC =  your secret recovery phrase backed up from you wallet 
    INITIAL_OWNER = your wallet address 
```

💡 You have differents wallet address by network, so make sure it's the one from BSC Testnet </br>
🚨 NEVER EVER SHARE YOUR MNEMONIC, OTHERWISE YOU'RE GIVING AWAY YOUR MONEY.
    

## Build

``` make ```

## Deploy to localhost

In order to deploy locally, you'll need to similute a network (Blockchain). You achieve so by running node tasks with this command : ``` make launch-node ```

And then ``` make deploy-dev ``` to finally deploy


## Deploy to BSC Testnet

``` make deploy ```

## Clean

``` make clean ```



