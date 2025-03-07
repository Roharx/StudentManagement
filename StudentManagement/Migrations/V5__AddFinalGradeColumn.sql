BEGIN TRANSACTION;
ALTER TABLE [Enrollments] ADD [FinalGrade] nvarchar(max) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250307103244_AddFinalGradeColumn', N'9.0.2');

COMMIT;
GO

