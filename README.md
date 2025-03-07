# StudentManagement

Migrating data from Grade to FinalGrade:
UPDATE Enrollments SET FinalGrade = Grade WHERE Grade IS NOT NULL;

Migrating data from Credits to CreditsDecimal:
UPDATE Courses SET CreditsDecimal = CAST(Credits AS DECIMAL(5,2)) WHERE Credits IS NOT NULL;"
