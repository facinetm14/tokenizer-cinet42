import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import * as dotenv from "dotenv";
dotenv.config();

export default buildModule("FK42Module", (m) => {
  const adress = `${process.env.INITIAL_OWNER}`;

  const FK42 = m.contract("CinetK42", [adress]);

  return { FK42 };
});
