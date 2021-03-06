USE [master]
GO
/****** Object:  Database [Production]    Script Date: 9/30/2018 2:00:58 PM ******/
CREATE DATABASE [Production]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Production', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Production.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Production_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Production_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Production] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Production].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Production] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Production] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Production] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Production] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Production] SET ARITHABORT OFF 
GO
ALTER DATABASE [Production] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Production] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Production] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Production] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Production] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Production] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Production] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Production] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Production] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Production] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Production] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Production] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Production] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Production] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Production] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Production] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Production] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Production] SET RECOVERY FULL 
GO
ALTER DATABASE [Production] SET  MULTI_USER 
GO
ALTER DATABASE [Production] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Production] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Production] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Production] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Production] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Production', N'ON'
GO
ALTER DATABASE [Production] SET QUERY_STORE = OFF
GO
USE [Production]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/30/2018 2:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1001,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](12) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pod]    Script Date: 9/30/2018 2:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pod](
	[PodId] [int] IDENTITY(1,1) NOT NULL,
	[PodName] [nvarchar](50) NOT NULL,
	[SupervisorId] [int] NOT NULL,
 CONSTRAINT [PK_Pod] PRIMARY KEY CLUSTERED 
(
	[PodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 9/30/2018 2:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [int] IDENTITY(101,1) NOT NULL,
	[WeekDayId] [int] NOT NULL,
	[PodId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[StartTime] [time](4) NULL,
	[EndTime] [time](4) NULL,
	[CoordinatorId] [int] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeekDay]    Script Date: 9/30/2018 2:00:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeekDay](
	[WeekDayId] [int] IDENTITY(1,1) NOT NULL,
	[DayOfWeek] [nvarchar](50) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_WeekDay] PRIMARY KEY CLUSTERED 
(
	[WeekDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1001, N'Bob', N'Dale', N'555-123-0001', N'bdale@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1002, N'Charlie', N'Carson', N'555-123-0002', N'ccarson@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1003, N'Doug', N'Daniels', N'555-123-0003', N'ddaniels@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1004, N'Peter', N'Watson', N'555-123-0004', N'pwatson@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1005, N'Alyssa', N'Cross', N'555-123-0005', N'across@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1006, N'Andrew', N'North', N'555-123-0006', N'anorth@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1007, N'Bree', N'Lang', N'555-123-0007', N'blang@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1008, N'Stephanie', N'Ford', N'555-123-0008', N'sford@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1009, N'Brock', N'Reese', N'555-123-0009', N'breese@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1010, N'Jim', N'Dillan', N'555-123-0010', N'jdillan@production.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1011, N'Shawn', N'Holland', N'555-123-0011', N'sholland@client.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1012, N'Mitch', N'Blain', N'555-123-0012', N'mblain@client.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1013, N'Phoebe', N'Hase', N'555-123-0013', N'phase@client.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1014, N'Nicole', N'Brown', N'555-123-0014', N'nbrown@client.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1015, N'Scott', N'Harper', N'555-123-0015', N'sharper@client.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1016, N'Whitney', N'Reed', N'555-123-0016', NULL)
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1017, N'Marc', N'Jones', N'555-123-0017', NULL)
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1018, N'Deborah', N'Klein', N'555-123-0018', N'dklein@client.com')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1019, N'Lori', N'Alexander', N'555-123-0019', NULL)
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1020, N'Meadow', N'Graham', N'555-123-0020', N'mgraham@client.com')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Pod] ON 

INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (1, N'Sewing', 1001)
INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (2, N'Mat Folding', 1002)
INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (3, N'Balloon Folding', 1003)
INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (4, N'Material Handling', 1004)
INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (5, N'Boxing', 1004)
INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (6, N'Cutting Table', 1005)
INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (7, N'Misc Machines', 1005)
INSERT [dbo].[Pod] ([PodId], [PodName], [SupervisorId]) VALUES (8, N'No Work', 1001)
SET IDENTITY_INSERT [dbo].[Pod] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (101, 1, 1, 1010, CAST(N'08:15:00' AS Time), CAST(N'03:00:00' AS Time), 1007)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (102, 1, 1, 1011, CAST(N'08:15:00' AS Time), CAST(N'02:45:00' AS Time), 1007)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (103, 1, 2, 1012, CAST(N'08:15:00' AS Time), CAST(N'01:15:00' AS Time), 1007)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (104, 1, 2, 1013, CAST(N'08:15:00' AS Time), CAST(N'03:00:00' AS Time), 1007)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (105, 1, 3, 1014, CAST(N'08:30:00' AS Time), CAST(N'02:45:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (106, 1, 3, 1015, CAST(N'08:45:00' AS Time), CAST(N'02:30:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (107, 1, 5, 1016, CAST(N'09:00:00' AS Time), CAST(N'03:00:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (108, 1, 5, 1017, CAST(N'08:45:00' AS Time), CAST(N'03:00:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (109, 1, 6, 1018, CAST(N'08:15:00' AS Time), CAST(N'03:00:00' AS Time), 1009)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (110, 1, 7, 1019, CAST(N'08:30:00' AS Time), CAST(N'02:45:00' AS Time), 1009)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (111, 1, 8, 1020, CAST(N'11:15:00' AS Time), CAST(N'01:45:00' AS Time), 1009)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (112, 2, 1, 1020, CAST(N'11:15:00' AS Time), CAST(N'01:45:00' AS Time), 1009)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (113, 2, 2, 1019, CAST(N'08:15:00' AS Time), CAST(N'12:00:00' AS Time), 1009)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (114, 2, 3, 1018, CAST(N'09:30:00' AS Time), CAST(N'01:45:00' AS Time), 1009)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (115, 2, 4, 1017, CAST(N'10:00:00' AS Time), CAST(N'02:00:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (116, 2, 5, 1016, CAST(N'08:15:00' AS Time), CAST(N'03:00:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (117, 2, 5, 1015, CAST(N'08:15:00' AS Time), CAST(N'03:00:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (118, 2, 5, 1014, CAST(N'08:45:00' AS Time), CAST(N'02:45:00' AS Time), 1008)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (119, 2, 6, 1013, CAST(N'09:00:00' AS Time), CAST(N'01:00:00' AS Time), 1007)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (120, 2, 7, 1012, CAST(N'08:30:00' AS Time), CAST(N'01:00:00' AS Time), 1007)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (121, 2, 7, 1011, CAST(N'09:00:00' AS Time), CAST(N'02:45:00' AS Time), 1007)
INSERT [dbo].[Schedule] ([ScheduleId], [WeekDayId], [PodId], [ClientId], [StartTime], [EndTime], [CoordinatorId]) VALUES (123, 2, 8, 1010, CAST(N'10:00:00' AS Time), CAST(N'02:00:00' AS Time), 1007)
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[WeekDay] ON 

INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (1, N'Monday', CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (2, N'Tuesday', CAST(N'2018-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (3, N'Wednesday', CAST(N'2018-10-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (4, N'Thursday', CAST(N'2018-10-04T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (5, N'Friday', CAST(N'2018-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (6, N'Monday', CAST(N'2018-10-08T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (7, N'Tuesday', CAST(N'2018-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (8, N'Wednesday', CAST(N'2018-10-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (9, N'Thursday', CAST(N'2018-10-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[WeekDay] ([WeekDayId], [DayOfWeek], [Date]) VALUES (10, N'Friday', CAST(N'2018-10-12T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[WeekDay] OFF
USE [master]
GO
ALTER DATABASE [Production] SET  READ_WRITE 
GO
