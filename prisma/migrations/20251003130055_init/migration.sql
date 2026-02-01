-- CreateTable
CREATE TABLE "PatientDetails" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "rgn" TEXT,
    "Pt_name" TEXT NOT NULL,
    "Pt_age" INTEGER NOT NULL,
    "Pt_age_pm" TEXT NOT NULL DEFAULT 'Years',
    "Pt_sex" TEXT NOT NULL,
    "Pt_wn" TEXT,
    "Pt_wn_rc" TEXT DEFAULT '+91',
    "rt" TEXT DEFAULT 'Dr.',
    "dn" TEXT,
    "dwn" TEXT,
    "drwa_code" TEXT DEFAULT '+91',
    "details" JSONB NOT NULL,
    "tests" JSONB NOT NULL,
    "status" TEXT DEFAULT 'pending',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Test" (
    "testcode" TEXT NOT NULL PRIMARY KEY,
    "testname" TEXT NOT NULL,
    "price" REAL NOT NULL DEFAULT 0,
    "Test" JSONB
);
