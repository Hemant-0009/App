-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Test" (
    "testcode" TEXT NOT NULL PRIMARY KEY,
    "testname" TEXT NOT NULL,
    "category" TEXT NOT NULL DEFAULT 'Others',
    "price" REAL NOT NULL DEFAULT 0,
    "Test" JSONB
);
INSERT INTO "new_Test" ("Test", "price", "testcode", "testname") SELECT "Test", "price", "testcode", "testname" FROM "Test";
DROP TABLE "Test";
ALTER TABLE "new_Test" RENAME TO "Test";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
