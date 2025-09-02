/*
  Warnings:

  - The values [ADMIN] on the enum `MemberRole` will be removed. If these variants are still used in the database, this will fail.
  - The values [IMAGE,SYSTEM] on the enum `MessageType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "public"."MemberRole_new" AS ENUM ('OWNER', 'MEMBER');
ALTER TABLE "public"."room_members" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "public"."room_members" ALTER COLUMN "role" TYPE "public"."MemberRole_new" USING ("role"::text::"public"."MemberRole_new");
ALTER TYPE "public"."MemberRole" RENAME TO "MemberRole_old";
ALTER TYPE "public"."MemberRole_new" RENAME TO "MemberRole";
DROP TYPE "public"."MemberRole_old";
ALTER TABLE "public"."room_members" ALTER COLUMN "role" SET DEFAULT 'MEMBER';
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "public"."MessageType_new" AS ENUM ('TEXT', 'FILE');
ALTER TABLE "public"."messages" ALTER COLUMN "type" DROP DEFAULT;
ALTER TABLE "public"."messages" ALTER COLUMN "type" TYPE "public"."MessageType_new" USING ("type"::text::"public"."MessageType_new");
ALTER TYPE "public"."MessageType" RENAME TO "MessageType_old";
ALTER TYPE "public"."MessageType_new" RENAME TO "MessageType";
DROP TYPE "public"."MessageType_old";
ALTER TABLE "public"."messages" ALTER COLUMN "type" SET DEFAULT 'TEXT';
COMMIT;
