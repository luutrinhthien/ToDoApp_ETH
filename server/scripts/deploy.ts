import { ethers } from "hardhat";

async function main() {

  const ToDoList = await ethers.getContractFactory("ToDoList");
  const ToDo = await ToDoList.deploy();

  await ToDo.deployed();

  console.log(
    `ToDoList deployed to ${ToDo.address}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
