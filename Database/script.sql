USE [master]
GO
/****** Object:  Database [machineTest]    Script Date: 12/08/2018 22:14:59 ******/
CREATE DATABASE [machineTest] ON  PRIMARY 
( NAME = N'machineTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\machineTest.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'machineTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\machineTest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [machineTest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [machineTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [machineTest] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [machineTest] SET ANSI_NULLS OFF
GO
ALTER DATABASE [machineTest] SET ANSI_PADDING OFF
GO
ALTER DATABASE [machineTest] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [machineTest] SET ARITHABORT OFF
GO
ALTER DATABASE [machineTest] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [machineTest] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [machineTest] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [machineTest] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [machineTest] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [machineTest] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [machineTest] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [machineTest] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [machineTest] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [machineTest] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [machineTest] SET  DISABLE_BROKER
GO
ALTER DATABASE [machineTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [machineTest] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [machineTest] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [machineTest] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [machineTest] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [machineTest] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [machineTest] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [machineTest] SET  READ_WRITE
GO
ALTER DATABASE [machineTest] SET RECOVERY FULL
GO
ALTER DATABASE [machineTest] SET  MULTI_USER
GO
ALTER DATABASE [machineTest] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [machineTest] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'machineTest', N'ON'
GO
USE [machineTest]
GO
/****** Object:  User [machineTest]    Script Date: 12/08/2018 22:14:59 ******/
CREATE USER [machineTest] FOR LOGIN [machineTest] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser] 
(
	[userLogin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoUser] ON
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (0, 0, 0, N'admin', N'sibi.sibinraj@gmail.com', N'Rl4OhCWRvEqoVAoGMcDQSA==zDz7vDEpciBGmMLkXD2u2UDUNmb9TwcXKz+uxwj1jz4=', N'{"hashAlgorithm":"HMACSHA256"}', N'sibi.sibinraj@gmail.com', N'en-US', N'7252055d-f7cf-43c0-ae32-c7b73b3cb550', 0, NULL, CAST(0x0000A9B000FB0F28 AS DateTime), CAST(0x0000A9B00163EB99 AS DateTime), NULL, NULL, CAST(0x0000A9B000FB0DA0 AS DateTime), CAST(0x0000A9B00163EB99 AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true}]')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer] 
(
	[computerName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer] 
(
	[isActive] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoServer] ON
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:42687/umbraco', N'LAP//LM/W3SVC/69/ROOT', CAST(0x0000A9B000FB2EEB AS DateTime), CAST(0x0000A9B0016E9B23 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType] 
(
	[alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType] 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType] 
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (1, CAST(0x0000A9B000A0D61A AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2, CAST(0x0000A9B000A0DF55 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (3, CAST(0x0000A9B000A0F75C AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (4, CAST(0x0000A9B000A104DE AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (5, CAST(0x0000A9B000A135BA AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1053]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (6, CAST(0x0000A9B000A13E68 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1053]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (7, CAST(0x0000A9B000A260C4 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"f70a2bdd-452a-4e15-8667-7d87bdab5f89\",\"Id\":1054}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (8, CAST(0x0000A9B000A28A8C AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"bc048148-ab6c-4649-9a6f-d3114e644412\",\"Id\":1055}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (9, CAST(0x0000A9B000A487A7 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"6d4358ad-0254-487d-908e-6029d77a9c13\",\"Id\":1056}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (10, CAST(0x0000A9B000A707DE AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"816b8d0a-24a7-4b11-ab11-6c1a1c843796\",\"Id\":1057}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (11, CAST(0x0000A9B000A767A3 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"3a484f40-fdf8-4dc8-a020-3fa97345afce\",\"Id\":1058}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (12, CAST(0x0000A9B000A7B341 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"fde91b5a-68d2-4aa4-be9d-bcb13dd45494\",\"Id\":1059}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (13, CAST(0x0000A9B000A86A6F AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"94f1447d-e280-4e8a-b48b-ef912df51283\",\"Id\":1060}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (14, CAST(0x0000A9B000A8ECDD AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"36e631f1-f2d1-4f36-be12-3e9e4f5b8e9a\",\"Id\":1061}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (15, CAST(0x0000A9B000A905C2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"14cf1acb-1628-49d0-9529-765c762bcd35\",\"Id\":1062}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (16, CAST(0x0000A9B000AAE4EC AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"cd53e087-9372-4309-8acd-db3bbd889406\",\"Id\":1063}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (17, CAST(0x0000A9B000AAF9C0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"2bc1b18e-ee5c-4278-8c70-7feefccd8ffa\",\"Id\":1064}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (18, CAST(0x0000A9B000AB11C9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"1c83b78b-b954-4786-b7f9-fa11e771de0c\",\"Id\":1065}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (19, CAST(0x0000A9B000AB31A0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"07575b5f-9360-4791-8246-ec313b778d8c\",\"Id\":1066}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (20, CAST(0x0000A9B000AB417A AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"0da8bf78-e598-496b-9764-6f3a4562201c\",\"Id\":1067}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (21, CAST(0x0000A9B000ABAB18 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,44,45,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (22, CAST(0x0000A9B000ACAF95 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1069\",\"Id\":1069,\"Operation\":0}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (23, CAST(0x0000A9B000AD1D8A AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (24, CAST(0x0000A9B000AD4553 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,44,45,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (25, CAST(0x0000A9B000AD54BC AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (26, CAST(0x0000A9B000AD86A3 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D5] 481BAE95005642128123E9FD662E4E84', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (27, CAST(0x0000A9B000B2962A AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (28, CAST(0x0000A9B000B55A10 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (29, CAST(0x0000A9B000B56ECA AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (30, CAST(0x0000A9B000B61A3A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (31, CAST(0x0000A9B000B658A7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (32, CAST(0x0000A9B000B6A757 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (33, CAST(0x0000A9B000B6C017 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (34, CAST(0x0000A9B000B6F6FD AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (35, CAST(0x0000A9B000B7F00F AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (36, CAST(0x0000A9B000B82B26 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (37, CAST(0x0000A9B000B84C9F AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,45,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (38, CAST(0x0000A9B000B855E6 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1052]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (39, CAST(0x0000A9B000B8960D AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (40, CAST(0x0000A9B000B924E2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1071\",\"Id\":1071,\"Operation\":0}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (41, CAST(0x0000A9B000BA1565 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D6] 40A8E34A93A34A9C9833E6B6467F5BA5', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (42, CAST(0x0000A9B000C43725 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D10] 7C83D2F0283F41DD9766F6EB9CA1851E', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (43, CAST(0x0000A9B000CD2644 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"3c0fa7c8-d617-4ccd-8bcb-69cd295f83a9\",\"Id\":1072}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (44, CAST(0x0000A9B000CD4354 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,45,46,47,48,51,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (45, CAST(0x0000A9B000CE1558 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"b936f0d7-e3ba-4cd7-b676-1288d26580f4\",\"Id\":1073}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (46, CAST(0x0000A9B000CE1ADE AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,45,52,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (47, CAST(0x0000A9B000CE845D AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"524eda7e-5638-4cef-ab1a-19d3c96107bc\",\"Id\":1074}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (48, CAST(0x0000A9B000CE890A AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,45,52,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (49, CAST(0x0000A9B000CED8D9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,45,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (50, CAST(0x0000A9B000CF4A74 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"473a0413-4838-4d7f-9fe4-4986aa72a850\",\"Id\":1075}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (51, CAST(0x0000A9B000CF9CD2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"06549d05-0ecf-4f1b-9dc1-445ad3bcb248\",\"Id\":1076}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (52, CAST(0x0000A9B000CFA3E1 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"sliderImages\",\"Id\":1077,\"PropertyTypeIds\":[53,54],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (53, CAST(0x0000A9B000CFF30C AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (54, CAST(0x0000A9B000D01D0F AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1068,\"PropertyTypeIds\":[37,38,39,40,41,42,43,45,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (55, CAST(0x0000A9B000D05CD3 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1078\",\"Id\":1078,\"Operation\":0}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (56, CAST(0x0000A9B000D084E3 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1079]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (57, CAST(0x0000A9B000D0A078 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"61133932-a1c3-4905-a2c4-579eba5ae8b8\",\"Id\":1080}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (58, CAST(0x0000A9B000D0A692 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"sliderImages\",\"Id\":1077,\"PropertyTypeIds\":[53,54,55],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (59, CAST(0x0000A9B000D0B770 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1079]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1079]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (60, CAST(0x0000A9B000D49684 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"58ec6b3f-0878-481c-b88d-2c8314cb8497\",\"Id\":1081}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (61, CAST(0x0000A9B000D49BCD AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"58ec6b3f-0878-481c-b88d-2c8314cb8497\",\"Id\":1081}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (62, CAST(0x0000A9B000D52726 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"48d1b39c-d7d1-466e-8383-990932accef9\",\"Id\":1082}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (63, CAST(0x0000A9B000D557D5 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"1c7cc74a-cea6-497f-a403-500d6115233b\",\"Id\":1083}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (64, CAST(0x0000A9B000D671FE AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"newsListing\",\"Id\":1084,\"PropertyTypeIds\":[56,57,58],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (65, CAST(0x0000A9B000D6CF09 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"1f5cc3a5-9fd5-4773-87e4-e9960712a504\",\"Id\":1085}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (66, CAST(0x0000A9B000D6EBD1 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"99f35a82-dd06-46cf-9682-1115571bc60d\",\"Id\":1086}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (67, CAST(0x0000A9B000D6EEFD AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"newsListing\",\"Id\":1084,\"PropertyTypeIds\":[56,57,58,59,60],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (68, CAST(0x0000A9B000DD2222 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (69, CAST(0x0000A9B000DECBB4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (70, CAST(0x0000A9B000DEDDFB AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (71, CAST(0x0000A9B000E55906 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (72, CAST(0x0000A9B000E676E2 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1088]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (73, CAST(0x0000A9B000E731C8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"4dccbff0-b82d-4c79-86e1-a98eaaa942db\",\"Id\":1090}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (74, CAST(0x0000A9B000E74C76 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"2b28ff8f-d408-4917-b204-e6da63937ded\",\"Id\":1091}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (75, CAST(0x0000A9B000E767EE AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"2d604a51-bc28-4fee-a6e9-ec2c14845dbd\",\"Id\":1092}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (76, CAST(0x0000A9B000E770CA AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (77, CAST(0x0000A9B000E7A378 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (78, CAST(0x0000A9B000E7D527 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"89550d11-63b9-4589-bfd8-631ef2271c3d\",\"Id\":1093}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (79, CAST(0x0000A9B000E7DF38 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63,64],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (80, CAST(0x0000A9B000E7F32F AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"061a3743-6928-4938-a5d7-fd232122a146\",\"Id\":1094}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (81, CAST(0x0000A9B000E7F4D5 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"sliderImages\",\"Id\":1077,\"PropertyTypeIds\":[53,54,55,65],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (82, CAST(0x0000A9B000E81A85 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"sliderImages\",\"Id\":1077,\"PropertyTypeIds\":[53,54,55],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (83, CAST(0x0000A9B000E82F5B AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"1bc27e9b-ae9a-4091-b8c1-03f3d83e743f\",\"Id\":1095}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (84, CAST(0x0000A9B000E8344A AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63,64,66],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (85, CAST(0x0000A9B000E869D7 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"b3cf19b9-382c-46f8-804a-921b3ea538c4\",\"Id\":1096}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (86, CAST(0x0000A9B000E86C1C AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63,64,66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (87, CAST(0x0000A9B000E8B29B AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"41f031ed-ae0d-435a-a65c-d42fca78030f\",\"Id\":1097}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (88, CAST(0x0000A9B000E8BB05 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63,68,64,66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (89, CAST(0x0000A9B000E8DE41 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63,68,64,66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (90, CAST(0x0000A9B000E903F1 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"newsListing\",\"Id\":1084,\"PropertyTypeIds\":[56,57,58,59,60],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (91, CAST(0x0000A9B000E90A76 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"newsListing\",\"Id\":1084,\"PropertyTypeIds\":[56,57,58,59,60],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (92, CAST(0x0000A9B000F81B37 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1098\",\"Id\":1098,\"Operation\":0}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (93, CAST(0x0000A9B000F8364A AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (94, CAST(0x0000A9B000F8AE02 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1100\",\"Id\":1100,\"Operation\":0}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (95, CAST(0x0000A9B000F8DACA AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (96, CAST(0x0000A9B000F8FBA9 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (97, CAST(0x0000A9B000F94910 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (98, CAST(0x0000A9B000F96FB1 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (99, CAST(0x0000A9B000F9A7AF AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (100, CAST(0x0000A9B000F9D007 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (101, CAST(0x0000A9B000F9EF6A AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D11] E354A08E0A5A425C8BA71D7CCC4228CD', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (102, CAST(0x0000A9B000FEBE64 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D12] 10C4BDB2D7764440B6CE4501F4575A0D', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (103, CAST(0x0000A9B000FF235A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1070]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D12] 10C4BDB2D7764440B6CE4501F4575A0D', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (104, CAST(0x0000A9B000FFB04D AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"sliderImages\",\"Id\":1077,\"PropertyTypeIds\":[53,54,55],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D12] 10C4BDB2D7764440B6CE4501F4575A0D', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (105, CAST(0x0000A9B000FFCD22 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63,68,64,66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D12] 10C4BDB2D7764440B6CE4501F4575A0D', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (106, CAST(0x0000A9B00101B35E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (107, CAST(0x0000A9B001032F84 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (108, CAST(0x0000A9B0010A9D6D AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (109, CAST(0x0000A9B0010AC146 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (110, CAST(0x0000A9B0010AD272 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (111, CAST(0x0000A9B0010AE04A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (112, CAST(0x0000A9B0010AEF74 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1104]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (113, CAST(0x0000A9B0010AFD1C AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (114, CAST(0x0000A9B0010B0958 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (115, CAST(0x0000A9B0010B21E8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"news\",\"Id\":1089,\"PropertyTypeIds\":[61,62,63,68,64,66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D13] 13222F6676274FFD9982B96D4B26D339', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (116, CAST(0x0000A9B0010C3B75 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1107]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D14] B1D04EFA6A9A428682FDF5C4EB991C52', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (117, CAST(0x0000A9B0010C7D72 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1107]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D14] B1D04EFA6A9A428682FDF5C4EB991C52', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (118, CAST(0x0000A9B0010C890D AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1107]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D14] B1D04EFA6A9A428682FDF5C4EB991C52', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (119, CAST(0x0000A9B0010E00AE AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"c2c072ce-d5a5-4ed7-983f-d89e7489c75a\",\"Id\":1108}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (120, CAST(0x0000A9B0010E2897 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"44253028-132e-4121-8d9c-4b0b179f69c3\",\"Id\":1109}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (121, CAST(0x0000A9B0010E388B AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"abee2158-7619-45ae-84e9-487a53a2562e\",\"Id\":1110}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (122, CAST(0x0000A9B0010E5C54 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"464f359e-249b-4ec6-9c95-463178765766\",\"Id\":1111}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (123, CAST(0x0000A9B0010E7A7B AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"26c0a541-40c4-4fd6-a38e-d6029ebff9b7\",\"Id\":1112}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (124, CAST(0x0000A9B0010E8D4C AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"59899b8c-fd74-4473-9e88-07d43aa53bb8\",\"Id\":1113}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (125, CAST(0x0000A9B0010E9050 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"listContact\",\"Id\":1114,\"PropertyTypeIds\":[69,70,71,72,73],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (126, CAST(0x0000A9B0010E9FE9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"listContact\",\"Id\":1114,\"PropertyTypeIds\":[69,70,71,72,73],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (127, CAST(0x0000A9B0010F78E1 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"17147fc8-86db-4611-86b2-aa0d27140522\",\"Id\":1115}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (128, CAST(0x0000A9B0010F9A2A AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"9d8f5658-8714-4701-98e8-7c8a04af7c70\",\"Id\":1116}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (129, CAST(0x0000A9B0010FB603 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"04e11cb0-81bb-4dd8-b3b3-c99458ce68a9\",\"Id\":1117}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (130, CAST(0x0000A9B0010FBEF2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"1a4ed1d4-5917-4b43-b7e1-dabe6395b026\",\"Id\":1118}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (131, CAST(0x0000A9B0010FD779 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"3c00e170-b89d-49f9-a494-da2b5facf1a4\",\"Id\":1119}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (132, CAST(0x0000A9B0010FD945 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contactUs\",\"Id\":1120,\"PropertyTypeIds\":[74,75,76,77],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (133, CAST(0x0000A9B0010FE4E7 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contactUs\",\"Id\":1120,\"PropertyTypeIds\":[74,75,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (134, CAST(0x0000A9B0010FEBBD AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contactUs\",\"Id\":1120,\"PropertyTypeIds\":[74,75,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (135, CAST(0x0000A9B0011024CD AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contactUs\",\"Id\":1120,\"PropertyTypeIds\":[74,75,76,77],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (136, CAST(0x0000A9B001105682 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1121]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D16] 08A0C3A44931404DB5A977E29D0E64AC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (137, CAST(0x0000A9B001114721 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1107]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D17] E723C7EDE00040029D36747CC4CC0C0F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (138, CAST(0x0000A9B00111DAB5 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1122]","JsonIdCount":1,"JsonPayload":null}]', N'LAP//LM/W3SVC/69/ROOT [P15640/D17] E723C7EDE00040029D36747CC4CC0C0F', 1)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'::1', CAST(0x0000A9B000A08DC1 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000CC80A0 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000CC83BF AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000DB8844 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000DB95BC AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000DB95BF AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000DB95C1 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (8, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000E52EC6 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (9, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000E533D2 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (10, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000E533D4 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (11, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000E533D8 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (12, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000F42734 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (13, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B000F42750 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (14, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B0010941A5 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (15, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B001094839 AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (16, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B00109487A AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (17, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A9B00109487F AS DateTime), 0, N'User "admin" <sibi.sibinraj@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
/****** Object:  Table [dbo].[cmsTags]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags] 
(
	[tag] ASC,
	[group] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType] 
(
	[alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON
INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL,
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode] 
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode] 
(
	[parentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodePath] ON [dbo].[umbracoNode] 
(
	[path] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeTrashed] ON [dbo].[umbracoNode] 
(
	[trashed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNodeUniqueID] ON [dbo].[umbracoNode] 
(
	[uniqueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoNode] ON
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C19 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C19 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C1A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C1B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C1C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C1D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'Checkbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C1E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C1E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C1F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C20 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C21 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C21 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C22 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C23 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(0x0000A9B000FB0C18 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(0x0000A9B000FB0C18 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(0x0000A9B000FB0C0B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A9B000FB0C25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A9B000FB0C26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A9B000FB0C26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C27 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(0x0000A9B000FB0C27 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, 0, 1, N'-1,1046', 2, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C27 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, -1, 0, 1, N'-1,1047', 2, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C28 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, -1, 0, 1, N'-1,1048', 2, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C28 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, -1, 0, 1, N'-1,1049', 2, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C28 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, -1, 0, 1, N'-1,1050', 2, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FB0C29 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1051, 0, -1, NULL, 1, N'-1,1051', 0, N'ac36838f-6fcc-4182-952b-5548bfdee46f', N'Master', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A9B000FB7910 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1052, 0, 1051, NULL, 1, N'-1,1051,1052', 0, N'43422956-61af-4d43-8abb-0595029066d5', N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A9B000FB9A67 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1053, 0, 1051, NULL, 1, N'-1,1051,1053', 0, N'8e01ea3b-317b-41df-b07b-5d9ae0d93314', N'NewsListing', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A9B000FBD8D0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1054, 0, -1, 0, 1, N'-1,1054', 24, N'f70a2bdd-452a-4e15-8667-7d87bdab5f89', N'MachineTest.com - Meta Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FD03AF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1055, 0, -1, 0, 1, N'-1,1055', 25, N'bc048148-ab6c-4649-9a6f-d3114e644412', N'MachineTest.com - Meta Description - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FD2D90 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 0, -1, 0, 1, N'-1,1056', 26, N'6d4358ad-0254-487d-908e-6029d77a9c13', N'home - Meta Keywords - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B000FF2AAD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 0, -1, 0, 1, N'-1,1057', 27, N'816b8d0a-24a7-4b11-ab11-6c1a1c843796', N'home - Upload Banner - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00101AAC8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1058, 0, -1, 0, 1, N'-1,1058', 28, N'3a484f40-fdf8-4dc8-a020-3fa97345afce', N'home - Banner Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001020AAA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1059, 0, -1, 0, 1, N'-1,1059', 29, N'fde91b5a-68d2-4aa4-be9d-bcb13dd45494', N'home - Banner Description - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001025636 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1060, 0, -1, 0, 1, N'-1,1060', 30, N'94f1447d-e280-4e8a-b48b-ef912df51283', N'home - Banner Button Text - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001030D79 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1061, 0, -1, 0, 1, N'-1,1061', 31, N'36e631f1-f2d1-4f36-be12-3e9e4f5b8e9a', N'home - Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001038FEE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1062, 0, -1, 0, 1, N'-1,1062', 32, N'14cf1acb-1628-49d0-9529-765c762bcd35', N'home - Description - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00103A8D0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1063, 0, -1, 0, 1, N'-1,1063', 33, N'cd53e087-9372-4309-8acd-db3bbd889406', N'home - Article Image - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0010587FD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1064, 0, -1, 0, 1, N'-1,1064', 34, N'2bc1b18e-ee5c-4278-8c70-7feefccd8ffa', N'home - Title - Textbox (1)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001059CD2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1065, 0, -1, 0, 1, N'-1,1065', 35, N'1c83b78b-b954-4786-b7f9-fa11e771de0c', N'home - Description - Rich Text Editor (1)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00105B4DB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1066, 0, -1, 0, 1, N'-1,1066', 36, N'07575b5f-9360-4791-8246-ec313b778d8c', N'home - Title - Textbox (2)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00105D4A1 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1067, 0, -1, 0, 1, N'-1,1067', 37, N'0da8bf78-e598-496b-9764-6f3a4562201c', N'home - Description - Rich Text Editor (2)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00105E48D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1068, 0, -1, 0, 1, N'-1,1068', 7, N'23f5b369-742f-4c81-bf59-12fc78ddf830', N'home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9B001064CC5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1069, 0, -1, 0, 1, N'-1,1069', 0, N'cf0ccca9-3204-4d2e-8ded-364858db3490', N'header.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A9B00107513E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1070, 0, -1, 0, 1, N'-1,1070', 0, N'014bc3fd-4686-490d-aad3-858f9948793e', N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B00107AA68 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1071, 0, -1, 0, 1, N'-1,1071', 1, N'176a3621-3e00-483e-b096-5dbeff86d4a6', N'pic06.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A9B00113C7C9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1072, 0, -1, 0, 1, N'-1,1072', 38, N'3c0fa7c8-d617-4ccd-8bcb-69cd295f83a9', N'home - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00127C8E5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1073, 0, -1, 0, 1, N'-1,1073', 39, N'b936f0d7-e3ba-4cd7-b676-1288d26580f4', N'home - Slider Images - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00128B86F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1074, 0, -1, 0, 1, N'-1,1074', 40, N'524eda7e-5638-4cef-ab1a-19d3c96107bc', N'home - Slider Images - Multinode Treepicker (1)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00129275F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1075, 0, -1, 0, 1, N'-1,1075', 41, N'473a0413-4838-4d7f-9fe4-4986aa72a850', N'Slider Images - Image - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00129ED84 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1076, 0, -1, 0, 1, N'-1,1076', 42, N'06549d05-0ecf-4f1b-9dc1-445ad3bcb248', N'Slider Images - Description - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0012A3FD1 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1077, 0, -1, 0, 1, N'-1,1077', 21, N'c1c749c3-7f95-4816-93c8-f3d213b2c544', N'Slider Images', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9B0012A46EA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1078, 0, -1, 0, 1, N'-1,1078', 2, N'cc8a53d5-334a-4de2-8141-5676ea40248d', N'pic01.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A9B0012AFFBA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1079, 0, 1070, 0, 2, N'-1,1070,1079', 0, N'0b04d505-417b-4a1f-aa2c-147c7c620194', N'Slider1', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B0012B27E1 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1080, 0, -1, 0, 1, N'-1,1080', 43, N'61133932-a1c3-4905-a2c4-579eba5ae8b8', N'Slider Images - Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0012B438E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1081, 0, -1, 0, 1, N'-1,1081', 44, N'58ec6b3f-0878-481c-b88d-2c8314cb8497', N'Banner Image - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0012F3951 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1082, 0, -1, 0, 1, N'-1,1082', 45, N'48d1b39c-d7d1-466e-8383-990932accef9', N'Banner Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0012FCA32 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1083, 0, -1, 0, 1, N'-1,1083', 46, N'1c7cc74a-cea6-497f-a403-500d6115233b', N'Banner Description - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0012FFADF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1084, 0, -1, 0, 1, N'-1,1084', 20, N'65de9212-462e-42fb-9da2-a4fa26cfda05', N'News Listing', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9B0013114DD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1085, 0, -1, 0, 1, N'-1,1085', 47, N'1f5cc3a5-9fd5-4773-87e4-e9960712a504', N'News Listing - Content Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00131720D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1086, 0, -1, 0, 1, N'-1,1086', 48, N'99f35a82-dd06-46cf-9682-1115571bc60d', N'News Listing - Content Description - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001318EE5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1087, 0, -1, 0, 1, N'-1,1087', 1, N'f6dd443c-fc8d-4b8d-9a0b-36831cbab991', N'News Listing', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B00137BDBC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1088, 0, -1, NULL, 1, N'-1,1088', 0, N'708d17e1-3fc4-462b-aecd-10b79f709ca7', N'News', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A9B0014119D2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1089, 0, -1, 0, 1, N'-1,1089', 23, N'7ed6e183-27c9-458a-8802-5bce8cf1cb97', N'News', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9B0014119E5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1090, 0, -1, 0, 1, N'-1,1090', 49, N'4dccbff0-b82d-4c79-86e1-a98eaaa942db', N'News - News Image - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00141D4E2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1091, 0, -1, 0, 1, N'-1,1091', 50, N'2b28ff8f-d408-4917-b204-e6da63937ded', N'News - News Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00141EF8E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1092, 0, -1, 0, 1, N'-1,1092', 51, N'2d604a51-bc28-4fee-a6e9-ec2c14845dbd', N'News - News Description - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001420AF4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1093, 0, -1, 0, 1, N'-1,1093', 52, N'89550d11-63b9-4589-bfd8-631ef2271c3d', N'News - Upload Banner - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001427835 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1094, 0, -1, 0, 1, N'-1,1094', 53, N'061a3743-6928-4938-a5d7-fd232122a146', N'Slider Images - Banner Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001429649 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1095, 0, -1, 0, 1, N'-1,1095', 54, N'1bc27e9b-ae9a-4091-b8c1-03f3d83e743f', N'News - Banner Title - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00142D26D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1096, 0, -1, 0, 1, N'-1,1096', 55, N'b3cf19b9-382c-46f8-804a-921b3ea538c4', N'News - BannerDescription - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001430CDB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1097, 0, -1, 0, 1, N'-1,1097', 56, N'41f031ed-ae0d-435a-a65c-d42fca78030f', N'News - Is featured - Checkbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0014355AD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1098, 0, -1, 0, 1, N'-1,1098', 3, N'92981f59-6bf9-4c77-8f5e-c75843d19d10', N'pic07.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A9B00152BE1A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1099, 0, 1087, 0, 2, N'-1,1087,1099', 0, N'f9629ddf-b341-4f07-875e-3aea5879f56a', N'Test news1', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B00152D936 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1100, 0, -1, 0, 1, N'-1,1100', 4, N'6494415a-bf5f-4485-8c55-bd7d41c95366', N'pic08.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A9B001535103 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1101, 0, 1087, 0, 2, N'-1,1087,1101', 1, N'53ef59a0-b7b3-481e-9968-beb1a9320f35', N'Test News2', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B001537DD1 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1102, 0, 1087, 0, 2, N'-1,1087,1102', 2, N'236af23f-ba99-4d5e-85a7-01162dc30773', N'Test News3', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B00153EC16 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1103, 0, 1087, 0, 2, N'-1,1087,1103', 3, N'8ff0c824-3240-4ebd-8ac6-d79f48216ad6', N'Test News4', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B0015412B1 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1104, 0, 1087, 0, 2, N'-1,1087,1104', 4, N'd28f86c0-7c6f-4702-974d-73afd173b3d1', N'Test News5', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B001544AB7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1105, 0, 1087, 0, 2, N'-1,1087,1105', 5, N'7dd69837-8dc2-4561-96dc-2666bd3fce75', N'Test News6', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B00154730E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1106, 0, 1087, 0, 2, N'-1,1087,1106', 6, N'4826c6d5-2293-41eb-aaa0-5636e28373a8', N'Test News7', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B001549275 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1107, 0, 1051, NULL, 1, N'-1,1051,1107', 0, N'7e7e4bb2-75e3-401e-a137-c825b7573ce8', N'ContactUs', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A9B00166DE83 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1108, 0, -1, 0, 1, N'-1,1108', 57, N'c2c072ce-d5a5-4ed7-983f-d89e7489c75a', N'List Contact - Name - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00168A3A3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1109, 0, -1, 0, 1, N'-1,1109', 58, N'44253028-132e-4121-8d9c-4b0b179f69c3', N'List Contact - email - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00168CB9C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1110, 0, -1, 0, 1, N'-1,1110', 59, N'abee2158-7619-45ae-84e9-487a53a2562e', N'List Contact - phone - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00168DBA2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1111, 0, -1, 0, 1, N'-1,1111', 60, N'464f359e-249b-4ec6-9c95-463178765766', N'List Contact - phone - Textbox (1)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B00168FF6A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1112, 0, -1, 0, 1, N'-1,1112', 61, N'26c0a541-40c4-4fd6-a38e-d6029ebff9b7', N'List Contact - subject - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001691D92 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1113, 0, -1, 0, 1, N'-1,1113', 62, N'59899b8c-fd74-4473-9e88-07d43aa53bb8', N'List Contact - message - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B001693056 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1114, 0, -1, 0, 1, N'-1,1114', 24, N'da7d757d-50fb-4ef9-8379-50575eaffde9', N'List Contact', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9B001693333 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1115, 0, -1, 0, 1, N'-1,1115', 63, N'17147fc8-86db-4611-86b2-aa0d27140522', N'ContactUs - heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0016A1BEF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1116, 0, -1, 0, 1, N'-1,1116', 64, N'9d8f5658-8714-4701-98e8-7c8a04af7c70', N'ContactUs - Head Content - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0016A3D43 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1117, 0, -1, 0, 1, N'-1,1117', 65, N'04e11cb0-81bb-4dd8-b3b3-c99458ce68a9', N'ContactUs - address - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0016A591B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1118, 0, -1, 0, 1, N'-1,1118', 66, N'1a4ed1d4-5917-4b43-b7e1-dabe6395b026', N'ContactUs - address - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0016A61FC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1119, 0, -1, 0, 1, N'-1,1119', 67, N'3c00e170-b89d-49f9-a494-da2b5facf1a4', N'ContactUs - Button Text - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9B0016A7A91 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1120, 0, -1, 0, 1, N'-1,1120', 27, N'dcf3979a-c291-40b7-824c-83e5fb1c61df', N'ContactUs', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9B0016A7C5A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1121, 0, -1, 0, 1, N'-1,1121', 2, N'796ace22-f1de-41f8-800a-fc2f61ac4f83', N'Contact Us', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B0016AF8F0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1122, 0, 1121, 0, 2, N'-1,1121,1122', 0, N'9dab4be7-a91c-4252-b79a-7f318e296c11', N'Sibin 08-12-2018 22:07', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9B0016C7DA0 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMigration] ON [dbo].[umbracoMigration] 
(
	[name] ASC,
	[version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON
INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(0x0000A9B000FB0DD2 AS DateTime), N'7.12.4')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog] 
(
	[NodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoLog] ON
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, 0, CAST(0x0000A9B000FB7926 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, 1051, CAST(0x0000A9B000FB8273 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, 0, CAST(0x0000A9B000FB9A73 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, 1052, CAST(0x0000A9B000FBA7F9 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, 0, CAST(0x0000A9B000FBD8D6 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, 1053, CAST(0x0000A9B000FBE187 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, 0, CAST(0x0000A9B000FD03C3 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, 0, CAST(0x0000A9B000FD2DA4 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, 0, CAST(0x0000A9B000FF2AC4 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, 0, CAST(0x0000A9B00101AAE2 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, 0, CAST(0x0000A9B001020ABD AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, 0, CAST(0x0000A9B00102564D AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, 0, CAST(0x0000A9B001030D8C AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, 0, CAST(0x0000A9B001038FFB AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, 0, CAST(0x0000A9B00103A8D9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, 0, CAST(0x0000A9B001058808 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, 0, CAST(0x0000A9B001059CD9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, 0, CAST(0x0000A9B00105B4E1 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, 0, CAST(0x0000A9B00105D4BC AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, 0, CAST(0x0000A9B00105E493 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1068, CAST(0x0000A9B001064CFE AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, 0, CAST(0x0000A9B001074F1F AS DateTime), N'New', N'Media ''header.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 0, CAST(0x0000A9B001075219 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 0, CAST(0x0000A9B00107AA90 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 1068, CAST(0x0000A9B00107E861 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 1070, CAST(0x0000A9B00107F7A4 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, 1051, CAST(0x0000A9B0010829B8 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, -1, CAST(0x0000A9B0010A8000 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, -1, CAST(0x0000A9B0010B0F62 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, -1, CAST(0x0000A9B0010B264B AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, -1, CAST(0x0000A9B0010B3008 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, -1, CAST(0x0000A9B0010BAF68 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, -1, CAST(0x0000A9B0010C0D72 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, -1, CAST(0x0000A9B0010C2078 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, -1, CAST(0x0000A9B0010C2595 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, -1, CAST(0x0000A9B0010C3706 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, -1, CAST(0x0000A9B0010C570A AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, -1, CAST(0x0000A9B0010C72D5 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, -1, CAST(0x0000A9B0010C85AF AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 1051, CAST(0x0000A9B0010D3912 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 1070, CAST(0x0000A9B0010FFC59 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 1052, CAST(0x0000A9B0011011DD AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 1070, CAST(0x0000A9B00110BD4D AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 1052, CAST(0x0000A9B00110FBBE AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 1052, CAST(0x0000A9B001114A70 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 1052, CAST(0x0000A9B001116333 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 1052, CAST(0x0000A9B001119A1A AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 1070, CAST(0x0000A9B001129290 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, 1070, CAST(0x0000A9B00112CE34 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 1068, CAST(0x0000A9B00112EEEB AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1052, CAST(0x0000A9B00112F904 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 1070, CAST(0x0000A9B00113391E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 0, CAST(0x0000A9B00113C742 AS DateTime), N'New', N'Media ''pic06.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 0, CAST(0x0000A9B00113C7DD AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 1070, CAST(0x0000A9B00114B86E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 1070, CAST(0x0000A9B0011ED96D AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, -1, CAST(0x0000A9B0011FF3FD AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, -1, CAST(0x0000A9B001201349 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, -1, CAST(0x0000A9B00120775D AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, -1, CAST(0x0000A9B00120C6AA AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, -1, CAST(0x0000A9B00121E190 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, -1, CAST(0x0000A9B001222622 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 0, CAST(0x0000A9B00127C913 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 1068, CAST(0x0000A9B00127E5AD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 0, CAST(0x0000A9B00128B875 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 1068, CAST(0x0000A9B00128BDF9 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 0, CAST(0x0000A9B00129276A AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 1068, CAST(0x0000A9B001292C26 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1068, CAST(0x0000A9B001297BF2 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 0, CAST(0x0000A9B00129ED8D AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 0, CAST(0x0000A9B0012A3FE6 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1077, CAST(0x0000A9B0012A46F5 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1070, CAST(0x0000A9B0012A94FB AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 1068, CAST(0x0000A9B0012AC02A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 0, CAST(0x0000A9B0012AFDAF AS DateTime), N'New', N'Media ''pic01.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 0, CAST(0x0000A9B0012AFFC8 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 0, CAST(0x0000A9B0012B27EA AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 0, CAST(0x0000A9B0012B4395 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1077, CAST(0x0000A9B0012B49AD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 1079, CAST(0x0000A9B0012B5A79 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 0, CAST(0x0000A9B0012F397E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1081, CAST(0x0000A9B0012F3EE9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 0, CAST(0x0000A9B0012FCA42 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 0, CAST(0x0000A9B0012FFAE6 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, 1084, CAST(0x0000A9B0013114EF AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 0, CAST(0x0000A9B001317224 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 0, CAST(0x0000A9B001318EEE AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1084, CAST(0x0000A9B001319218 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 0, CAST(0x0000A9B00137BF0F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1051, CAST(0x0000A9B001396E80 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 1051, CAST(0x0000A9B001398113 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 1087, CAST(0x0000A9B0013FFB5C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 0, CAST(0x0000A9B0014119D6 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 1089, CAST(0x0000A9B0014119EA AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (95, 0, 0, CAST(0x0000A9B00141D4E5 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (96, 0, 0, CAST(0x0000A9B00141EF91 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (97, 0, 0, CAST(0x0000A9B001420AF9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (98, 0, 1089, CAST(0x0000A9B0014213DD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (99, 0, 1089, CAST(0x0000A9B001424682 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (100, 0, 0, CAST(0x0000A9B001427844 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
GO
print 'Processed 100 total records'
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (101, 0, 1089, CAST(0x0000A9B001428253 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (102, 0, 0, CAST(0x0000A9B00142964C AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (103, 0, 1077, CAST(0x0000A9B0014297F1 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (104, 0, 1077, CAST(0x0000A9B00142BDA0 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (105, 0, 0, CAST(0x0000A9B00142D275 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (106, 0, 1089, CAST(0x0000A9B00142D766 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (107, 0, 0, CAST(0x0000A9B001430CE2 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (108, 0, 1089, CAST(0x0000A9B001430F37 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (109, 0, 0, CAST(0x0000A9B0014355B5 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (110, 0, 1089, CAST(0x0000A9B001435E20 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (111, 0, 1089, CAST(0x0000A9B00143815C AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (112, 0, 1084, CAST(0x0000A9B00143A702 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (113, 0, 1084, CAST(0x0000A9B00143AD91 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (114, 0, 0, CAST(0x0000A9B00152BDD2 AS DateTime), N'New', N'Media ''pic07.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (115, 0, 0, CAST(0x0000A9B00152BE38 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (116, 0, 0, CAST(0x0000A9B00152D942 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (117, 0, 0, CAST(0x0000A9B0015350F4 AS DateTime), N'New', N'Media ''pic08.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (118, 0, 0, CAST(0x0000A9B00153510B AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (119, 0, 0, CAST(0x0000A9B001537DDF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (120, 0, 1087, CAST(0x0000A9B001539EBB AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (121, 0, 0, CAST(0x0000A9B00153EC24 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (122, 0, 0, CAST(0x0000A9B0015412BD AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (123, 0, 0, CAST(0x0000A9B001544AC0 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (124, 0, 0, CAST(0x0000A9B001547317 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (125, 0, 0, CAST(0x0000A9B00154927E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (126, 0, 1099, CAST(0x0000A9B00159608D AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (127, 0, 1070, CAST(0x0000A9B00159C66F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (128, 0, 1077, CAST(0x0000A9B0015A5348 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (129, 0, 1089, CAST(0x0000A9B0015A703D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (130, 0, 1099, CAST(0x0000A9B0015C5659 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (131, 0, 1099, CAST(0x0000A9B0015DD291 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (132, 0, 1101, CAST(0x0000A9B001653F63 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (133, 0, 1101, CAST(0x0000A9B001656445 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (134, 0, 1102, CAST(0x0000A9B00165757F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (135, 0, 1103, CAST(0x0000A9B00165835C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (136, 0, 1104, CAST(0x0000A9B00165927F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (137, 0, 1105, CAST(0x0000A9B00165A02F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (138, 0, 1106, CAST(0x0000A9B00165AC6B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (139, 0, 1089, CAST(0x0000A9B00165C490 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (140, 0, 0, CAST(0x0000A9B00166DE8A AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (141, 0, 1107, CAST(0x0000A9B001672086 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (142, 0, 1107, CAST(0x0000A9B001672C29 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (143, 0, -1, CAST(0x0000A9B001685424 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (144, 0, -1, CAST(0x0000A9B001685F9A AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (145, 0, 0, CAST(0x0000A9B00168A3BE AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (146, 0, 0, CAST(0x0000A9B00168CBA5 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (147, 0, 0, CAST(0x0000A9B00168DBA9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (148, 0, 0, CAST(0x0000A9B00168FF72 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (149, 0, 0, CAST(0x0000A9B001691D98 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (150, 0, 0, CAST(0x0000A9B00169305F AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (151, 0, 1114, CAST(0x0000A9B00169334F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (152, 0, 1114, CAST(0x0000A9B001694303 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (153, 0, 0, CAST(0x0000A9B0016A1BF5 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (154, 0, 0, CAST(0x0000A9B0016A3D48 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (155, 0, 0, CAST(0x0000A9B0016A5921 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (156, 0, 0, CAST(0x0000A9B0016A6207 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (157, 0, 0, CAST(0x0000A9B0016A7A97 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (158, 0, 1120, CAST(0x0000A9B0016A7C60 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (159, 0, 1120, CAST(0x0000A9B0016A8802 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (160, 0, 1120, CAST(0x0000A9B0016A8ED8 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (161, 0, 1120, CAST(0x0000A9B0016AC7E7 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (162, 0, 0, CAST(0x0000A9B0016AF916 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (163, 0, 1107, CAST(0x0000A9B0016BEA34 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (164, 0, 0, CAST(0x0000A9B0016C7DB7 AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoLock] ON
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, 1, N'Servers')
SET IDENTITY_INSERT [dbo].[umbracoLock] OFF
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage] 
(
	[languageISOCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary] 
(
	[key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro] 
(
	[uniqueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro] 
(
	[macroAlias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsDataType] ON
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1046, N'Umbraco.ContentPicker2', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (27, 1047, N'Umbraco.MemberPicker2', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (28, 1048, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (29, 1049, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (30, 1050, N'Umbraco.RelatedLinks2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (31, 1054, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (32, 1055, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (33, 1056, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (34, 1057, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (35, 1058, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (36, 1059, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (37, 1060, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (38, 1061, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (39, 1062, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (40, 1063, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (41, 1064, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (42, 1065, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (43, 1066, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (44, 1067, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (45, 1072, N'Umbraco.MultiNodeTreePicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (46, 1073, N'Umbraco.MultiNodeTreePicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (47, 1074, N'Umbraco.MultiNodeTreePicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (48, 1075, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (49, 1076, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (50, 1080, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (51, 1081, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (52, 1082, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (53, 1083, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (54, 1085, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (55, 1086, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (56, 1090, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (57, 1091, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (58, 1092, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (59, 1093, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (60, 1094, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (61, 1095, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (62, 1096, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (63, 1097, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (64, 1108, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (65, 1109, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (66, 1110, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (67, 1111, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (68, 1112, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (69, 1113, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (70, 1115, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (71, 1116, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (72, 1117, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (73, 1118, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (74, 1119, N'Umbraco.Textbox', N'Nvarchar')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty] 
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty] 
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType] 
(
	[icon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContentType] ON
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (535, 1068, N'home', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (536, 1077, N'sliderImages', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (537, 1084, N'newsListing', N'icon-document', N'folder.png', NULL, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (538, 1089, N'news', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (539, 1114, N'listContact', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (540, 1120, N'contactUs', N'icon-document', N'folder.png', NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (1, 1051, N'Master', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
}

@* the fun starts here *@

<!DOCTYPE HTML>

<html>
<head>
    <title>Helios by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="~/assets/css/main.css" />
    <noscript>
        <link rel="stylesheet" href="~/assets/css/noscript.css" />
    </noscript>
</head>
<body class="homepage is-preload">
    <div id="page-wrapper">

        <!-- Header -->
        @{ Html.RenderPartial("umbBanner"); }

        @RenderBody()



        <!-- Footer -->
        <div id="footer">
            @{ Html.RenderPartial("umbFooter"); }
        </div>

    </div>

    <!-- Scripts -->
    <script src="~/assets/js/jquery.min.js"></script>
    <script src="~/assets/js/jquery.dropotron.min.js"></script>
    <script src="~/assets/js/jquery.scrolly.min.js"></script>
    <script src="~/assets/js/jquery.scrollex.min.js"></script>
    <script src="~/assets/js/browser.min.js"></script>
    <script src="~/assets/js/breakpoints.min.js"></script>
    <script src="~/assets/js/util.js"></script>
    <script src="~/assets/js/main.js"></script>

</body>
</html>
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (2, 1052, N'Home', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}
@* the fun starts here *@

        <!-- Banner -->
        <section id="banner">
            <header>
               
               <p> @CurrentPage.sliderDescription</p>
            </header>
        </section>

        <!-- Carousel -->
        <section class="carousel">
            <div class="reel">

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic01.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Pulvinar sagittis congue</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic02.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Fermentum sagittis proin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic03.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Sed quis rhoncus placerat</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic04.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Ultrices urna sit lobortis</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic05.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Varius magnis sollicitudin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic01.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Pulvinar sagittis congue</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic02.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Fermentum sagittis proin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic03.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Sed quis rhoncus placerat</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic04.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Ultrices urna sit lobortis</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured">
                        <img src="images/pic05.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Varius magnis sollicitudin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

            </div>
        </section>

        <!-- Main -->
        <div class="wrapper style2">

            <article id="main" class="container special">
                <a href="#" class="image featured">
                    <img src="images/pic06.jpg" alt="" /></a>
                <header>
                    <h2><a href="#">Sed massa imperdiet magnis</a></h2>
                    <p>
                        Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim
								pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.
                    </p>
                </header>
                <p>
                    Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa
							posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus
							sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam
							mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan
							lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum
							consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue
							interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia
							natoque aenean scelerisque.
                </p>
                <footer>
                    <a href="#" class="button">Continue Reading</a>
                </footer>
            </article>

        </div>

        <!-- Features -->
        <div class="wrapper style1">

            <section id="features" class="container special">
                <header>
                    <h2>Morbi ullamcorper et varius leo lacus</h2>
                    <p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>
                </header>
                <div class="row">
                    <article class="col-4 col-12-mobile special">
                        <a href="#" class="image featured">
                            <img src="images/pic07.jpg" alt="" /></a>
                        <header>
                            <h3><a href="#">Gravida aliquam penatibus</a></h3>
                        </header>
                        <p>
                            Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
                        </p>
                    </article>
                    <article class="col-4 col-12-mobile special">
                        <a href="#" class="image featured">
                            <img src="images/pic08.jpg" alt="" /></a>
                        <header>
                            <h3><a href="#">Sed quis rhoncus placerat</a></h3>
                        </header>
                        <p>
                            Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
                        </p>
                    </article>
                    <article class="col-4 col-12-mobile special">
                        <a href="#" class="image featured">
                            <img src="images/pic09.jpg" alt="" /></a>
                        <header>
                            <h3><a href="#">Magna laoreet et aliquam</a></h3>
                        </header>
                        <p>
                            Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam
									porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
                        </p>
                    </article>
                </div>
            </section>

        </div>

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (3, 1053, N'NewsListing', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

@* the fun starts here *@

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (4, 1088, N'News', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.News>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = null;
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (5, 1107, N'ContactUs', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

@* the fun starts here *@
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="~/js/jquery.validate.min.js" type="text/javascript"></script>
	<script  type="text/javascript">
		$.validator.addMethod(''customphone'', function (value, element) {
            return this.optional(element) || /^(\+\d{1,3}[- ]?)?\d{10}$/.test(value);
        }, "Please enter a valid phone number");
        
        $.validator.addMethod(''customemail'', function (value, element) {
             return this.optional(element) || /^[-a-z0-9~!$%^&*_=+}{\''?]+(\.[-a-z0-9~!$%^&*_=+}{\''?]+)*@@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i.test(value);
        }, "Please enter a valid email address.");
	$(document).ready(function () {
	$("#form1").validate({
                    rules: {
                    contactName: {
                        minlength: 2,
                        required: true
                    },
                    email: ''customemail'',
                    phone: ''customphone'',
                    subject: {
                        required: true
                    },
                    message: {
                        required: true
                    }
                },
                messages: {
                    contactName: {
                        minlength: "Enter atleast 2 characters",
                        required: "Please enter your name"
                    }
                },
                tooltip_options: {
                    contactName: { trigger: ''focus'' }
                }
            });
	});
		</script>


<div class="inner-content-section">

    <div class="contact-section">
        <div class="contact-section-title">
            <h2 class="scroll-effect-up">@CurrentPage.headin</h2>
            <p class="scroll-effect-up">@CurrentPage.headContent</p>
        </div>
       
        <div class="contact-section-right">
            <form id="form1" >
                <div>
                    @Html.Action("ShowForm", "contactFormSurface")
                </div>
            </form>
        </div>

        <br clear="all" />
    </div>


   


</div>
')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation] 
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl] 
(
	[urlHash] ASC,
	[contentKey] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[umbracoRedirectUrl] ([id], [contentKey], [createDateUtc], [url], [urlHash]) VALUES (N'398a88c4-5645-4f34-9565-fdd1ba5fa02b', N'f6dd443c-fc8d-4b8d-9a0b-36831cbab991', CAST(0x0000A9B000E5587D AS DateTime), N'/news', N'b164a2192d3dbe46f1615e53e2e4507aefc393d0')
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup] 
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup] 
(
	[userGroupName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(0x0000A9B000FB0DDF AS DateTime), CAST(0x0000A9B000FB0DDF AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(0x0000A9B000FB0DE0 AS DateTime), CAST(0x0000A9B000FB0DE0 AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(0x0000A9B000FB0DE0 AS DateTime), CAST(0x0000A9B000FB0DE0 AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(0x0000A9B000FB0DE0 AS DateTime), CAST(0x0000A9B000FB0DE0 AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(0x0000A9B000FB0DE1 AS DateTime), CAST(0x0000A9B000FB0DE1 AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode] 
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4676990e-1659-45ff-b82f-97e905d00f23', 0, CAST(0x0000A9B000CC880E AS DateTime), CAST(0x0000A9B000D7063D AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6a01dffd-8d78-4304-a23c-a8c5dd5c0efb', 0, CAST(0x0000A9B0010949B6 AS DateTime), CAST(0x0000A9B00111E020 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'2aa71b53-a6da-4dd0-b1d8-d310838a02eb', 0, CAST(0x0000A9B000A06FEA AS DateTime), CAST(0x0000A9B000C8DF81 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'f99dbada-fc80-4bf8-b5fd-e24954ba256b', 0, CAST(0x0000A9B000DB961B AS DateTime), CAST(0x0000A9B000DEB7FC AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'72cd6b6b-0f91-4df1-b54b-e8e386244657', 0, CAST(0x0000A9B000F42757 AS DateTime), CAST(0x0000A9B00104D4F9 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'e22372d4-ce2a-407c-ba0e-fec53a71617a', 0, CAST(0x0000A9B000E533DB AS DateTime), CAST(0x0000A9B000E92525 AS DateTime), NULL, N'::1')
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'developer')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (0, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (0, 5)
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule] 
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup] 
(
	[uniqueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (5, 1031, N'Contents', 1, N'79995fa2-63ee-453c-a29b-2e66f324cdbe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1068, N'Meta Details', 0, N'28b473a7-dd86-4e5d-89b2-4b31f0ed4be8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (13, 1068, N'Banner Section', 1, N'ebc0b201-5df4-472a-9599-9cd16adc4ddf')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (14, 1068, N'Slider', 2, N'850457ce-7443-4a9e-bf6f-ad390b92c152')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (15, 1068, N'Article', 3, N'91fc89f9-2566-40ba-802c-86130e8d4cb4')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (16, 1068, N'News', 4, N'1e1e5b2e-4ad3-47f3-8e03-414d786cc3a2')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (17, 1077, N'General', 0, N'049b377a-716c-49fc-b16a-9b33f455e09d')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (18, 1084, N'General', 0, N'99de22c5-98ec-4918-b276-06aed4acad20')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (19, 1089, N'General', 0, N'e9b4debd-234d-4330-9d41-fe2803fd6b22')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (20, 1089, N'Banner Details', 1, N'f203f47e-fd67-45be-856e-81fc4e74fa0c')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (21, 1114, N'List', 0, N'3cb9d26b-21b8-4b0f-acb5-116b0d2a933c')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (22, 1120, N'General', 0, N'bec1d741-689f-48da-a033-bdbf75bc8b62')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
/****** Object:  Table [dbo].[cmsContent]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1069, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (2, 1070, 1068)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (3, 1071, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1078, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1079, 1077)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1087, 1084)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (7, 1098, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (8, 1099, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (9, 1100, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (10, 1101, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (11, 1102, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (12, 1103, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (13, 1104, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (14, 1105, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (15, 1106, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (16, 1121, 1120)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (17, 1122, 1114)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1068, 1077, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1084, 1089, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1120, 1114, 0)
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-9, -96, N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]', 5, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-8, -96, N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]', 4, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-7, -96, N'desc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-6, -96, N'updateDate', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-5, -96, N'100', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'username', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1041, N'Json', 0, N'storageType')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1049, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1054, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (8, 1055, N'1000', 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (9, 1056, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (10, 1057, N'0', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (11, 1057, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (12, 1057, N'0', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (13, 1057, N'', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (14, 1058, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (15, 1059, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (16, 1059, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (17, 1060, N'10', 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (18, 1061, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (19, 1062, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (20, 1062, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (21, 1063, N'0', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (22, 1063, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (23, 1063, N'0', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (24, 1063, N'', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (25, 1064, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (26, 1065, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (27, 1065, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (28, 1066, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (29, 1067, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (30, 1067, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (31, 1072, N'{
  "type": "content",
  "id": "umb://document/014bc3fd4686490daad3858f9948793e"
}', 1, N'startNode')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (32, 1072, NULL, 2, N'filter')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (33, 1072, NULL, 3, N'minNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (34, 1072, NULL, 4, N'maxNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (35, 1072, N'0', 5, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (36, 1073, N'{
  "type": "content"
}', 1, N'startNode')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (37, 1073, NULL, 2, N'filter')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (38, 1073, NULL, 3, N'minNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (39, 1073, NULL, 4, N'maxNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (40, 1073, N'0', 5, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (41, 1074, N'{
  "type": "media"
}', 1, N'startNode')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (42, 1074, NULL, 2, N'filter')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (43, 1074, NULL, 3, N'minNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (44, 1074, NULL, 4, N'maxNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (45, 1074, N'0', 5, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (46, 1075, N'0', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (47, 1075, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (48, 1075, N'0', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (49, 1075, N'', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (50, 1076, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (51, 1076, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (52, 1080, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (57, 1081, N'0', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (58, 1081, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (59, 1081, N'0', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (60, 1081, N'', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (61, 1082, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (62, 1083, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (63, 1083, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (64, 1085, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (65, 1086, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (66, 1086, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (67, 1090, N'0', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (68, 1090, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (69, 1090, N'0', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (70, 1090, N'', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (71, 1091, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (72, 1092, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (73, 1092, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (74, 1093, N'0', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (75, 1093, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (76, 1093, N'0', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (77, 1093, N'', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (78, 1094, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (79, 1095, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (80, 1096, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (81, 1096, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (82, 1097, N'0', 1, N'default')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (83, 1108, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (84, 1109, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (85, 1110, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (86, 1111, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (87, 1112, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (88, 1113, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (89, 1115, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (90, 1116, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (91, 1117, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (92, 1118, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (93, 1118, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (94, 1119, NULL, 1, N'maxChars')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsMemberType] ON
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (1, 1044, 35, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (2, 1044, 36, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (3, 1044, 28, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (4, 1044, 29, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (5, 1044, 30, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (6, 1044, 31, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (7, 1044, 32, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (8, 1044, 33, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (9, 1044, 34, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsMemberType] OFF
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1068, 1052, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1084, 1053, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1089, 1088, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1120, 1107, 1)
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL,
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument] 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsDocument_newest] ON [dbo].[cmsDocument] 
(
	[newest] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsDocument_published] ON [dbo].[cmsDocument] 
(
	[published] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 1, 0, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', N'Test news1', NULL, NULL, CAST(0x0000A9B0015DD27A AS DateTime), 1088, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'bf4f8312-66d9-43e7-9950-2aad18412028', N'News', NULL, NULL, CAST(0x0000A9B00137BDBC AS DateTime), 1053, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1122, 1, 0, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', N'Sibin 08-12-2018 22:07', NULL, NULL, CAST(0x0000A9B0016C7DA0 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1103, 0, 0, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', N'Test News4', NULL, NULL, CAST(0x0000A9B0015412B1 AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 1, 0, N'f3f1257d-984e-4e48-aadf-3b2848a36c00', N'Slider1', NULL, NULL, CAST(0x0000A9B0012B5A70 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B001133914 AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1105, 1, 0, N'e0393ca2-6445-46a3-8c73-3f973d809660', N'Test News6', NULL, NULL, CAST(0x0000A9B00165A022 AS DateTime), 1088, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1121, 1, 0, N'0218d8c4-43d7-48ae-a464-4643113fb5a6', N'Contact Us', NULL, NULL, CAST(0x0000A9B0016AF8F0 AS DateTime), 1107, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'f60233c9-6259-4e23-912a-48a60d1c147e', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B00107AA68 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B00112927E AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1106, 0, 0, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', N'Test News7', NULL, NULL, CAST(0x0000A9B001549275 AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 1, 0, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', N'Home', NULL, NULL, CAST(0x0000A9B00159C666 AS DateTime), 1052, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1104, 0, 0, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', N'Test News5', NULL, NULL, CAST(0x0000A9B001544AB7 AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1105, 0, 0, N'cc975bb8-4d17-4f01-a4a2-643da7733858', N'Test News6', NULL, NULL, CAST(0x0000A9B00154730E AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'5d94d387-e544-4049-b1d0-67478b0117af', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B0011ED8F6 AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B00110BD42 AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 0, 0, N'5b4dbebc-5845-427e-873f-71077ea74c46', N'Slider1', NULL, NULL, CAST(0x0000A9B0012B27E1 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B0010FFBF5 AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 1, 0, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', N'Test News3', NULL, NULL, CAST(0x0000A9B00165756C AS DateTime), 1088, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'43ffb036-90f4-4718-8679-782aeb1947e2', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B00112CE2A AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 0, 0, N'f2b715f1-5823-4873-927b-7b40505aa150', N'Test News2', NULL, NULL, CAST(0x0000A9B001537DD1 AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 1, 0, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', N'News Listing', NULL, NULL, CAST(0x0000A9B001539EA0 AS DateTime), 1053, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', N'Home', NULL, NULL, CAST(0x0000A9B0012A94BB AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1103, 1, 0, N'23b63bb2-02d3-486b-ad99-849fc958d016', N'Test News4', NULL, NULL, CAST(0x0000A9B00165834B AS DateTime), 1088, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1104, 1, 0, N'9851d9b2-3a34-426c-ad9e-949132868d05', N'Test News5', NULL, NULL, CAST(0x0000A9B001659273 AS DateTime), 1088, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1106, 1, 0, N'74837314-a9ae-4304-8bbc-964da2875a5d', N'Test News7', NULL, NULL, CAST(0x0000A9B00165AC60 AS DateTime), 1088, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 1, 0, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', N'Test News2', NULL, NULL, CAST(0x0000A9B001656429 AS DateTime), 1088, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 0, 0, N'64a11812-ee4f-415f-a924-a9f25d685b0e', N'Test News3', NULL, NULL, CAST(0x0000A9B00153EC16 AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', N'Test news1', NULL, NULL, CAST(0x0000A9B0015C5647 AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'bdd7fe55-af41-4915-bb71-b1828fb42277', N'Test news1', NULL, NULL, CAST(0x0000A9B00159603A AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 0, 0, N'189820de-b6c1-4b00-9522-c2504769ae28', N'Test News2', NULL, NULL, CAST(0x0000A9B001653F24 AS DateTime), 1088, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1070, 0, 0, N'51043ecd-d388-465f-9f8c-da4ea26c733f', N'machinetest.dev', NULL, NULL, CAST(0x0000A9B00114B864 AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', N'Test news1', NULL, NULL, CAST(0x0000A9B00152D936 AS DateTime), 1088, 0)
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1069, N'<Image id="1069" key="cf0ccca9-3204-4d2e-8ded-364858db3490" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:58:42" updateDate="2018-12-08T15:58:42" nodeName="header.jpg" urlName="headerjpg" path="-1,1069" isDoc="" nodeType="1032" writerName="admin" writerID="0" version="1ce3991e-267f-4a61-8de8-75f230fde9e6" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1001/header.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[2000]]></umbracoWidth><umbracoHeight><![CDATA[1297]]></umbracoHeight><umbracoBytes><![CDATA[193317]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1070, N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T20:58:55" nodeName="Home" urlName="home" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP</p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderDescription><![CDATA[<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription><articleDescription><![CDATA[<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>]]></articleDescription><articleImage><![CDATA[umb://media/176a36213e00483eb0965dbeff86d4a6]]></articleImage><newsDescription><![CDATA[<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>]]></newsDescription><newsTitle><![CDATA[Morbi ullamcorper et varius leo lacus]]></newsTitle></home>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1071, N'<Image id="1071" key="176a3621-3e00-483e-b096-5dbeff86d4a6" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-12-08T16:44:05" updateDate="2018-12-08T16:44:05" nodeName="pic06.jpg" urlName="pic06jpg" path="-1,1071" isDoc="" nodeType="1032" writerName="admin" writerID="0" version="995905df-ebaa-43ab-aac8-6506744e41cd" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1002/pic06.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[1200]]></umbracoWidth><umbracoHeight><![CDATA[551]]></umbracoHeight><umbracoBytes><![CDATA[52798]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1078, N'<Image id="1078" key="cc8a53d5-334a-4de2-8141-5676ea40248d" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2018-12-08T18:08:37" updateDate="2018-12-08T18:08:37" nodeName="pic01.jpg" urlName="pic01jpg" path="-1,1078" isDoc="" nodeType="1032" writerName="admin" writerID="0" version="e0e46ea3-edcb-40f9-9c50-334f4eba74b5" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1003/pic01.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[368]]></umbracoWidth><umbracoHeight><![CDATA[256]]></umbracoHeight><umbracoBytes><![CDATA[9355]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1079, N'<sliderImages id="1079" key="0b04d505-417b-4a1f-aa2c-147c7c620194" parentID="1070" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T18:09:11" updateDate="2018-12-08T18:09:54" nodeName="Slider1" urlName="slider1" path="-1,1070,1079" isDoc="" nodeType="1077" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="sliderImages" isPublished="true"><description><![CDATA[<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>]]></description><title><![CDATA[Pulvinar sagittis congue]]></title><image><![CDATA[umb://media/cc8a53d5334a4de281415676ea40248d]]></image></sliderImages>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1087, N'<newsListing id="1087" key="f6dd443c-fc8d-4b8d-9a0b-36831cbab991" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-12-08T18:55:00" updateDate="2018-12-08T20:36:31" nodeName="News Listing" urlName="news-listing" path="-1,1087" isDoc="" nodeType="1084" creatorName="admin" writerName="admin" writerID="0" template="1053" nodeTypeAlias="newsListing" isPublished="true"><bannerTitle><![CDATA[Helios]]></bannerTitle><contentDescription><![CDATA[<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>]]></contentDescription><contentTitle><![CDATA[Morbi ullamcorper et varius leo lacus]]></contentTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></newsListing>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1098, N'<Image id="1098" key="92981f59-6bf9-4c77-8f5e-c75843d19d10" parentID="-1" level="1" creatorID="0" sortOrder="3" createDate="2018-12-08T20:33:19" updateDate="2018-12-08T20:33:19" nodeName="pic07.jpg" urlName="pic07jpg" path="-1,1098" isDoc="" nodeType="1032" writerName="admin" writerID="0" version="f440ba96-61d7-4748-a2b3-f81ad9b56fd4" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1004/pic07.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[368]]></umbracoWidth><umbracoHeight><![CDATA[256]]></umbracoHeight><umbracoBytes><![CDATA[8923]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1099, N'<news id="1099" key="f9629ddf-b341-4f07-875e-3aea5879f56a" parentID="1087" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T20:33:42" updateDate="2018-12-08T21:13:39" nodeName="Test news1" urlName="test-news1" path="-1,1087,1099" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>1</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>
<p> </p>
<h3>Ultrices tempor sagittis nisl</h3>
<p>Nascetur volutpat nibh ullamcorper vivamus at purus. Cursus ultrices porttitor sollicitudin imperdiet at pretium tellus in euismod a integer sodales neque. Nibh quis dui quis mattis eget imperdiet venenatis feugiat. Neque primis ligula cum erat aenean tristique luctus risus ipsum praesent iaculis. Fermentum elit fringilla consequat dis arcu. Pellentesque mus tempor vitae pretium sodales porttitor lacus. Phasellus egestas odio nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>
<p>Eleifend auctor turpis magnis sed porta nisl pretium. Aenean suspendisse nulla eget sed etiam parturient orci cursus nibh. Quisque eu nec neque felis laoreet diam morbi egestas. Dignissim cras rutrum consectetur ut penatibus fermentum nibh erat malesuada varius.</p>
<h3>Augue euismod feugiat tempus</h3>
<p>Pretium tellus in euismod a integer sodales neque. Nibh quis dui quis mattis eget imperdiet venenatis feugiat. Neque primis ligula cum erat aenean tristique luctus risus ipsum praesent iaculis. Fermentum elit ut nunc urna volutpat donec cubilia commodo risus morbi. Lobortis vestibulum velit malesuada ante egestas odio nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><bannerTitle><![CDATA[News 1]]></bannerTitle></news>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1100, N'<Image id="1100" key="6494415a-bf5f-4485-8c55-bd7d41c95366" parentID="-1" level="1" creatorID="0" sortOrder="4" createDate="2018-12-08T20:35:24" updateDate="2018-12-08T20:35:24" nodeName="pic08.jpg" urlName="pic08jpg" path="-1,1100" isDoc="" nodeType="1032" writerName="admin" writerID="0" version="057f2c8d-9348-4ab6-8fa6-9d06f5b39798" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1005/pic08.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[368]]></umbracoWidth><umbracoHeight><![CDATA[256]]></umbracoHeight><umbracoBytes><![CDATA[9134]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1101, N'<news id="1101" key="53ef59a0-b7b3-481e-9968-beb1a9320f35" parentID="1087" level="2" creatorID="0" sortOrder="1" createDate="2018-12-08T20:36:03" updateDate="2018-12-08T21:41:13" nodeName="Test News2" urlName="test-news2" path="-1,1087,1101" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Sed quis rhoncus placerat]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><bannerTitle><![CDATA[Test News2]]></bannerTitle></news>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1102, N'<news id="1102" key="236af23f-ba99-4d5e-85a7-01162dc30773" parentID="1087" level="2" creatorID="0" sortOrder="2" createDate="2018-12-08T20:37:37" updateDate="2018-12-08T21:41:28" nodeName="Test News3" urlName="test-news3" path="-1,1087,1102" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Magna laoreet et aliquam]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1103, N'<news id="1103" key="8ff0c824-3240-4ebd-8ac6-d79f48216ad6" parentID="1087" level="2" creatorID="0" sortOrder="3" createDate="2018-12-08T20:38:10" updateDate="2018-12-08T21:41:39" nodeName="Test News4" urlName="test-news4" path="-1,1087,1103" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Sed quis rhoncus placerat]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1104, N'<news id="1104" key="d28f86c0-7c6f-4702-974d-73afd173b3d1" parentID="1087" level="2" creatorID="0" sortOrder="4" createDate="2018-12-08T20:38:57" updateDate="2018-12-08T21:41:52" nodeName="Test News5" urlName="test-news5" path="-1,1087,1104" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1105, N'<news id="1105" key="7dd69837-8dc2-4561-96dc-2666bd3fce75" parentID="1087" level="2" creatorID="0" sortOrder="5" createDate="2018-12-08T20:39:32" updateDate="2018-12-08T21:42:04" nodeName="Test News6" urlName="test-news6" path="-1,1087,1105" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1106, N'<news id="1106" key="4826c6d5-2293-41eb-aaa0-5636e28373a8" parentID="1087" level="2" creatorID="0" sortOrder="6" createDate="2018-12-08T20:39:59" updateDate="2018-12-08T21:42:14" nodeName="Test News7" urlName="test-news7" path="-1,1087,1106" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Magna laoreet et aliquam]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1121, N'<contactUs id="1121" key="796ace22-f1de-41f8-800a-fc2f61ac4f83" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2018-12-08T22:01:32" updateDate="2018-12-08T22:01:32" nodeName="Contact Us" urlName="contact-us" path="-1,1121" isDoc="" nodeType="1120" creatorName="admin" writerName="admin" writerID="0" template="1107" nodeTypeAlias="contactUs" isPublished="true"><address><![CDATA[<p>Test</p>]]></address><headContent><![CDATA[Test]]></headContent><buttonText><![CDATA[Test]]></buttonText><headin><![CDATA[Test]]></headin></contactUs>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1122, N'<listContact id="1122" key="9dab4be7-a91c-4252-b79a-7f318e296c11" parentID="1121" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T22:07:04" updateDate="2018-12-08T22:07:04" nodeName="Sibin 08-12-2018 22:07" urlName="sibin-08-12-2018-2207" path="-1,1121,1122" isDoc="" nodeType="1114" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="listContact" isPublished="true"><phone><![CDATA[8281938512]]></phone><email><![CDATA[fdfrg@sdfddg.gfg]]></email><subject><![CDATA[Test]]></subject><contactName><![CDATA[Sibin]]></contactName><message><![CDATA[Test]]></message></listContact>')
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsContentVersion_ContentId] ON [dbo].[cmsContentVersion] 
(
	[ContentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion] 
(
	[VersionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1, 1069, N'1ce3991e-267f-4a61-8de8-75f230fde9e6', CAST(0x0000A9B00107513E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (2, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', CAST(0x0000A9B00107AA68 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (3, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', CAST(0x0000A9B0010FFBF5 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (4, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', CAST(0x0000A9B00110BD42 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (5, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', CAST(0x0000A9B00112927E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (6, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', CAST(0x0000A9B00112CE2A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (7, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', CAST(0x0000A9B001133914 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (8, 1071, N'995905df-ebaa-43ab-aac8-6506744e41cd', CAST(0x0000A9B00113C7C9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (9, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', CAST(0x0000A9B00114B864 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (10, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', CAST(0x0000A9B0011ED8F6 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (11, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', CAST(0x0000A9B0012A94BB AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (12, 1078, N'e0e46ea3-edcb-40f9-9c50-334f4eba74b5', CAST(0x0000A9B0012AFFBA AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (13, 1079, N'5b4dbebc-5845-427e-873f-71077ea74c46', CAST(0x0000A9B0012B27E1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (14, 1079, N'f3f1257d-984e-4e48-aadf-3b2848a36c00', CAST(0x0000A9B0012B5A70 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (15, 1087, N'bf4f8312-66d9-43e7-9950-2aad18412028', CAST(0x0000A9B00137BDBC AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (16, 1087, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', CAST(0x0000A9B001539EA0 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (17, 1098, N'f440ba96-61d7-4748-a2b3-f81ad9b56fd4', CAST(0x0000A9B00152BE1A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (18, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', CAST(0x0000A9B00152D936 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (19, 1100, N'057f2c8d-9348-4ab6-8fa6-9d06f5b39798', CAST(0x0000A9B001535103 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (20, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', CAST(0x0000A9B001537DD1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (21, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', CAST(0x0000A9B00153EC16 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (22, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', CAST(0x0000A9B0015412B1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (23, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', CAST(0x0000A9B001544AB7 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (24, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', CAST(0x0000A9B00154730E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (25, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', CAST(0x0000A9B001549275 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (26, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', CAST(0x0000A9B00159603A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (27, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', CAST(0x0000A9B00159C666 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (28, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', CAST(0x0000A9B0015C5647 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (29, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', CAST(0x0000A9B0015DD27A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (30, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', CAST(0x0000A9B001653F24 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (31, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', CAST(0x0000A9B001656429 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (32, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', CAST(0x0000A9B00165756C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (33, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', CAST(0x0000A9B00165834B AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (34, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', CAST(0x0000A9B001659273 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (35, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', CAST(0x0000A9B00165A022 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (36, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', CAST(0x0000A9B00165AC60 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (37, 1121, N'0218d8c4-43d7-48ae-a464-4643113fb5a6', CAST(0x0000A9B0016AF8F0 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (38, 1122, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', CAST(0x0000A9B0016C7DA0 AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
/****** Object:  Table [dbo].[cmsMember]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember] 
(
	[LoginName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMedia]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMedia](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[mediaPath] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMedia] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMedia] ON [dbo].[cmsMedia] 
(
	[nodeId] ASC,
	[versionId] ASC,
	[mediaPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1069, N'1ce3991e-267f-4a61-8de8-75f230fde9e6', N'/media/1001/header.jpg')
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1071, N'995905df-ebaa-43ab-aac8-6506744e41cd', N'/media/1002/pic06.jpg')
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1078, N'e0e46ea3-edcb-40f9-9c50-334f4eba74b5', N'/media/1003/pic01.jpg')
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1098, N'f440ba96-61d7-4748-a2b3-f81ad9b56fd4', N'/media/1004/pic07.jpg')
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1100, N'057f2c8d-9348-4ab6-8fa6-9d06f5b39798', N'/media/1005/pic08.jpg')
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType] 
(
	[Alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType] 
(
	[UniqueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -96, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (35, -92, 1044, NULL, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 0, 0, NULL, NULL, N'9a625f84-c510-4faa-936b-62765712c2f0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (36, -92, 1044, NULL, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 1, 0, NULL, NULL, N'1baa39ad-94a0-4586-bd82-7863c7c3126e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (37, 1054, 1068, 12, N'metaTitle', N'Meta Title', 0, 0, NULL, NULL, N'87463278-d0ef-4f1e-a786-02a0463651f5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (38, 1055, 1068, 12, N'metaDescription', N'Meta Description', 1, 0, NULL, NULL, N'e221348a-1513-4944-955b-12675ce77427')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (39, 1056, 1068, 12, N'metaKeywords', N'Meta Keywords', 2, 0, NULL, NULL, N'72c81cfe-50d4-4611-8483-a19596ea88cc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (40, 1057, 1068, 13, N'uploadBanner', N'Upload Banner', 0, 1, NULL, NULL, N'87a31673-bf27-47b2-a372-f927982e4b5c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (41, 1058, 1068, 13, N'bannerTitle', N'Banner Title', 1, 0, NULL, NULL, N'12328926-061c-47b5-8609-74f3f496e041')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (42, 1059, 1068, 13, N'bannerDescription', N'Banner Description', 2, 0, NULL, NULL, N'6a79e530-c8d8-4f18-84c3-2424b66b7984')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (43, 1060, 1068, 13, N'bannerButtonText', N'Banner Button Text', 3, 0, NULL, N'Leave empty if you don''t want button on banner', N'a331606f-a3f8-4074-a6a5-6761b6dd2ae9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (45, 1062, 1068, 14, N'sliderDescription', N'Description', 1, 0, NULL, NULL, N'209be314-79cd-4c49-b6e9-4ae48a7c5528')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (46, 1063, 1068, 15, N'articleImage', N'Article Image', 0, 0, NULL, NULL, N'040ae0a5-1677-4ff1-a189-19fb8feb2610')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (47, 1064, 1068, 15, N'articleTitle', N'Title', 1, 0, NULL, NULL, N'9433a65d-c81a-4269-a924-c98dfcd82c23')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (48, 1065, 1068, 15, N'articleDescription', N'Description', 2, 0, NULL, NULL, N'1a516209-dd4c-4ed1-abe5-186ac4dc98e8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (49, 1066, 1068, 16, N'newsTitle', N'Title', 0, 0, NULL, NULL, N'c93b7bef-b0a8-45fd-befa-2b81b8cc0139')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (50, 1067, 1068, 16, N'newsDescription', N'Description', 1, 0, NULL, NULL, N'4f75416d-dccf-4e32-b6c7-1a7becd7338c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (53, 1075, 1077, 17, N'image', N'Image', 0, 1, NULL, NULL, N'45b772b5-9306-42b5-930e-f708f648abd3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (54, 1076, 1077, 17, N'description', N'Description', 1, 1, NULL, NULL, N'15f7aabb-74f7-4961-8b66-39fd29c7cc90')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (55, 1080, 1077, 17, N'title', N'Title', 2, 1, NULL, NULL, N'8f859522-b5c1-4fb2-a3ff-6edc9b28fbe0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (56, 1081, 1084, 18, N'uploadBanner', N'Banner Image', 0, 0, NULL, NULL, N'223667e0-b266-4a3c-a80e-a4bdc15350e7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (57, 1082, 1084, 18, N'bannerTitle', N'Banner Title', 1, 0, NULL, NULL, N'b2037507-89ee-41f7-9608-251979845992')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (58, 1083, 1084, 18, N'bannerDescription', N'Banner Description', 2, 0, NULL, NULL, N'840e9230-dc28-42f7-8a1a-e805c0763e3a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (59, 1085, 1084, 18, N'contentTitle', N'Content Title', 3, 0, NULL, NULL, N'32fcd9cd-fd9f-4363-a367-4dc76a190d07')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (60, 1086, 1084, 18, N'contentDescription', N'Content Description', 4, 0, NULL, NULL, N'9790fdc1-7618-466e-9ec6-3945a6f9104f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (61, 1090, 1089, 19, N'newsImage', N'News Image', 0, 1, NULL, NULL, N'98e0793d-dd09-4c02-aa68-915869d8d200')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (62, 1091, 1089, 19, N'newsTitle', N'News Title', 1, 1, NULL, NULL, N'19a6efbb-cc0e-4ab5-b483-d560a122239d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (63, 1092, 1089, 19, N'newsDescription', N'News Description', 2, 1, NULL, NULL, N'5951ffe0-9b7a-4e2b-96a9-7f4a63e0952f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (64, 1093, 1089, 20, N'uploadBanner', N'Upload Banner', 0, 1, NULL, NULL, N'c1c6880c-02f0-4095-a071-e81e2753e981')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (66, 1095, 1089, 20, N'bannerTitle', N'Banner Title', 1, 0, NULL, NULL, N'2e9c7622-1f24-4214-bc15-f42b94ab65ab')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (67, 1096, 1089, 20, N'bannerDescription', N'BannerDescription', 2, 0, NULL, NULL, N'757f3a4c-d07c-4094-b8b7-400f5208e3ca')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (68, 1097, 1089, 19, N'isFeatured', N'Is featured?', 3, 0, NULL, N'Is featured will list on home page', N'4c8d7925-a6ed-409b-bcaa-6f0576e6ec15')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (69, 1108, 1114, 21, N'contactName', N'name', 0, 0, NULL, NULL, N'fb307951-9e00-4a46-a4e2-68f67118ccf3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (70, 1109, 1114, 21, N'email', N'email', 1, 0, NULL, NULL, N'2ef90c4c-51c8-4d07-8b17-56be410128a4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (71, 1111, 1114, 21, N'phone', N'phone', 2, 0, NULL, NULL, N'69e76df0-c771-4585-932c-4a94b4c377d0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (72, 1112, 1114, 21, N'subject', N'subject', 3, 0, NULL, NULL, N'5c728d51-4552-48c9-a916-5b2a15c32a03')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (73, 1113, 1114, 21, N'message', N'message', 4, 0, NULL, NULL, N'62bacae9-fe22-4a6f-91ae-8ba2810a5c5f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (74, 1115, 1120, 22, N'headin', N'heading', 0, 0, NULL, NULL, N'22ca7913-fcb2-4fd0-97f9-bdf78eb90e53')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (75, 1116, 1120, 22, N'headContent', N'Head Content', 1, 0, NULL, NULL, N'd26bfcda-a1e8-45d6-9006-2a6febf100fb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (76, 1118, 1120, 22, N'address', N'address', 2, 0, NULL, NULL, N'7d9b7990-940a-40a1-9199-0a2369993c92')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (77, 1119, 1120, 22, N'buttonText', N'Button Text', 3, 0, NULL, NULL, N'566c2ac6-ea10-483e-b94b-ba2eeb34b7c2')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDecimal] [decimal](38, 6) NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData] 
(
	[contentNodeId] ASC,
	[versionId] ASC,
	[propertytypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData] 
(
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData] 
(
	[propertytypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1069, N'1ce3991e-267f-4a61-8de8-75f230fde9e6', 6, NULL, NULL, NULL, NULL, N'{"src": "/media/1001/header.jpg", "crops": []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1069, N'1ce3991e-267f-4a61-8de8-75f230fde9e6', 7, NULL, NULL, NULL, N'2000', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1069, N'1ce3991e-267f-4a61-8de8-75f230fde9e6', 8, NULL, NULL, NULL, N'1297', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1069, N'1ce3991e-267f-4a61-8de8-75f230fde9e6', 9, NULL, NULL, NULL, N'193317', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1069, N'1ce3991e-267f-4a61-8de8-75f230fde9e6', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (7, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (8, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (9, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 45, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 48, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (16, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (23, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 45, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 48, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (40, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (42, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 45, NULL, NULL, NULL, NULL, N'<p>A (free) responsive site template by &lt;a href="http://html5up.net"&gt;HTML5 UP&lt;/a&gt;.<br />Built with HTML5/CSS3 and released under the &lt;a href="http://html5up.net/license"&gt;CCA&lt;/a&gt; license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (43, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 48, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (44, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (48, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (49, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (50, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (51, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (52, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (53, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (54, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (56, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 45, NULL, NULL, NULL, NULL, N'<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 48, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (60, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (61, 1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (62, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (63, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (64, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (65, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (67, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (68, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (70, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 45, NULL, NULL, NULL, NULL, N'<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (71, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 48, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (72, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (73, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (74, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (75, 1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (76, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (77, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (78, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (79, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (80, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (81, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (82, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (83, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 45, NULL, NULL, NULL, NULL, N'<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (84, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 48, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (85, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (86, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (87, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (88, 1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (89, 1071, N'995905df-ebaa-43ab-aac8-6506744e41cd', 6, NULL, NULL, NULL, NULL, N'{"src": "/media/1002/pic06.jpg", "crops": []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (90, 1071, N'995905df-ebaa-43ab-aac8-6506744e41cd', 7, NULL, NULL, NULL, N'1200', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (91, 1071, N'995905df-ebaa-43ab-aac8-6506744e41cd', 8, NULL, NULL, NULL, N'551', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (92, 1071, N'995905df-ebaa-43ab-aac8-6506744e41cd', 9, NULL, NULL, NULL, N'52798', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (93, 1071, N'995905df-ebaa-43ab-aac8-6506744e41cd', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (94, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (95, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (96, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (97, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (98, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (99, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (100, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (101, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 45, NULL, NULL, NULL, NULL, N'<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (102, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 48, NULL, NULL, NULL, NULL, N'<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (103, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 46, NULL, NULL, NULL, NULL, N'umb://media/176a36213e00483eb0965dbeff86d4a6')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (104, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (105, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 50, NULL, NULL, NULL, NULL, N'')
GO
print 'Processed 100 total records'
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (106, 1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (107, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (108, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (109, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (110, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (111, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (112, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (113, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (114, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 45, NULL, NULL, NULL, NULL, N'<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (115, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 48, NULL, NULL, NULL, NULL, N'<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (116, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 46, NULL, NULL, NULL, NULL, N'umb://media/176a36213e00483eb0965dbeff86d4a6')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (117, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (118, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (119, 1070, N'5d94d387-e544-4049-b1d0-67478b0117af', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (120, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (121, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (122, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (123, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (124, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (125, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (126, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (127, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 45, NULL, NULL, NULL, NULL, N'<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (128, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 48, NULL, NULL, NULL, NULL, N'<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (129, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 46, NULL, NULL, NULL, NULL, N'umb://media/176a36213e00483eb0965dbeff86d4a6')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (130, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (131, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 50, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (132, 1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', 49, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (133, 1078, N'e0e46ea3-edcb-40f9-9c50-334f4eba74b5', 6, NULL, NULL, NULL, NULL, N'{"src": "/media/1003/pic01.jpg", "crops": []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (134, 1078, N'e0e46ea3-edcb-40f9-9c50-334f4eba74b5', 7, NULL, NULL, NULL, N'368', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (135, 1078, N'e0e46ea3-edcb-40f9-9c50-334f4eba74b5', 8, NULL, NULL, NULL, N'256', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (136, 1078, N'e0e46ea3-edcb-40f9-9c50-334f4eba74b5', 9, NULL, NULL, NULL, N'9355', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (137, 1078, N'e0e46ea3-edcb-40f9-9c50-334f4eba74b5', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (138, 1079, N'5b4dbebc-5845-427e-873f-71077ea74c46', 54, NULL, NULL, NULL, NULL, N'<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (139, 1079, N'5b4dbebc-5845-427e-873f-71077ea74c46', 53, NULL, NULL, NULL, NULL, N'umb://media/cc8a53d5334a4de281415676ea40248d')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (140, 1079, N'f3f1257d-984e-4e48-aadf-3b2848a36c00', 54, NULL, NULL, NULL, NULL, N'<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (141, 1079, N'f3f1257d-984e-4e48-aadf-3b2848a36c00', 55, NULL, NULL, NULL, N'Pulvinar sagittis congue', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (142, 1079, N'f3f1257d-984e-4e48-aadf-3b2848a36c00', 53, NULL, NULL, NULL, NULL, N'umb://media/cc8a53d5334a4de281415676ea40248d')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (143, 1087, N'bf4f8312-66d9-43e7-9950-2aad18412028', 57, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (144, 1087, N'bf4f8312-66d9-43e7-9950-2aad18412028', 60, NULL, NULL, NULL, NULL, N'<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (145, 1087, N'bf4f8312-66d9-43e7-9950-2aad18412028', 59, NULL, NULL, NULL, N'Morbi ullamcorper et varius leo lacus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (146, 1087, N'bf4f8312-66d9-43e7-9950-2aad18412028', 56, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (147, 1087, N'bf4f8312-66d9-43e7-9950-2aad18412028', 58, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (148, 1087, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', 57, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (149, 1087, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', 60, NULL, NULL, NULL, NULL, N'<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (150, 1087, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', 59, NULL, NULL, NULL, N'Morbi ullamcorper et varius leo lacus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (151, 1087, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', 56, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (152, 1087, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', 58, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (153, 1098, N'f440ba96-61d7-4748-a2b3-f81ad9b56fd4', 6, NULL, NULL, NULL, NULL, N'{"src": "/media/1004/pic07.jpg", "crops": []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (154, 1098, N'f440ba96-61d7-4748-a2b3-f81ad9b56fd4', 7, NULL, NULL, NULL, N'368', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (155, 1098, N'f440ba96-61d7-4748-a2b3-f81ad9b56fd4', 8, NULL, NULL, NULL, N'256', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (156, 1098, N'f440ba96-61d7-4748-a2b3-f81ad9b56fd4', 9, NULL, NULL, NULL, N'8923', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (157, 1098, N'f440ba96-61d7-4748-a2b3-f81ad9b56fd4', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (158, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (159, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (160, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (161, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (162, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (163, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (164, 1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (165, 1100, N'057f2c8d-9348-4ab6-8fa6-9d06f5b39798', 6, NULL, NULL, NULL, NULL, N'{"src": "/media/1005/pic08.jpg", "crops": []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (166, 1100, N'057f2c8d-9348-4ab6-8fa6-9d06f5b39798', 7, NULL, NULL, NULL, N'368', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (167, 1100, N'057f2c8d-9348-4ab6-8fa6-9d06f5b39798', 8, NULL, NULL, NULL, N'256', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (168, 1100, N'057f2c8d-9348-4ab6-8fa6-9d06f5b39798', 9, NULL, NULL, NULL, N'9134', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (169, 1100, N'057f2c8d-9348-4ab6-8fa6-9d06f5b39798', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (170, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (171, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (172, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', 61, NULL, NULL, NULL, NULL, N'umb://media/6494415abf5f44858c55bd7d41c95366')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (173, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', 62, NULL, NULL, NULL, N'Sed quis rhoncus placerat', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (174, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (175, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (176, 1101, N'f2b715f1-5823-4873-927b-7b40505aa150', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (177, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (178, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (179, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (180, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', 62, NULL, NULL, NULL, N'Magna laoreet et aliquam', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (181, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (182, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (183, 1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (184, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (185, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (186, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', 61, NULL, NULL, NULL, NULL, N'umb://media/6494415abf5f44858c55bd7d41c95366')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (187, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', 62, NULL, NULL, NULL, N'Sed quis rhoncus placerat', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (188, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (189, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (190, 1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (191, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (192, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (193, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (194, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (195, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (196, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (197, 1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (198, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (199, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (200, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (201, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (202, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (203, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (204, 1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (205, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (206, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
GO
print 'Processed 200 total records'
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (207, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', 61, NULL, NULL, NULL, NULL, N'umb://media/6494415abf5f44858c55bd7d41c95366')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (208, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', 62, NULL, NULL, NULL, N'Magna laoreet et aliquam', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (209, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (210, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (211, 1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (212, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', 68, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (213, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (214, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (215, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (216, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (217, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', 64, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (218, 1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (219, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (220, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 38, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (221, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 39, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (222, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 42, NULL, NULL, NULL, NULL, N'<p>Another fine freebie by HTML5 UP</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (223, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 43, NULL, NULL, NULL, N'Start', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (224, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 41, NULL, NULL, NULL, N'Helios', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (225, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 40, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (226, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 45, NULL, NULL, NULL, NULL, N'<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (227, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 48, NULL, NULL, NULL, NULL, N'<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (228, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 46, NULL, NULL, NULL, NULL, N'umb://media/176a36213e00483eb0965dbeff86d4a6')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (229, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (230, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 50, NULL, NULL, NULL, NULL, N'<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (231, 1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', 49, NULL, NULL, NULL, N'Morbi ullamcorper et varius leo lacus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (232, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', 68, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (233, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (234, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (235, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (236, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (237, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (238, 1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', 66, NULL, NULL, NULL, N'News 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (239, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', 68, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (240, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>
<p> </p>
<h3>Ultrices tempor sagittis nisl</h3>
<p>Nascetur volutpat nibh ullamcorper vivamus at purus. Cursus ultrices porttitor sollicitudin imperdiet at pretium tellus in euismod a integer sodales neque. Nibh quis dui quis mattis eget imperdiet venenatis feugiat. Neque primis ligula cum erat aenean tristique luctus risus ipsum praesent iaculis. Fermentum elit fringilla consequat dis arcu. Pellentesque mus tempor vitae pretium sodales porttitor lacus. Phasellus egestas odio nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>
<p>Eleifend auctor turpis magnis sed porta nisl pretium. Aenean suspendisse nulla eget sed etiam parturient orci cursus nibh. Quisque eu nec neque felis laoreet diam morbi egestas. Dignissim cras rutrum consectetur ut penatibus fermentum nibh erat malesuada varius.</p>
<h3>Augue euismod feugiat tempus</h3>
<p>Pretium tellus in euismod a integer sodales neque. Nibh quis dui quis mattis eget imperdiet venenatis feugiat. Neque primis ligula cum erat aenean tristique luctus risus ipsum praesent iaculis. Fermentum elit ut nunc urna volutpat donec cubilia commodo risus morbi. Lobortis vestibulum velit malesuada ante egestas odio nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (241, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (242, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (243, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (244, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (245, 1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', 66, NULL, NULL, NULL, N'News 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (246, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (247, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (248, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', 61, NULL, NULL, NULL, NULL, N'umb://media/6494415abf5f44858c55bd7d41c95366')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (249, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', 62, NULL, NULL, NULL, N'Sed quis rhoncus placerat', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (250, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (251, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (252, 1101, N'189820de-b6c1-4b00-9522-c2504769ae28', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (253, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (254, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (255, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', 61, NULL, NULL, NULL, NULL, N'umb://media/6494415abf5f44858c55bd7d41c95366')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (256, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', 62, NULL, NULL, NULL, N'Sed quis rhoncus placerat', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (257, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (258, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (259, 1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', 66, NULL, NULL, NULL, N'Test News2', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (260, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (261, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (262, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (263, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', 62, NULL, NULL, NULL, N'Magna laoreet et aliquam', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (264, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (265, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (266, 1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (267, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (268, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (269, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', 61, NULL, NULL, NULL, NULL, N'umb://media/6494415abf5f44858c55bd7d41c95366')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (270, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', 62, NULL, NULL, NULL, N'Sed quis rhoncus placerat', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (271, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (272, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (273, 1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (274, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (275, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (276, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (277, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (278, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (279, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (280, 1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (281, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (282, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (283, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', 61, NULL, NULL, NULL, NULL, N'umb://media/92981f596bf94c778f5ec75843d19d10')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (284, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', 62, NULL, NULL, NULL, N'Gravida aliquam penatibus', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (285, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (286, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (287, 1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (288, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', 68, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (289, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', 63, NULL, NULL, NULL, NULL, N'<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (290, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', 61, NULL, NULL, NULL, NULL, N'umb://media/6494415abf5f44858c55bd7d41c95366')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (291, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', 62, NULL, NULL, NULL, N'Magna laoreet et aliquam', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (292, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', 67, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (293, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', 64, NULL, NULL, NULL, NULL, N'umb://media/cf0ccca932044d2e8ded364858db3490')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (294, 1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', 66, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (295, 1121, N'0218d8c4-43d7-48ae-a464-4643113fb5a6', 76, NULL, NULL, NULL, NULL, N'<p>Test</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (296, 1121, N'0218d8c4-43d7-48ae-a464-4643113fb5a6', 75, NULL, NULL, NULL, N'Test', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (297, 1121, N'0218d8c4-43d7-48ae-a464-4643113fb5a6', 77, NULL, NULL, NULL, N'Test', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (298, 1121, N'0218d8c4-43d7-48ae-a464-4643113fb5a6', 74, NULL, NULL, NULL, N'Test', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (299, 1122, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', 71, NULL, NULL, NULL, N'8281938512', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (300, 1122, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', 70, NULL, NULL, NULL, N'fdfrg@sdfddg.gfg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (301, 1122, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', 72, NULL, NULL, NULL, N'Test', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (302, 1122, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', 69, NULL, NULL, NULL, N'Sibin', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (303, 1122, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', 73, NULL, NULL, NULL, NULL, N'Test')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'666a9fc1-b5a9-427d-95db-3e9b683c91e1', CAST(0x0000A9B00113391C AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T16:42:03" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderDescription><![CDATA[<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'f60233c9-6259-4e23-912a-48a60d1c147e', CAST(0x0000A9B00107AA87 AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T15:59:58" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'6c697fc0-b59d-41bb-a9e8-4c0fa3cc9fcb', CAST(0x0000A9B001129286 AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T16:39:41" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderTitle><![CDATA[Hi. You''re looking at <strong>Helios</strong>.]]></sliderTitle><sliderDescription><![CDATA[<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'0faf9ce7-c82e-4577-9f31-5b09940275c2', CAST(0x0000A9B00159C66D AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T20:58:55" nodeName="Home" urlName="home" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP</p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderDescription><![CDATA[<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription><articleDescription><![CDATA[<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>]]></articleDescription><articleImage><![CDATA[umb://media/176a36213e00483eb0965dbeff86d4a6]]></articleImage><newsDescription><![CDATA[<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>]]></newsDescription><newsTitle><![CDATA[Morbi ullamcorper et varius leo lacus]]></newsTitle></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'5d94d387-e544-4049-b1d0-67478b0117af', CAST(0x0000A9B0011ED933 AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T17:24:22" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP</p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderDescription><![CDATA[<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription><articleDescription><![CDATA[<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>]]></articleDescription><articleImage><![CDATA[umb://media/176a36213e00483eb0965dbeff86d4a6]]></articleImage></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'5bb0cfdb-ce9d-4dd6-96f0-679eeedbdd63', CAST(0x0000A9B00110BD4B AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T16:33:00" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderTitle><![CDATA[Hi. You''re looking at <strong>Helios</strong>.]]></sliderTitle><sliderDescription><![CDATA[<p>A (free) responsive site template by &lt;a href="http://html5up.net"&gt;HTML5 UP&lt;/a&gt;.<br />Built with HTML5/CSS3 and released under the &lt;a href="http://html5up.net/license"&gt;CCA&lt;/a&gt; license.</p>]]></sliderDescription></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'319e1cbc-25c7-4b9d-9a8d-76877aaa91d6', CAST(0x0000A9B0010FFC31 AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T16:30:15" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'43ffb036-90f4-4718-8679-782aeb1947e2', CAST(0x0000A9B00112CE32 AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T16:40:32" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderDescription><![CDATA[<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'5c6a1fba-2ee9-49d3-a82d-83e78453607a', CAST(0x0000A9B0012A94DB AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T18:07:06" nodeName="Home" urlName="home" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP</p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderDescription><![CDATA[<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription><articleDescription><![CDATA[<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>]]></articleDescription><articleImage><![CDATA[umb://media/176a36213e00483eb0965dbeff86d4a6]]></articleImage></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1070, N'51043ecd-d388-465f-9f8c-da4ea26c733f', CAST(0x0000A9B00114B86C AS DateTime), N'<home id="1070" key="014bc3fd-4686-490d-aad3-858f9948793e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-12-08T15:59:58" updateDate="2018-12-08T16:47:30" nodeName="machinetest.dev" urlName="machinetestdev" path="-1,1070" isDoc="" nodeType="1068" creatorName="admin" writerName="admin" writerID="0" template="1052" nodeTypeAlias="home" isPublished="true"><bannerDescription><![CDATA[<p>Another fine freebie by HTML5 UP<a href="https://html5up.net/uploads/demos/helios/#banner" class="button circled scrolly"></a></p>]]></bannerDescription><bannerButtonText><![CDATA[Start]]></bannerButtonText><bannerTitle><![CDATA[Helios]]></bannerTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><sliderDescription><![CDATA[<h2>Hi. You''re looking at <strong>Helios</strong>.</h2>
<p>A (free) responsive site template by <a href="http://html5up.net">HTML5 UP</a>.<br />Built with HTML5/CSS3 and released under the <a href="http://html5up.net/license">CCA</a> license.</p>]]></sliderDescription><articleDescription><![CDATA[<h2><a href="#">Sed massa imperdiet magnis</a></h2>
<p>Sociis aenean eu aenean mollis mollis facilisis primis ornare penatibus aenean. Cursus ac enim pulvinar curabitur morbi convallis. Lectus malesuada sed fermentum dolore amet.</p>
<p>Commodo id natoque malesuada sollicitudin elit suscipit. Curae suspendisse mauris posuere accumsan massa posuere lacus convallis tellus interdum. Amet nullam fringilla nibh nulla convallis ut venenatis purus sit arcu sociis. Nunc fermentum adipiscing tempor cursus nascetur adipiscing adipiscing. Primis aliquam mus lacinia lobortis phasellus suscipit. Fermentum lobortis non tristique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum integer purus sapien. Nibh eleifend nulla nascetur pharetra commodo mi augue interdum tellus. Ornare cursus augue feugiat sodales velit lorem. Semper elementum ullamcorper lacinia natoque aenean scelerisque.</p>]]></articleDescription><articleImage><![CDATA[umb://media/176a36213e00483eb0965dbeff86d4a6]]></articleImage></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1079, N'f3f1257d-984e-4e48-aadf-3b2848a36c00', CAST(0x0000A9B0012B5A76 AS DateTime), N'<sliderImages id="1079" key="0b04d505-417b-4a1f-aa2c-147c7c620194" parentID="1070" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T18:09:11" updateDate="2018-12-08T18:09:54" nodeName="Slider1" urlName="slider1" path="-1,1070,1079" isDoc="" nodeType="1077" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="sliderImages" isPublished="true"><description><![CDATA[<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>]]></description><title><![CDATA[Pulvinar sagittis congue]]></title><image><![CDATA[umb://media/cc8a53d5334a4de281415676ea40248d]]></image></sliderImages>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1079, N'5b4dbebc-5845-427e-873f-71077ea74c46', CAST(0x0000A9B0012B27E8 AS DateTime), N'<sliderImages id="1079" key="0b04d505-417b-4a1f-aa2c-147c7c620194" parentID="1070" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T18:09:11" updateDate="2018-12-08T18:09:11" nodeName="Slider1" urlName="slider1" path="-1,1070,1079" isDoc="" nodeType="1077" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="sliderImages" isPublished="true"><description><![CDATA[<p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>]]></description><image><![CDATA[umb://media/cc8a53d5334a4de281415676ea40248d]]></image></sliderImages>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'bf4f8312-66d9-43e7-9950-2aad18412028', CAST(0x0000A9B00137BDE5 AS DateTime), N'<newsListing id="1087" key="f6dd443c-fc8d-4b8d-9a0b-36831cbab991" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-12-08T18:55:00" updateDate="2018-12-08T18:55:00" nodeName="News" urlName="news" path="-1,1087" isDoc="" nodeType="1084" creatorName="admin" writerName="admin" writerID="0" template="1053" nodeTypeAlias="newsListing" isPublished="true"><bannerTitle><![CDATA[Helios]]></bannerTitle><contentDescription><![CDATA[<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>]]></contentDescription><contentTitle><![CDATA[Morbi ullamcorper et varius leo lacus]]></contentTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></newsListing>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'2bd5629e-d6fb-42a5-b11a-803d0f0aed6b', CAST(0x0000A9B001539EBA AS DateTime), N'<newsListing id="1087" key="f6dd443c-fc8d-4b8d-9a0b-36831cbab991" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-12-08T18:55:00" updateDate="2018-12-08T20:36:31" nodeName="News Listing" urlName="news-listing" path="-1,1087" isDoc="" nodeType="1084" creatorName="admin" writerName="admin" writerID="0" template="1053" nodeTypeAlias="newsListing" isPublished="true"><bannerTitle><![CDATA[Helios]]></bannerTitle><contentDescription><![CDATA[<p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>]]></contentDescription><contentTitle><![CDATA[Morbi ullamcorper et varius leo lacus]]></contentTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></newsListing>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'b8fc1ed3-f843-4870-a5e1-2a91614e599c', CAST(0x0000A9B0015DD28F AS DateTime), N'<news id="1099" key="f9629ddf-b341-4f07-875e-3aea5879f56a" parentID="1087" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T20:33:42" updateDate="2018-12-08T21:13:39" nodeName="Test news1" urlName="test-news1" path="-1,1087,1099" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>1</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>
<p> </p>
<h3>Ultrices tempor sagittis nisl</h3>
<p>Nascetur volutpat nibh ullamcorper vivamus at purus. Cursus ultrices porttitor sollicitudin imperdiet at pretium tellus in euismod a integer sodales neque. Nibh quis dui quis mattis eget imperdiet venenatis feugiat. Neque primis ligula cum erat aenean tristique luctus risus ipsum praesent iaculis. Fermentum elit fringilla consequat dis arcu. Pellentesque mus tempor vitae pretium sodales porttitor lacus. Phasellus egestas odio nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>
<p>Eleifend auctor turpis magnis sed porta nisl pretium. Aenean suspendisse nulla eget sed etiam parturient orci cursus nibh. Quisque eu nec neque felis laoreet diam morbi egestas. Dignissim cras rutrum consectetur ut penatibus fermentum nibh erat malesuada varius.</p>
<h3>Augue euismod feugiat tempus</h3>
<p>Pretium tellus in euismod a integer sodales neque. Nibh quis dui quis mattis eget imperdiet venenatis feugiat. Neque primis ligula cum erat aenean tristique luctus risus ipsum praesent iaculis. Fermentum elit ut nunc urna volutpat donec cubilia commodo risus morbi. Lobortis vestibulum velit malesuada ante egestas odio nisl duis sociis purus faucibus morbi. Eget massa mus etiam sociis pharetra magna.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><bannerTitle><![CDATA[News 1]]></bannerTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'98aa9da2-ae77-4e00-b8e7-af43149d582e', CAST(0x0000A9B0015C5655 AS DateTime), N'<news id="1099" key="f9629ddf-b341-4f07-875e-3aea5879f56a" parentID="1087" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T20:33:42" updateDate="2018-12-08T21:08:15" nodeName="Test news1" urlName="test-news1" path="-1,1087,1099" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>1</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><bannerTitle><![CDATA[News 1]]></bannerTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'bdd7fe55-af41-4915-bb71-b1828fb42277', CAST(0x0000A9B001596064 AS DateTime), N'<news id="1099" key="f9629ddf-b341-4f07-875e-3aea5879f56a" parentID="1087" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T20:33:42" updateDate="2018-12-08T20:57:28" nodeName="Test news1" urlName="test-news1" path="-1,1087,1099" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>1</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'41e6790e-2afb-4dc7-b66a-ef1ee4ad18de', CAST(0x0000A9B00152D940 AS DateTime), N'<news id="1099" key="f9629ddf-b341-4f07-875e-3aea5879f56a" parentID="1087" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T20:33:42" updateDate="2018-12-08T20:33:42" nodeName="Test news1" urlName="test-news1" path="-1,1087,1099" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1101, N'f2b715f1-5823-4873-927b-7b40505aa150', CAST(0x0000A9B001537DD8 AS DateTime), N'<news id="1101" key="53ef59a0-b7b3-481e-9968-beb1a9320f35" parentID="1087" level="2" creatorID="0" sortOrder="1" createDate="2018-12-08T20:36:03" updateDate="2018-12-08T20:36:03" nodeName="Test News2" urlName="test-news2" path="-1,1087,1101" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Sed quis rhoncus placerat]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1101, N'6f9ed876-41a2-43ce-9618-a74c3c6148a5', CAST(0x0000A9B001656441 AS DateTime), N'<news id="1101" key="53ef59a0-b7b3-481e-9968-beb1a9320f35" parentID="1087" level="2" creatorID="0" sortOrder="1" createDate="2018-12-08T20:36:03" updateDate="2018-12-08T21:41:13" nodeName="Test News2" urlName="test-news2" path="-1,1087,1101" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Sed quis rhoncus placerat]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner><bannerTitle><![CDATA[Test News2]]></bannerTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1101, N'189820de-b6c1-4b00-9522-c2504769ae28', CAST(0x0000A9B001653F49 AS DateTime), N'<news id="1101" key="53ef59a0-b7b3-481e-9968-beb1a9320f35" parentID="1087" level="2" creatorID="0" sortOrder="1" createDate="2018-12-08T20:36:03" updateDate="2018-12-08T21:40:41" nodeName="Test News2" urlName="test-news2" path="-1,1087,1101" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Sed quis rhoncus placerat]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1102, N'6ec2df2c-8dfb-4138-b636-771e3123f8da', CAST(0x0000A9B00165757D AS DateTime), N'<news id="1102" key="236af23f-ba99-4d5e-85a7-01162dc30773" parentID="1087" level="2" creatorID="0" sortOrder="2" createDate="2018-12-08T20:37:37" updateDate="2018-12-08T21:41:28" nodeName="Test News3" urlName="test-news3" path="-1,1087,1102" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Magna laoreet et aliquam]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1102, N'64a11812-ee4f-415f-a924-a9f25d685b0e', CAST(0x0000A9B00153EC1E AS DateTime), N'<news id="1102" key="236af23f-ba99-4d5e-85a7-01162dc30773" parentID="1087" level="2" creatorID="0" sortOrder="2" createDate="2018-12-08T20:37:37" updateDate="2018-12-08T20:37:37" nodeName="Test News3" urlName="test-news3" path="-1,1087,1102" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Magna laoreet et aliquam]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1103, N'7bc10f00-73cc-4354-a9e1-34fc1880742c', CAST(0x0000A9B0015412BB AS DateTime), N'<news id="1103" key="8ff0c824-3240-4ebd-8ac6-d79f48216ad6" parentID="1087" level="2" creatorID="0" sortOrder="3" createDate="2018-12-08T20:38:10" updateDate="2018-12-08T20:38:10" nodeName="Test News4" urlName="test-news4" path="-1,1087,1103" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Sed quis rhoncus placerat]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1103, N'23b63bb2-02d3-486b-ad99-849fc958d016', CAST(0x0000A9B00165835A AS DateTime), N'<news id="1103" key="8ff0c824-3240-4ebd-8ac6-d79f48216ad6" parentID="1087" level="2" creatorID="0" sortOrder="3" createDate="2018-12-08T20:38:10" updateDate="2018-12-08T21:41:39" nodeName="Test News4" urlName="test-news4" path="-1,1087,1103" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Sed quis rhoncus placerat]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1104, N'19d1e27f-b865-4f3b-8d18-5d0e357a8883', CAST(0x0000A9B001544ABE AS DateTime), N'<news id="1104" key="d28f86c0-7c6f-4702-974d-73afd173b3d1" parentID="1087" level="2" creatorID="0" sortOrder="4" createDate="2018-12-08T20:38:57" updateDate="2018-12-08T20:38:57" nodeName="Test News5" urlName="test-news5" path="-1,1087,1104" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1104, N'9851d9b2-3a34-426c-ad9e-949132868d05', CAST(0x0000A9B00165927E AS DateTime), N'<news id="1104" key="d28f86c0-7c6f-4702-974d-73afd173b3d1" parentID="1087" level="2" creatorID="0" sortOrder="4" createDate="2018-12-08T20:38:57" updateDate="2018-12-08T21:41:52" nodeName="Test News5" urlName="test-news5" path="-1,1087,1104" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1105, N'e0393ca2-6445-46a3-8c73-3f973d809660', CAST(0x0000A9B00165A02E AS DateTime), N'<news id="1105" key="7dd69837-8dc2-4561-96dc-2666bd3fce75" parentID="1087" level="2" creatorID="0" sortOrder="5" createDate="2018-12-08T20:39:32" updateDate="2018-12-08T21:42:04" nodeName="Test News6" urlName="test-news6" path="-1,1087,1105" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1105, N'cc975bb8-4d17-4f01-a4a2-643da7733858', CAST(0x0000A9B001547315 AS DateTime), N'<news id="1105" key="7dd69837-8dc2-4561-96dc-2666bd3fce75" parentID="1087" level="2" creatorID="0" sortOrder="5" createDate="2018-12-08T20:39:32" updateDate="2018-12-08T20:39:32" nodeName="Test News6" urlName="test-news6" path="-1,1087,1105" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/92981f596bf94c778f5ec75843d19d10]]></newsImage><newsTitle><![CDATA[Gravida aliquam penatibus]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1106, N'ebe01915-a6b4-494f-a31b-4c52e5ccecdb', CAST(0x0000A9B00154927C AS DateTime), N'<news id="1106" key="4826c6d5-2293-41eb-aaa0-5636e28373a8" parentID="1087" level="2" creatorID="0" sortOrder="6" createDate="2018-12-08T20:39:59" updateDate="2018-12-08T20:39:59" nodeName="Test News7" urlName="test-news7" path="-1,1087,1106" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Magna laoreet et aliquam]]></newsTitle></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1106, N'74837314-a9ae-4304-8bbc-964da2875a5d', CAST(0x0000A9B00165AC69 AS DateTime), N'<news id="1106" key="4826c6d5-2293-41eb-aaa0-5636e28373a8" parentID="1087" level="2" creatorID="0" sortOrder="6" createDate="2018-12-08T20:39:59" updateDate="2018-12-08T21:42:14" nodeName="Test News7" urlName="test-news7" path="-1,1087,1106" isDoc="" nodeType="1089" creatorName="admin" writerName="admin" writerID="0" template="1088" nodeTypeAlias="news" isPublished="true"><isFeatured>0</isFeatured><newsDescription><![CDATA[<p>Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.</p>]]></newsDescription><newsImage><![CDATA[umb://media/6494415abf5f44858c55bd7d41c95366]]></newsImage><newsTitle><![CDATA[Magna laoreet et aliquam]]></newsTitle><uploadBanner><![CDATA[umb://media/cf0ccca932044d2e8ded364858db3490]]></uploadBanner></news>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1121, N'0218d8c4-43d7-48ae-a464-4643113fb5a6', CAST(0x0000A9B0016AF8FA AS DateTime), N'<contactUs id="1121" key="796ace22-f1de-41f8-800a-fc2f61ac4f83" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2018-12-08T22:01:32" updateDate="2018-12-08T22:01:32" nodeName="Contact Us" urlName="contact-us" path="-1,1121" isDoc="" nodeType="1120" creatorName="admin" writerName="admin" writerID="0" template="1107" nodeTypeAlias="contactUs" isPublished="true"><address><![CDATA[<p>Test</p>]]></address><headContent><![CDATA[Test]]></headContent><buttonText><![CDATA[Test]]></buttonText><headin><![CDATA[Test]]></headin></contactUs>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1122, N'fe6e71e0-67c8-419b-b913-2b4fd024e343', CAST(0x0000A9B0016C7DB0 AS DateTime), N'<listContact id="1122" key="9dab4be7-a91c-4252-b79a-7f318e296c11" parentID="1121" level="2" creatorID="0" sortOrder="0" createDate="2018-12-08T22:07:04" updateDate="2018-12-08T22:07:04" nodeName="Sibin 08-12-2018 22:07" urlName="sibin-08-12-2018-2207" path="-1,1121,1122" isDoc="" nodeType="1114" creatorName="admin" writerName="admin" writerID="0" template="0" nodeTypeAlias="listContact" isPublished="true"><phone><![CDATA[8281938512]]></phone><email><![CDATA[fdfrg@sdfddg.gfg]]></email><subject><![CDATA[Test]]></subject><contactName><![CDATA[Sibin]]></contactName><message><![CDATA[Test]]></message></listContact>')
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 12/08/2018 22:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_umbracoUser_userDisabled]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
/****** Object:  Default [DF_umbracoUser_userNoConsole]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
/****** Object:  Default [DF_umbracoUser_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoUser_updateDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [DF_umbracoServer_registeredDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
/****** Object:  Default [DF_umbracoConsent_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoCacheInstruction_instructionCount]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
/****** Object:  Default [DF_umbracoAudit_eventDateUtc]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
/****** Object:  Default [DF_umbracoNode_trashed]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
/****** Object:  Default [DF_umbracoNode_uniqueID]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
/****** Object:  Default [DF_umbracoNode_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoMigration_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoMigration] ADD  CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoLog_Datestamp]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
/****** Object:  Default [DF_umbracoExternalLogin_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_cmsMacro_macroUseInEditor]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
/****** Object:  Default [DF_cmsMacro_macroRefreshRate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
/****** Object:  Default [DF_cmsMacro_macroCacheByPage]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
/****** Object:  Default [DF_cmsMacro_macroCachePersonalized]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
/****** Object:  Default [DF_cmsMacro_macroDontRender]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
/****** Object:  Default [DF_cmsMacroProperty_macroPropertySortOrder]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
/****** Object:  Default [DF_cmsContentType_thumbnail]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
/****** Object:  Default [DF_cmsContentType_isContainer]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
/****** Object:  Default [DF_cmsContentType_allowAtRoot]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
/****** Object:  Default [DF_cmsTask_closed]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
/****** Object:  Default [DF_cmsTask_DateTime]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
/****** Object:  Default [DF_umbracoAccess_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoAccess_updateDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [DF_umbracoRelation_datetime]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
/****** Object:  Default [DF_umbracoUserGroup_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoUserGroup_updateDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [DF_umbracoAccessRule_createDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoAccessRule_updateDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [DF_cmsPropertyTypeGroup_uniqueID]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
/****** Object:  Default [df_cmsContentTypeAllowedContentType_sortOrder]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
/****** Object:  Default [DF_cmsMemberType_memberCanEdit]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
/****** Object:  Default [DF_cmsMemberType_viewOnProfile]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
/****** Object:  Default [DF_cmsMemberType_isSensitive]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
/****** Object:  Default [DF_cmsDocumentType_IsDefault]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
/****** Object:  Default [DF_cmsDocument_updateDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [DF_cmsDocument_newest]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0') FOR [newest]
GO
/****** Object:  Default [DF_cmsContentVersion_VersionDate]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentVersion] ADD  CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()) FOR [VersionDate]
GO
/****** Object:  Default [DF_cmsMember_Email]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
/****** Object:  Default [DF_cmsMember_LoginName]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
/****** Object:  Default [DF_cmsMember_Password]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
/****** Object:  Default [DF_cmsPropertyType_sortOrder]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
/****** Object:  Default [DF_cmsPropertyType_mandatory]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
/****** Object:  Default [DF_cmsPropertyType_UniqueID]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
/****** Object:  ForeignKey [FK_cmsTags_cmsTags]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
/****** Object:  ForeignKey [FK_umbracoNode_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDictionary_cmsDictionary_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
/****** Object:  ForeignKey [FK_cmsDataType_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsLanguageText_cmsDictionary_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
/****** Object:  ForeignKey [FK_cmsLanguageText_umbracoLanguage_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
/****** Object:  ForeignKey [FK_cmsMacroProperty_cmsMacro_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
/****** Object:  ForeignKey [FK_cmsContentType2ContentType_umbracoNode_child]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
/****** Object:  ForeignKey [FK_cmsContentType2ContentType_umbracoNode_parent]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
/****** Object:  ForeignKey [FK_cmsContentType_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoDomains_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_cmsTaskType_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoUser]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoUser1]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
/****** Object:  ForeignKey [FK_umbracoAccess_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoAccess_umbracoNode_id1]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
/****** Object:  ForeignKey [FK_umbracoAccess_umbracoNode_id2]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
/****** Object:  ForeignKey [FK_cmsTemplate_umbracoNode]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodeNotify_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodeNotify_umbracoUser_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoNode]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoNode1]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoRelationType_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
/****** Object:  ForeignKey [FK_umbracoRedirectUrl_umbracoNode_uniqueID]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueID])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
/****** Object:  ForeignKey [FK_startContentId_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_startMediaId_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUserStartNode_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUserStartNode_umbracoUser_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoUserLogin_umbracoUser_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoUserGroup2NodePermission_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
/****** Object:  ForeignKey [FK_umbracoUserGroup2App_umbracoUserGroup_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2UserGroup_umbracoUser_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2UserGroup_umbracoUserGroup_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
/****** Object:  ForeignKey [FK_umbracoAccessRule_umbracoAccess_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsContent_cmsContentType_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_cmsContentType_nodeId] FOREIGN KEY([contentType])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsContent_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContentTypeAllowedContentType_cmsContentType]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
/****** Object:  ForeignKey [FK_cmsContentTypeAllowedContentType_cmsContentType1]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
/****** Object:  ForeignKey [FK_cmsDataTypePreValues_cmsDataType_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMemberType_cmsContentType_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMemberType_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_cmsContentType_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_cmsTemplate_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDocument_cmsContent_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocument_cmsTemplate_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocument_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContentXml_cmsContent_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsContentVersion_cmsContent_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember_cmsContent_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsMedia_cmsContent_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMedia]  WITH CHECK ADD  CONSTRAINT [FK_cmsMedia_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMedia] CHECK CONSTRAINT [FK_cmsMedia_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMedia_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMedia]  WITH CHECK ADD  CONSTRAINT [FK_cmsMedia_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMedia] CHECK CONSTRAINT [FK_cmsMedia_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsContentType_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsDataType_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsPropertyTypeGroup_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_cmsContent]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_cmsPropertyType]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_cmsTags_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyData_cmsPropertyType_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyData_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsPreviewXml_cmsContent_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPreviewXml_cmsContentVersion_VersionId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
/****** Object:  ForeignKey [FK_cmsMember2MemberGroup_cmsMember_nodeId]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember2MemberGroup_umbracoNode_id]    Script Date: 12/08/2018 22:15:02 ******/
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
