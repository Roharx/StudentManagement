BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [MiddleName] nvarchar(max) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250307090942_AddMiddleNameToStudent', N'9.0.2');

ALTER TABLE [Students] ADD [DateOfBirth] datetime2 NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250307092619_AddDateOfBirthToStudent', N'9.0.2');

COMMIT;
GO

