import { PrismaClient } from "./generated/prisma";

const prisma = new PrismaClient();

prisma
  .$connect()
  .then(() => console.log("✅ Database connected"))
  .catch((err) => console.error("❌ Database connection failed:", err));

export default prisma;
