/*
  Warnings:

  - You are about to drop the column `Test` on the `Test` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "Doctor" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "whatsapp_no" TEXT,
    "commission_rupee" REAL NOT NULL DEFAULT 0,
    "commission_percentage" REAL NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Test" (
    "testcode" TEXT NOT NULL PRIMARY KEY,
    "testname" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT 'Others',
    "testtype" TEXT NOT NULL DEFAULT 'SINGLE',
    "price" REAL NOT NULL DEFAULT 0,
    "parameters" JSONB
);
INSERT INTO "new_Test" ("category", "price", "testcode", "testname") SELECT "category", "price", "testcode", "testname" FROM "Test";
DROP TABLE "Test";
ALTER TABLE "new_Test" RENAME TO "Test";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Doctor_code_key" ON "Doctor"("code");
