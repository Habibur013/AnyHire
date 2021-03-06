USE [master]
GO
/****** Object:  Database [AnyHireDb]    Script Date: 22-Nov-19 11:53:52 PM ******/
CREATE DATABASE [AnyHireDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AnyHireDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AnyHireDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AnyHireDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AnyHireDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AnyHireDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AnyHireDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AnyHireDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AnyHireDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AnyHireDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AnyHireDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AnyHireDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AnyHireDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AnyHireDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AnyHireDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AnyHireDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AnyHireDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AnyHireDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AnyHireDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AnyHireDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AnyHireDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AnyHireDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AnyHireDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AnyHireDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AnyHireDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AnyHireDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AnyHireDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AnyHireDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AnyHireDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AnyHireDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AnyHireDb] SET  MULTI_USER 
GO
ALTER DATABASE [AnyHireDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AnyHireDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AnyHireDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AnyHireDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AnyHireDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AnyHireDb] SET QUERY_STORE = OFF
GO
USE [AnyHireDb]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](70) NOT NULL,
	[Mobile] [int] NOT NULL,
	[Gender] [nvarchar](6) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[ProfilePicture] [nvarchar](max) NULL,
	[UserType] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[ServiceProviderId] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[Location] [nvarchar](300) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Completed] [bit] NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[Stars] [int] NOT NULL,
	[Disliked] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notices]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Warning] [bit] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_Notices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ServiceProviderId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](500) NULL,
	[Price] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceProviders]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProviders](
	[Id] [int] NOT NULL,
	[NID] [int] NOT NULL,
	[Coverage] [nvarchar](max) NOT NULL,
	[JoinDate] [date] NOT NULL,
	[Skills] [nvarchar](max) NOT NULL,
	[Revenue] [numeric](18, 0) NOT NULL,
	[Commission] [numeric](18, 0) NOT NULL,
	[Activated] [bit] NOT NULL,
 CONSTRAINT [PK_SurviceProviders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[TotalAmount] [numeric](18, 2) NOT NULL,
	[ServiceProviderRevenue] [numeric](18, 2) NOT NULL,
	[CompanyRevenue] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 22-Nov-19 11:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Accounts]    Script Date: 22-Nov-19 11:53:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Accounts] ON [dbo].[Accounts]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments] ADD  CONSTRAINT [DF_Appointments_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Stars]  DEFAULT ((0)) FOR [Stars]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Disliked]  DEFAULT ((0)) FOR [Disliked]
GO
ALTER TABLE [dbo].[Notices] ADD  CONSTRAINT [DF_Notices_Warning]  DEFAULT ((0)) FOR [Warning]
GO
ALTER TABLE [dbo].[Notices] ADD  CONSTRAINT [DF_Notices_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[ServiceProviders] ADD  CONSTRAINT [DF_ServiceProviders_Commission]  DEFAULT ((0)) FOR [Commission]
GO
ALTER TABLE [dbo].[ServiceProviders] ADD  CONSTRAINT [DF_ServiceProviders_Activated]  DEFAULT ((0)) FOR [Activated]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_SurviceProviders] FOREIGN KEY([ServiceProviderId])
REFERENCES [dbo].[ServiceProviders] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_SurviceProviders]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_UserTypes] FOREIGN KEY([UserType])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_UserTypes]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Customers]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Packages] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Packages] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Packages]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Customers]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Packages] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Packages] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Packages]
GO
ALTER TABLE [dbo].[Notices]  WITH CHECK ADD  CONSTRAINT [FK_Notices_Accounts] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Notices] CHECK CONSTRAINT [FK_Notices_Accounts]
GO
ALTER TABLE [dbo].[Notices]  WITH CHECK ADD  CONSTRAINT [FK_Notices_AccountsUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Notices] CHECK CONSTRAINT [FK_Notices_AccountsUsers]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_ServiceProviders] FOREIGN KEY([ServiceProviderId])
REFERENCES [dbo].[ServiceProviders] ([Id])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_ServiceProviders]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_Services] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_Services]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Appointments] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointments] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Appointments]
GO
USE [master]
GO
ALTER DATABASE [AnyHireDb] SET  READ_WRITE 
GO
