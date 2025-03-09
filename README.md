# StudentManagement# Student Management Database Migration (State-Based)

This project demonstrates how to handle database migrations using a **State-Based Approach** with **safe, non-destructive schema changes**. Unlike the EF Code-First method, state-based migrations involve manually maintaining SQL scripts to reflect the latest database structure.

---

## **Migrations Overview**
The following schema changes were applied sequentially:

### **1. InitialSchema**
- Created the foundational tables:
  - `Students`
  - `Courses`
  - `Enrollments`

### **2. AddMiddleNameToStudent**
- Added a nullable `MiddleName` column to the `Students` table.
- **Reasoning:** A **non-destructive** approach was chosen since adding a nullable column does not affect existing data.

### **3. AddDateOfBirthToStudent**
- Added a `DateOfBirth` column to the `Students` table.
- **Reasoning:** This was a **safe change**, as the new column was nullable and did not affect existing data.

### **4. AddInstructorRelation**
- Introduced the `Instructors` table and a foreign key (`InstructorId`) in `Courses`.
- **Reasoning:** This was a **safe addition**, as new tables and foreign keys do not modify existing data.

### **5. RenameGradeToFinalGrade**
- Added a new column `FinalGrade` to `Enrollments` and migrated data from `Grade`.
- **Reasoning:** Instead of renaming the column directly (which is destructive), I **added a new column**, migrated data, and planned the removal of the old column in a future update.

### **6. AddDepartmentRelation**
- Introduced a `Departments` table and a relationship to `Instructors` (as Department Heads).
- **Reasoning:** A **safe operation**, as new tables and foreign key constraints do not modify existing records.

### **7. ModifyCourseCreditsType**
- Changed the `Credits` column in `Courses` from `int` to `decimal(5,2)`.
- **Reasoning:** Instead of altering the column type directly (which is destructive and can lead to data loss), a **non-destructive approach** was taken:
  1. Created a new column `CreditsDecimal`.
  2. Migrated data from `Credits`.
  3. Updated the application to use `CreditsDecimal`.
  4. *(Optional, Future Step)* The old column can be removed once the transition is complete.

---

## **Why Choose Non-Destructive Migrations?**
When modifying database schemas, **destructive changes** (such as renaming or changing data types) can lead to:
- **Data loss**
- **Downtime**
- **Breaking changes in the application**

To mitigate these risks, I followed **best practices** by:

- **Adding new columns instead of modifying existing ones**  
- **Migrating data before removing old structures (I have not removed them yet)**  
- **Ensuring application compatibility before deprecating columns**  

This approach allows for a **safe transition** between schema changes, minimizing risks in production environments.

---

## **Versioning Strategy**
Each schema change is stored as an SQL migration script in the **`Migrations/`** folder, using the **Flyway-style naming convention**:
- `V1__InitialSchema.sql`
- `V2__AddMiddleNameToStudent.sql`
- `V3__AddDateOfBirthToStudent.sql`
- `V4__AddInstructorRelation.sql`
- `V5__RenameGradeToFinalGrade.sql`
- `V6__AddDepartmentRelation.sql`
- `V7__ModifyCourseCreditsType.sql`

All changes are **manually applied** in sequence, ensuring a controlled migration process.

---

## **How to Apply Migrations**
To apply the latest migrations, follow these steps:

### **1. Ensure the database exists**
```sh
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -Q "CREATE DATABASE StudentManagement;"
```

### **2. Apply the Initial Schema**
```sh
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -d StudentManagement -i init-scripts/V1__InitialSchema.sql
```

### **3. Apply Each Migration in Order**
```sh
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -d StudentManagement -i Migrations/V2__AddMiddleNameToStudent.sql
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -d StudentManagement -i Migrations/V3__AddDateOfBirthToStudent.sql
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -d StudentManagement -i Migrations/V4__AddInstructorRelation.sql
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -d StudentManagement -i Migrations/V5__RenameGradeToFinalGrade.sql
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -d StudentManagement -i Migrations/V6__AddDepartmentRelation.sql
sqlcmd -S localhost,1433 -U sa -P StrongPass123! -d StudentManagement -i Migrations/V7__ModifyCourseCreditsType.sql
```

---

## **Next Steps**
🔍 **Monitor the database** for unused columns (`Enrollment:Grade`, `Course:Credits`) before removing them.  
⚙️ **Transition application code** to use the new columns before deprecating old ones.  
📌 **Ensure future migrations follow a non-destructive path** for safe schema evolution.  

---

