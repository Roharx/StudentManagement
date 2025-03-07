BEGIN TRANSACTION;
ALTER TABLE [Courses] ADD [CreditsDecimal] decimal(18,2) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250307114004_AddDecimalCreditsToCourse', N'9.0.2');

COMMIT;
GO

