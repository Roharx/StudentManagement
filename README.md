# Student Management Database Migration

This project demonstrates how to handle database migrations using **Entity Framework Core** with a focus on **safe, non-destructive schema changes**. The migrations follow a structured approach using the **EF Code-First** methodology.

---

## **Migrations Overview**
The following migrations were applied in sequence:

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
- **Reasoning:** This was a **safe change** as the new column was nullable.

### **4. AddInstructorRelation**
- Introduced the `Instructors` table and a foreign key (`InstructorId`) in `Courses`.
- **Reasoning:** This was a **safe** addition since new tables and foreign keys do not affect existing data.

### **5. RenameGradeToFinalGrade**
- Renamed `Grade` to `FinalGrade` in `Enrollments`.
- **Reasoning:** Instead of renaming the column directly (which is destructive), I **added a new column** `FinalGrade`, migrated data from `Grade`, and planned for the removal of the old column in a future migration.

### **6. AddDepartmentRelation**
- Introduced a `Departments` table and a relationship to `Instructors` (as Department Heads).
- **Reasoning:** A **safe operation**, as new tables and foreign key constraints do not modify existing records.

### **7. ModifyCourseCreditsType**
- Changed the `Credits` column in `Courses` from `int` to `decimal(5,2)`.
- **Reasoning:** Instead of altering the column type directly (which is destructive and can lead to data loss), a **non-destructive approach** was taken:
  1. Created a new column `CreditsDecimal`.
  2. Migrated data from `Credits`.
  3. Updated the application to use `CreditsDecimal`.
  4. *(Optional)* The old column can be removed in a future migration.

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
I have also generated SQL files for each change. **EF Core does not inherently follow versioned styles** (e.g., `V1__name1`, `V2__name2`) like Flyway. Instead, EF generates C# migration files with **timestamps** (e.g., `20250305132123_name`).

I personally prefer having SQL migration files, as they make it easier to **review schema changes at a glance**. To generate them, I manually use EF commands instead of relying on automatic versioning.

---

## **How to Apply Migrations**
To apply the latest migrations, run:

```sh
# Apply all migrations to the database
dotnet ef database update
```

If you had the initial database and need to apply migrations:

```sql
# Migrating data from Grade to FinalGrade
UPDATE Enrollments SET FinalGrade = Grade WHERE Grade IS NOT NULL;
```

```sql
# Migrating data from Credits to CreditsDecimal
UPDATE Courses SET CreditsDecimal = CAST(Credits AS DECIMAL(5,2)) WHERE Credits IS NOT NULL;
```

---

## **Next Steps**
🔍 **Monitor the database** for unused columns (`Enrollment:Grade`, `Course:Credits`) before removing them.  
⚙️ **Transition application code** to use the new columns before deprecating old ones.  
📌 **Ensure future migrations follow a non-destructive path** for safe schema evolution.  

---
