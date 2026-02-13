import hardhatToolboxViemPlugin from "@nomicfoundation/hardhat-toolbox-viem";
import * as dotenv from "dotenv";
import { defineConfig } from "hardhat/config";
import hardhatVerify from "@nomicfoundation/hardhat-verify";

dotenv.config();

export default defineConfig({
  paths: {
    sources: "./code",
    ignition: "./deployment",
    artifacts: "./artifacts"
  },
  plugins: [hardhatVerify, hardhatToolboxViemPlugin],
  solidity: {
    profiles: {
      default: {
        version: "0.8.28",
      },
      production: {
        version: "0.8.28",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    },
  },
  networks: {
    bscTestnet: {
      type: "http",
      url: "https://bsc-testnet-dataseed.bnbchain.org",
      chainId: 97,
      gasPrice: 20000000000,
      accounts: {
        mnemonic: `${process.env.MNEMONIC}`,
      },
    },
  },
});
