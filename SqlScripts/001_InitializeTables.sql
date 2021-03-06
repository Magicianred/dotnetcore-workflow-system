-------------------- SCRIPT TO CHECK OF DbScriptMigrationSystem -------------------------------
DECLARE @MigrationName AS VARCHAR(1000) = '001_InitializeTables'

IF EXISTS(SELECT MigrationId FROM [DbScriptMigration] WHERE MigrationName = @MigrationName)
BEGIN 
    raiserror('MIGRATION ALREADY RUNNED ON THIS DB!!! STOP EXECUTION SCRIPT', 11, 0)
    SET NOEXEC ON
END

INSERT INTO [DbScriptMigration]
    (MigrationId, MigrationName, MigrationDate)
    VALUES
    (NEWID(), @MigrationName, GETDATE())
GO
PRINT 'Insert record into [DbScriptMigration]!'
-------------------- END SCRIPT TO CHECK OF DbScriptMigrationSystem ---------------------------

/****** Object:  Table [dbo].[EntitiesTypes] ******/
IF OBJECT_ID (N'EntitiesTypes', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[EntitiesTypes](
		[id] [int] NOT NULL,
		[name] [nvarchar](250) NOT NULL,
		[description] [nvarchar](500) NULL,
		[hasSoftDeleted] [bit] NOT NULL,
	CONSTRAINT [PK_EntitiesTypes] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	
	
	ALTER TABLE [dbo].[EntitiesTypes] ADD  CONSTRAINT [DF_EntitiesTypes_hasSoftDeleted]  DEFAULT ((0)) FOR [hasSoftDeleted]
	

	PRINT 'Create table [EntitiesTypes]!'
END

/****** Object:  Table [dbo].[WorkflowTypes] ******/
IF OBJECT_ID (N'WorkflowTypes', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowTypes](
		[id] [smallint] NOT NULL,
		[name] [nvarchar](250) NOT NULL,
		[description] [nvarchar](500) NULL,
	CONSTRAINT [PK_WorkflowTypes] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowTypes]!'
END

/****** Object:  Table [dbo].[Workflows] ******/
IF OBJECT_ID (N'Workflows', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[Workflows](
		[id] [int] NOT NULL,
		[typeId] [smallint] NOT NULL,
		[entityTypeId] [int] NOT NULL,
	CONSTRAINT [PK_Workflows] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [Workflows]!'
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_Workflows_EntitiesTypes')
BEGIN
	ALTER TABLE [dbo].[Workflows]  WITH CHECK ADD  CONSTRAINT [FK_Workflows_EntitiesTypes] FOREIGN KEY([entityTypeId])
	REFERENCES [dbo].[EntitiesTypes] ([id])
	

	ALTER TABLE [dbo].[Workflows] CHECK CONSTRAINT [FK_Workflows_EntitiesTypes]
	
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_Workflows_WorkflowsTypes')
BEGIN
	ALTER TABLE [dbo].[Workflows]  WITH CHECK ADD  CONSTRAINT [FK_Workflows_WorkflowsTypes] FOREIGN KEY([typeId])
	REFERENCES [dbo].[WorkflowTypes] ([id])
	
	ALTER TABLE [dbo].[Workflows] CHECK CONSTRAINT [FK_Workflows_WorkflowsTypes]
	
END

/****** Object:  Table [dbo].[WorkflowStatusTypes] ******/
IF OBJECT_ID (N'WorkflowStatusTypes', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowStatusTypes](
		[id] [smallint] NOT NULL,
		[name] [nvarchar](250) NOT NULL,
		[description] [nvarchar](500) NULL,
	CONSTRAINT [PK_WorkflowStatusTypes] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowStatusTypes]!'
END

/****** Object:  Table [dbo].[WorkflowStatuses] ******/
IF OBJECT_ID (N'WorkflowStatuses', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowStatuses](
		[id] [int] NOT NULL,
		[workflowId] [int] NOT NULL,
		[name] [nvarchar](250) NOT NULL,
		[description] [nvarchar](500) NULL,
		[typeId] [smallint] NOT NULL,
	CONSTRAINT [PK_WorkflowStatuses] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowStatuses]!'
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowStatuses_WorkflowStatusTypes')
BEGIN
	ALTER TABLE [dbo].[WorkflowStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowStatuses_WorkflowStatusTypes] FOREIGN KEY([typeId])
	REFERENCES [dbo].[WorkflowStatusTypes] ([id])
	
	ALTER TABLE [dbo].[WorkflowStatuses] CHECK CONSTRAINT [FK_WorkflowStatuses_WorkflowStatusTypes]
	
END


/****** Object:  Table [dbo].[WorkflowNextStatuses] ******/
IF OBJECT_ID (N'WorkflowNextStatuses', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowNextStatuses](
		[id] [int] NOT NULL,
		[initialStatusId] [int] NOT NULL,
		[nextStatusId] [int] NOT NULL,
	CONSTRAINT [PK_WorkflowNextStatuses] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	

	PRINT 'Create table [WorkflowNextStatuses]!'
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatuses_WorkflowStatuses_Initial')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatuses_WorkflowStatuses_Initial] FOREIGN KEY([initialStatusId])
	REFERENCES [dbo].[WorkflowStatuses] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatuses] CHECK CONSTRAINT [FK_WorkflowNextStatuses_WorkflowStatuses_Initial]
	
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatuses_WorkflowStatuses_Next')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatuses_WorkflowStatuses_Next] FOREIGN KEY([nextStatusId])
	REFERENCES [dbo].[WorkflowStatuses] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatuses] CHECK CONSTRAINT [FK_WorkflowNextStatuses_WorkflowStatuses_Next]
	
END


/****** Object:  Table [dbo].[EntitiesBase] ******/
IF OBJECT_ID (N'EntitiesBase', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[EntitiesBase](
		[entityId] [int] NOT NULL,
		[name] [nvarchar](250) NOT NULL,
		[description] [nvarchar](500) NULL,
		[entityTypeId] [int] NOT NULL,
		[workflowStatusId] [int] NOT NULL,
	CONSTRAINT [PK_EntitiesBase] PRIMARY KEY CLUSTERED 
	(
		[entityId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [EntitiesBase]!'
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_EntitiesBase_EntitiesTypes')
BEGIN
	ALTER TABLE [dbo].[EntitiesBase]  WITH CHECK ADD  CONSTRAINT [FK_EntitiesBase_EntitiesTypes] FOREIGN KEY([entityTypeId])
	REFERENCES [dbo].[EntitiesTypes] ([id])
	

	ALTER TABLE [dbo].[EntitiesBase] CHECK CONSTRAINT [FK_EntitiesBase_EntitiesTypes]
	
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_EntitiesBase_WorkflowStatuses')
BEGIN
	ALTER TABLE [dbo].[EntitiesBase]  WITH CHECK ADD  CONSTRAINT [FK_EntitiesBase_WorkflowStatuses] FOREIGN KEY([workflowStatusId])
	REFERENCES [dbo].[WorkflowStatuses] ([id])
	
	ALTER TABLE [dbo].[EntitiesBase] CHECK CONSTRAINT [FK_EntitiesBase_WorkflowStatuses]
	
END


/****** Object:  Table [dbo].[EntitiesWorkflowStatuses] ******/
IF OBJECT_ID (N'EntitiesWorkflowStatuses', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[EntitiesWorkflowStatuses](
		[id] [int] NOT NULL,
		[entityId] [int] NOT NULL,
		[entityTypeId] [int] NOT NULL,
		[workflowStatusId] [int] NOT NULL,
	CONSTRAINT [FK_EntitiesWorkflowStatuses] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [EntitiesWorkflowStatuses]!'
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_EntitiesWorkflowStatuses_EntitiesTypes')
BEGIN
	ALTER TABLE [dbo].[EntitiesWorkflowStatuses]  WITH CHECK ADD  CONSTRAINT [FK_EntitiesWorkflowStatuses_EntitiesTypes] FOREIGN KEY([entityTypeId])
	REFERENCES [dbo].[EntitiesTypes] ([id])
	

	ALTER TABLE [dbo].[EntitiesWorkflowStatuses] CHECK CONSTRAINT [FK_EntitiesWorkflowStatuses_EntitiesTypes]
	
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_EntitiesWorkflowStatuses_WorkflowStatuses')
BEGIN
	ALTER TABLE [dbo].[EntitiesWorkflowStatuses]  WITH CHECK ADD  CONSTRAINT [FK_EntitiesWorkflowStatuses_WorkflowStatuses] FOREIGN KEY([workflowStatusId])
	REFERENCES [dbo].[WorkflowStatuses] ([id])
	
	ALTER TABLE [dbo].[EntitiesWorkflowStatuses] CHECK CONSTRAINT [FK_EntitiesWorkflowStatuses_WorkflowStatuses]
	
END

/****** Object:  Table [dbo].[WorkflowNextStatusesActionTypes] ******/
IF OBJECT_ID (N'WorkflowNextStatusesActionTypes', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowNextStatusesActionTypes](
		[id] [smallint] NOT NULL,
		[name] [nvarchar](50) NOT NULL,
		[description] [nvarchar](500) NULL,
	CONSTRAINT [PK_WorkflowActionTypes] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowNextStatusesActionTypes]!'
END

/****** Object:  Table [dbo].[WorkflowNextStatusesActions] ******/
IF OBJECT_ID (N'WorkflowNextStatusesActions', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowNextStatusesActions](
		[id] [smallint] NOT NULL,
		[typeId] [smallint] NOT NULL,
		[workflowNextStatusId] [int] NOT NULL,
	CONSTRAINT [PK_WorkflowActions] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowNextStatusesActions]!'
END


IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatusesActions_WorkflowActionNextStatusesTypes')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatusesActions]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowActionNextStatusesTypes] FOREIGN KEY([typeId])
	REFERENCES [dbo].[WorkflowNextStatusesActionTypes] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatusesActions] CHECK CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowActionNextStatusesTypes]
	
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatusesActions_WorkflowNextStatuses')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatusesActions]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowNextStatuses] FOREIGN KEY([workflowNextStatusId])
	REFERENCES [dbo].[WorkflowNextStatuses] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatusesActions] CHECK CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowNextStatuses]
	
END


/****** Object:  Table [dbo].[WorkflowNextStatusesRequirementTypes] ******/
IF OBJECT_ID (N'WorkflowNextStatusesRequirementTypes', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowNextStatusesRequirementTypes](
		[id] [smallint] NOT NULL,
		[name] [nvarchar](50) NOT NULL,
		[description] [nvarchar](500) NULL,
	CONSTRAINT [PK_WorkflowRequirementTypes] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowNextStatusesRequirementTypes]!'
END

/****** Object:  Table [dbo].[WorkflowNextStatusesRequirements] ******/
IF OBJECT_ID (N'WorkflowNextStatusesRequirements', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowNextStatusesRequirements](
		[id] [int] NOT NULL,
		[typeId] [smallint] NOT NULL,
		[workflowNextStatusId] [int] NOT NULL,
	CONSTRAINT [PK_WorkflowRequirements] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowNextStatusesRequirements]!'
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatusesRequirements_WorkflowNextStatuses')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatusesRequirements]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesRequirements_WorkflowNextStatuses] FOREIGN KEY([workflowNextStatusId])
	REFERENCES [dbo].[WorkflowNextStatuses] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatusesRequirements] CHECK CONSTRAINT [FK_WorkflowNextStatusesRequirements_WorkflowNextStatuses]
	
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatusesRequirements_WorkflowNextStatusesRequirementsTypes')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatusesRequirements]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesRequirements_WorkflowNextStatusesRequirementsTypes] FOREIGN KEY([typeId])
	REFERENCES [dbo].[WorkflowNextStatusesRequirementTypes] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatusesRequirements] CHECK CONSTRAINT [FK_WorkflowNextStatusesRequirements_WorkflowNextStatusesRequirementsTypes]
	
END


/****** Object:  Table [dbo].[WorkflowRoles] ******/
IF OBJECT_ID (N'WorkflowRoles', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowRoles](
		[id] [int] NOT NULL,
		[name] [nvarchar](100) NOT NULL,
		[description] [nvarchar](250) NULL,
		[workflowId] [int] NULL,
	CONSTRAINT [PK_WorkflowRoles] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowRoles]!'
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowRoles_Workflows')
BEGIN
	ALTER TABLE [dbo].[WorkflowRoles]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowRoles_Workflows] FOREIGN KEY([workflowId])
	REFERENCES [dbo].[Workflows] ([id])
	
	ALTER TABLE [dbo].[WorkflowRoles] CHECK CONSTRAINT [FK_WorkflowRoles_Workflows]
	
END


/****** Object:  Table [dbo].[WorkflowNextStatusesRoles] ******/
IF OBJECT_ID (N'WorkflowNextStatusesRoles', N'U') IS NULL
BEGIN
	CREATE TABLE [dbo].[WorkflowNextStatusesRoles](
		[id] [int] NOT NULL,
		[workflowRoleId] [int] NOT NULL,
		[workflowNextStatusId] [int] NOT NULL,
	CONSTRAINT [PK_WorkflowNextStatusRoles] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

	PRINT 'Create table [WorkflowNextStatusesRoles]!'
END


IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatusesRoles_WorkflowNextStatuses')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatusesRoles]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesRoles_WorkflowNextStatuses] FOREIGN KEY([workflowNextStatusId])
	REFERENCES [dbo].[WorkflowNextStatuses] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatusesRoles] CHECK CONSTRAINT [FK_WorkflowNextStatusesRoles_WorkflowNextStatuses]
	
END

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME ='FK_WorkflowNextStatusesRoles_WorkflowRoles')
BEGIN
	ALTER TABLE [dbo].[WorkflowNextStatusesRoles]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesRoles_WorkflowRoles] FOREIGN KEY([workflowRoleId])
	REFERENCES [dbo].[WorkflowRoles] ([id])
	
	ALTER TABLE [dbo].[WorkflowNextStatusesRoles] CHECK CONSTRAINT [FK_WorkflowNextStatusesRoles_WorkflowRoles]
	
END


---------------- FOOTER OF DbScriptMigrationSystem : REMEMBER TO INSERT -----------------------
SET NOEXEC OFF