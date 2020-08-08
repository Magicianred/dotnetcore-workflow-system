

/****** Object:  Table [dbo].[EntitiesTypes]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowNextStatuses]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowNextStatuses](
	[id] [int] NOT NULL,
	[initialStatusId] [int] NOT NULL,
	[nextStatusId] [int] NOT NULL,
 CONSTRAINT [PK_WorkflowNextStatuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowNextStatusesActions]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowNextStatusesActions](
	[id] [smallint] NOT NULL,
	[typeId] [smallint] NOT NULL,
	[workflowNextStatusId] [int] NOT NULL,
 CONSTRAINT [PK_WorkflowActions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowNextStatusesActionTypes]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowNextStatusesActionTypes](
	[id] [smallint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_WorkflowActionTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowNextStatusesRequirements]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowNextStatusesRequirements](
	[id] [int] NOT NULL,
	[typeId] [smallint] NOT NULL,
	[workflowNextStatusId] [int] NOT NULL,
 CONSTRAINT [PK_WorkflowRequirements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowNextStatusesRequirementTypes]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowNextStatusesRequirementTypes](
	[id] [smallint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_WorkflowRequirementTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowNextStatusesRoles]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowNextStatusesRoles](
	[id] [int] NOT NULL,
	[roleId] [int] NOT NULL,
	[workflowNextStatusId] [int] NOT NULL,
 CONSTRAINT [PK_WorkflowNextStatusRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workflows]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflows](
	[id] [int] NOT NULL,
	[typeId] [smallint] NOT NULL,
	[entityTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Workflows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowStatuses]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[WorkflowStatusTypes]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowStatusTypes](
	[id] [smallint] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_WorkflowStatusTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowTypes]    Script Date: 8/8/2020 10:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowTypes](
	[id] [smallint] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_WorkflowTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntitiesTypes] ADD  CONSTRAINT [DF_EntitiesTypes_hasSoftDeleted]  DEFAULT ((0)) FOR [hasSoftDeleted]
GO
ALTER TABLE [dbo].[WorkflowNextStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatuses_WorkflowNextStatuses_Initial] FOREIGN KEY([initialStatusId])
REFERENCES [dbo].[WorkflowNextStatuses] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatuses] CHECK CONSTRAINT [FK_WorkflowNextStatuses_WorkflowNextStatuses_Initial]
GO
ALTER TABLE [dbo].[WorkflowNextStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatuses_WorkflowNextStatuses_Next] FOREIGN KEY([nextStatusId])
REFERENCES [dbo].[WorkflowNextStatuses] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatuses] CHECK CONSTRAINT [FK_WorkflowNextStatuses_WorkflowNextStatuses_Next]
GO

ALTER TABLE [dbo].[WorkflowNextStatusesActions]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowActionNextStatusesTypes] FOREIGN KEY([typeId])
REFERENCES [dbo].[WorkflowNextStatusesActionTypes] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatusesActions] CHECK CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowActionNextStatusesTypes]
GO
ALTER TABLE [dbo].[WorkflowNextStatusesActions]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowNextStatuses] FOREIGN KEY([workflowNextStatusId])
REFERENCES [dbo].[WorkflowNextStatuses] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatusesActions] CHECK CONSTRAINT [FK_WorkflowNextStatusesActions_WorkflowNextStatuses]
GO


ALTER TABLE [dbo].[WorkflowNextStatusesRequirements]  WITH CHECK ADD  CONSTRAINT [WorkflowNextStatusesRequirements_WorkflowNextStatuses] FOREIGN KEY([workflowNextStatusId])
REFERENCES [dbo].[WorkflowNextStatuses] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatusesRequirements] CHECK CONSTRAINT [WorkflowNextStatusesRequirements_WorkflowNextStatuses]
GO
ALTER TABLE [dbo].[WorkflowNextStatusesRequirements]  WITH CHECK ADD  CONSTRAINT [WorkflowNextStatusesRequirements_WorkflowNextStatusesRequirementsTypes] FOREIGN KEY([typeId])
REFERENCES [dbo].[WorkflowNextStatusesRequirementTypes] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatusesRequirements] CHECK CONSTRAINT [WorkflowNextStatusesRequirements_WorkflowNextStatusesRequirementsTypes]
GO


ALTER TABLE [dbo].[WorkflowNextStatusesRoles]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesRoles_WorkflowNextStatuses] FOREIGN KEY([workflowNextStatusId])
REFERENCES [dbo].[WorkflowNextStatuses] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatusesRoles] CHECK CONSTRAINT [FK_WorkflowNextStatusesRoles_WorkflowNextStatuses]
GO
ALTER TABLE [dbo].[WorkflowNextStatusesRoles]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowNextStatusesRoles_Roles] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[WorkflowNextStatusesRoles] CHECK CONSTRAINT [FK_WorkflowNextStatusesRoles_Roles]
GO



ALTER TABLE [dbo].[Workflows]  WITH CHECK ADD  CONSTRAINT [FK_Workflows_EntitiesTypes] FOREIGN KEY([entityTypeId])
REFERENCES [dbo].[EntitiesTypes] ([id])
GO
ALTER TABLE [dbo].[Workflows] CHECK CONSTRAINT [FK_Workflows_EntitiesTypes]
GO
ALTER TABLE [dbo].[Workflows]  WITH CHECK ADD  CONSTRAINT [FK_Workflows_WorkflowsTypes] FOREIGN KEY([typeId])
REFERENCES [dbo].[WorkflowTypes] ([id])
GO
ALTER TABLE [dbo].[Workflows] CHECK CONSTRAINT [FK_Workflows_WorkflowsTypes]
GO
ALTER TABLE [dbo].[WorkflowStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowStatuses_WorkflowStatusTypes] FOREIGN KEY([typeId])
REFERENCES [dbo].[WorkflowStatusTypes] ([id])
GO
ALTER TABLE [dbo].[WorkflowStatuses] CHECK CONSTRAINT [FK_WorkflowStatuses_WorkflowStatusTypes]
GO
USE [master]
GO
ALTER DATABASE [WorkflowSystem] SET  READ_WRITE 
GO
