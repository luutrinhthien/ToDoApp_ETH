import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv"
dotenv.config({ path: __dirname + "/.env" })

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_URL,
      accounts: [process.env.PRIV_KEY!],
    }
  },
  etherscan: {
    apiKey: process.env.API_KEY!
  }
};

export default config;
