
/****** Object:  Table [DbScriptMigration] ******/
IF OBJECT_ID (N'DbScriptMigration', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[DbScriptMigration](
		[MigrationId] [uniqueidentifier] NOT NULL,
		[MigrationName] [nvarchar](250) NOT NULL,
		[MigrationDate] [datetime] NOT NULL,
	CONSTRAINT [PK_DbScriptMigration] PRIMARY KEY CLUSTERED 
	(
		[MigrationId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [DbScriptMigration]!'
END


/****** Object:  Index [IX_DbScriptMigrationName] ******/
IF NOT EXISTS (SELECT * FROM sys.indexes 
	WHERE name='IX_DbScriptMigrationName' AND object_id = OBJECT_ID('dbo.DbScriptMigration')) 
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX [IX_DbScriptMigrationName] ON [dbo].[DbScriptMigration]
	(
		[MigrationName] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	
	PRINT 'Create index [IX_DbScriptMigrationName]!'
END

DECLARE @MigrationName AS VARCHAR(1000) = '000_CreateDbMigration'
IF NOT EXISTS (SELECT * FROM [dbo].[DbScriptMigration] WHERE [MigrationName]=@MigrationName )
BEGIN
	INSERT INTO [DbScriptMigration]
		(MigrationId, MigrationName, MigrationDate)
		VALUES
		(NEWID(), @MigrationName, GETDATE())

	PRINT 'Insert record ''000_CreateDbMigration'' into [DbScriptMigration]!'
END