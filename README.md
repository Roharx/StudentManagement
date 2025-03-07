# StudentManagement

Migrating data from Grade to FinalGrade:
UPDATE Enrollments SET FinalGrade = Grade WHERE Grade IS NOT NULL;
