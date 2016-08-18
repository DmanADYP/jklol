USE [master]
GO
/****** Object:  Database [Projects]    Script Date: 8/17/2016 9:04:17 PM ******/
CREATE DATABASE [Projects]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projects', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Projects.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projects_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Projects_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Projects] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projects].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projects] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projects] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projects] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projects] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projects] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projects] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projects] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projects] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projects] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projects] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projects] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projects] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projects] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projects] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projects] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projects] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projects] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projects] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projects] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projects] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projects] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projects] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projects] SET RECOVERY FULL 
GO
ALTER DATABASE [Projects] SET  MULTI_USER 
GO
ALTER DATABASE [Projects] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projects] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projects] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projects] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projects] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Projects', N'ON'
GO
ALTER DATABASE [Projects] SET QUERY_STORE = OFF
GO
USE [Projects]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Projects]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/17/2016 9:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](500) NULL,
	[LastName] [varchar](500) NULL,
	[WorkPhone] [varchar](250) NULL,
	[MobilePhone] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Title] [varchar](500) NULL,
	[Notes] [varchar](5000) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/17/2016 9:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[CustomerInsuranceInformation] [varchar](max) NULL,
	[SendCreditApplication] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerContact]    Script Date: 8/17/2016 9:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[ContactId] [int] NULL,
 CONSTRAINT [PK_CustomerContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lead]    Script Date: 8/17/2016 9:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](300) NULL,
	[LeadSourceId] [int] NULL,
	[EmployeeId] [int] NULL,
	[ProjectId] [int] NULL,
	[LeadTypeId] [int] NULL,
	[LeadStatusId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Address] [varchar](1000) NULL,
	[BidDueDate] [datetime] NULL,
	[BidOpeningDate] [datetime] NULL,
	[FollowUpDate] [datetime] NULL,
	[Quantity] [varchar](100) NULL,
	[ContactID] [int] NULL,
 CONSTRAINT [PK_Lead] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeadContactTable]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadContactTable](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[LeadID] [int] NULL,
	[ccID] [int] NULL,
 CONSTRAINT [PK_LeadContactTable] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_lead_contact]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[v_lead_contact] as 
  with cust as (
  Select c.Id as c_ID, cm.Id as cm_ID, cc.Id as cc_ID
, CustomerId,	ContactId,		FirstName,	LastName,	WorkPhone,	MobilePhone,	Email,	Title,	Notes,	Name,	
CustomerInsuranceInformation,	SendCreditApplication from CustomerContact cc
  inner join Contact c on cc.ContactId = c.Id
  inner join Customer cm on cc.CustomerId = cm.Id
  )


  select 
    Id,	cust.Name,	cust.ContactID		,cust.CustomerID,	LeadSourceId,	EmployeeId,	ProjectId,	LeadTypeId,	LeadStatusId,	CreatedDate	
  ,Address	,BidDueDate	,BidOpeningDate	,FollowUpDate	,Quantity		
  ,LeadID	,c_ID	,cm_ID	,cc_ID		,FirstName	,LastName	,WorkPhone	
  ,MobilePhone	,Email	,Title	,Notes	,CustomerInsuranceInformation	,SendCreditApplication
   from Lead
  left join LeadContactTable lct on Lead.Id = lct.LeadID
  left join cust on cust.cm_id = lct.CustomerID

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeTypeId] [int] NULL,
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[WorkPhone] [varchar](200) NULL,
	[MobilePhone] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[Title] [varchar](500) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_EmployeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeadContact]    Script Date: 8/17/2016 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [varchar](500) NULL,
	[ContactEmail] [varchar](500) NULL,
	[ContactFirstName] [varchar](500) NULL,
	[ContactLastName] [varchar](500) NULL,
	[ContactMobile] [varchar](500) NULL,
	[ContactOfficePhone] [varchar](500) NULL,
 CONSTRAINT [PK_LeadContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeadCustomer]    Script Date: 8/17/2016 9:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadCustomer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[LeadId] [int] NULL,
 CONSTRAINT [PK_LeadCustomer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeadNote]    Script Date: 8/17/2016 9:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadNote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeadId] [int] NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_LeadNote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeadSource]    Script Date: 8/17/2016 9:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadSource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_BidSource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeadStatus]    Script Date: 8/17/2016 9:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_LeadStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeadType]    Script Date: 8/17/2016 9:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
 CONSTRAINT [PK_LeadType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 8/17/2016 9:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](2000) NULL,
	[Number] [varchar](50) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectNote]    Script Date: 8/17/2016 9:04:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectNote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_ProjectNote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201605230312247_InitialCreate', N'TOProjects.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488DDD04CEDA6E8DC617649DA06F0157E2AED548942A51AE8DA25FD6877E527FA14389BAF1A2CBAEBCBB0E020416393C331C0EC9E170B8FFFDF3EFF8ED83EF19F7388ADD804CCC83D1BE696062078E4B961333A18B17AFCDB76FBEFD667CE6F80FC6A79CEE88D1414B124FCC3B4AC363CB8AED3BECA378E4BB7614C4C1828EECC0B790135887FBFB3F59070716060813B00C63FC2121D4F571FA019FD380D838A409F22E03077B312F879A598A6A5C211FC721B2F1C4BCBDBE8982DFB14DE351466C1A279E8B409019F616A681080928A220E6F1C718CF681490E52C8402E4DD3E8618E816C88B3117FFB824EFDA93FD43D613AB6C9843D9494C03BF27E0C111578D25365F49C166A13A50DE1928993EB25EA70A9C98170E4E8B3E041E284064783CF522463C312F0B1627717885E9286F38CA20CF2380FB3388BE8CAA887B46E7767B85291D8EF6D9BF3D639A783489F084E08446C8DB336E92B9E7DABFE2C7DBE00B2693A383F9E2E8F5CB57C8397AF5233E7A59ED29F415E86A0550047612E20864C38BA2FFA661D5DB5962C3A259A54DA615B0259815A671891EDE63B2A477305F0E5F9BC6B9FB809DBC841BD747E2C2248246344AE0F32AF13C34F770516F35F264FF37703D7CF96A10AE57E8DE5DA6432FF0878913C1BCFA80BDB436BE73C36C7AD5C6FB33273B8F029F7DD7ED2BABFD3C0B92C8669D09B424B7285A625A976E6C95C6DBC9A419D4F0669DA3EEBE69334965F35692B20EAD321372169B9E0DB9BC4FCBB7B3C59D84210C5E6A5A4C234D0627ED5523A1F19E5192948673D0D5700874E86B5E07CF7CE47A032C841DB8800BB270231F17BD7C1780D921D25BE61B14C7B00E38BFA0F8AE4174F87300D167D84E2230CF19457EF8E4DC6EEE0282AF127FCEAC7E73BC061B9ADB3F837364D3203A23ACD5DA78EF03FB4B90D033E29C228A3F523B07649FB7AEDF1D6010714E6C1BC7F139183376A60178D839E005A14787BDE1D8FAB46D4764EA21D7577B22C24AFA39272DBD113585E49168C8545E4993A8EF83A54BBA899A93EA45CD285A45E5647D456560DD24E5947A415382563933AAC1FCBC74848677F452D8DDF7F4D6DBBC756B41458D335821F1CF98E0089631E706518A23528E409775631BCE423A7C8CE993EF4D29A74FC84B8666B5D26C481781E167430ABBFBB32115138AEF5D8779251D8E3F3931C077A2579FACDAE79C20D9A6A743AD9B9B66BE993540375D4EE238B0DD741628025F3C6C51971F7C38A33D8691F5468C8340C7C0D05DB6E54109F4CD148DEA9A9C620F536C9CD85960708A621B39B21AA1434E0FC1F21D552158190FA90BF783C4132C1D47AC116287A01866AA4BA83C2D5C62BB21F25AB524B4ECB885B1BE173CC49A531C62C218B66AA20B7375F8830950F01106A54D4363AB6271CD86A8F15A7563DEE6C296E32E45253662932DBEB3C62EB9FFF62486D9ACB10D1867B34ABA08A00DE56DC340F959A5AB018807975D3350E1C4A43150EE526DC440EB1ADB8281D655F2EC0C343BA2761D7FE1BCBA6BE6593F286F7E5B6F54D7166CB3A68F1D33CDCCF78436145AE04836CFD339ABC40F5471380339F9F92CE6AEAE68220C7C86693D6453FABB4A3FD46A06118DA809B034B416507E0928014913AA8770792CAF513AEE45F480CDE36E8DB07CED17602B362063572F432B84FA2B53D1383B9D3E8A9E15D6201979A7C34205476110E2E255EF7807A5E8E2B2B262BAF8C27DBCE14AC7F8603428A8C573D52829EFCCE05ACA4DB35D4B2A87AC8F4BB6969604F749A3A5BC33836B89DB68BB92144E410FB7602D15D5B7F081265B1EE928769BA26E6C652952BC606C6972A9C697280C5DB2ACE456F112639625564D5FCCFAA71CF9198665C78ACCA342DA82130D22B4C4422DB00649CFDD28A6A788A23962719EA9E34B64CABD55B3FCE72CABDBA73C88F93E9053B3BFF95DA174755FDB6A655F84439C43077DE6D0A45174C5F0AB9B1B2CD50D79285204EEA78197F844EF5FE95B67D777D5F659898C30B604F925FF495296E4E5D635DF695CE43931CC1815DECBEAE3A487D0693BF73DABFAD6F9A37A943C3C5545D185ACB6366E3A37A6CF58890E62FFA16A45789A59C5B352AA00BCA8274625B14102ABD47547ADE79E5431EB35DD118504932AA450D543CA6A1A494DC86AC54A781A8DAA29BA73901347AAE8726D7764450A49155A51BD02B64266B1AE3BAA22CBA40AACA8EE8E5DA69C886BE80EEF5BDA63CBAA1B5776B05D6FE7D2603CCD8238CCC657B9BFAF02558A7B62F11B7A098C97EFA431694F77AB1A5316CE58CF983418FA75A776F15D5F761A6FEBF598B5DBECDAD2DE749BAFC7EB67B24F6A18D2D94E2429B817673CE12C37E6E7AAF6C733D2412B23318D5C8DB0AD3FC614FB2346309AFDE14D3D17B3453C27B844C45DE09866191CE6E1FEC1A1F00067771EC35871EC788A73A9EE454C7DCC36908C45EE5164DFA1484E8D58E3C148092A459D2F88831F26E65F69ABE33480C1FE4A8BF78C8BF82371FF48A0E2364AB0F1B79CEA394C027DF3096B479F3B74D7EAC56F9FB3A67BC6750433E6D8D81774B9CA08D71F41F492266BBA86342B3F8D78BE13AAF6F240892A4C88D51F1ACC5D3AC823835CCAEF7CF4F07D5FD1940F09D642543C16180A6F1015EA1E03AC82A57D08E0C0274D1F02F4EBACFA61C02AA2691F05B8A43F98F824A0FB3294B7DCE256A338126D62494AF5DC9A52BD567EE5B6F72629F37AAD892E6757F7805B23837A05CB7866C9C783ED8E8ADCE2C1B0B769DA4F9E50BC2B39C46576C776538737992DDC7027F4552509EF405A9B224D67FBA9C09BB6355D1877C7F329FB25FCEE98B1F1E4ADEDA7F56EDAD87461DE1D37B65EC9BB3B666BDBDA3FB76C699DB7D0ADA7E2CA59459AEB18552CB82DD5360B9CC3097F1E8011641E65F642529DDBD59497DAC2B024D133D52795898CA58923F195289AD9F6EB2BDFF01B3BCB699AD96A52319B78F3F5BF9137A769E6AD4970DC4692B032C55095B8DDB28E3565403DA7A4E05A4F5A72D0DB7CD6C6BBF5E794033C88526AB3477347FC7C527E0751C99053A7478AAF7CDD0B7B67E5171561FF8EDD6509C17E5F9160BBB66B1634176411E49BB720514E2244682E31450E6CA927117517C8A650CD62CCE913EF346EC76E3AE6D8B920D7090D130A5DC6FEDCAB05BC9813D0C43FCD63AECB3CBE0ED35F2B19A20B20A6CB62F3D7E45DE27A4E21F7B92226A48160DE058FE8B2B1A42CB2BB7C2C90AE02D21188ABAF708A6EB11F7A00165F9319BAC7ABC806E6F71E2F91FD5846007520ED035157FBF8D445CB08F931C728DBC327D8B0E33FBCF91FE9C7DC0058540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'60e7b416-24c3-4a5b-9f69-1c8602dc8c86', N'jkent@outlook.com', 0, N'AONG1IC07HKBatg6w6HLEFLLQ+EhFNfj1kI4Ch7EXamxziJl7BN9Q6GGbJTrf+8j/A==', N'008da8a3-7179-429b-a405-4ea046daf7db', NULL, 0, 0, NULL, 1, 0, N'jkent@outlook.com')
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (16, N'Sherrif', N'Cali', N'888', N'888', N'sCali@NiceAndFriendly.com', N'Sherrif', NULL)
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (17, N'Tobias P.', N'Cactus', N'999', N'000', N'tCactus@NiceAndFriendly.Com', N'Titles', N'notes')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (18, N'First', N'Last', N'Work', N'Mobile', N'Email', N'Title', N'Notes')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (19, N'adyp', N'adyp', N'666-777-8888', N'666-777-8888', N'1@1.com', N'person', N'guy')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (1019, N'v', N'v', N'v', N'22', N'2', N'2', N'2')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (14, N'TestCust', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1014, N'TestCust2', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1015, N'xyz', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1016, N'secure', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1017, N'Secure1', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1018, N'Secure2', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1019, N'Secure3', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1020, N'Secure4', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1021, N'Secure5', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1022, N'Secure12', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1023, N'PAB', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1024, N'Griff', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1025, N'one', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1026, N'mmm', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1027, N'OneTwoThree', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1028, N'1234345657', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1029, N'1', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1030, N'Bo', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1031, N'jjj', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1032, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1033, N'adyp', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1034, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1035, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1036, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1037, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1038, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1039, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1040, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1041, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1042, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1043, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1044, N'ad', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1045, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1046, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1047, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (1048, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2033, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2034, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2035, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2036, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2037, N'HomeDepot', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2038, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2039, N'homede', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2040, N'lowe', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2041, N'lo', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2042, N'l', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2043, N'ho', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2044, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2045, N'homeLowes', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2046, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2047, N'99999', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2048, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2049, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2050, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2051, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2052, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2053, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2054, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2055, N'sdfsdfsd', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2056, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2057, N'sdgdfg', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2058, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2059, N'fdgfd', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2060, N'fffff', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2061, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2062, N'hjghghjg', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2063, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2064, N'gfhgfhfhd', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2065, N'gffh', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2066, N'mvjhjhg', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2067, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2068, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2069, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2070, N'hfdgfdg', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2071, N'hghjg', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2072, N'gfhgfhg', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2073, N'88888', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2074, N'ihkkk', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2075, N'ooo00', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2076, N'8888', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2077, N'ii', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2078, N'ioio', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2079, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2080, N'New Customer Name ..', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2081, N'iiii', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2082, N'oioojjjj', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2083, N'ioojgff', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2084, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2085, N'uuuuuuu', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2086, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2087, N'909888', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2088, N'343', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2089, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2090, N'09090', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2091, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2092, N'012', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2093, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2094, N'013', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2095, N'', NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2096, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2097, N'01239999', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2098, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2099, N'abc123', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2100, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2101, N'abc222', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2102, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2103, N'9898', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2104, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2105, N'4545', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2106, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2107, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2108, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2109, N'cccc', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2110, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2111, N'acac', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2112, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2113, N'6678', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2114, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2115, N'88888', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2116, N'', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2117, N'9090099', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (2118, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerContact] ON 

INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (1, 1029, 16)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (2, 1029, 17)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (3, 1028, 18)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (4, 1033, 18)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (5, 1033, 1019)
SET IDENTITY_INSERT [dbo].[CustomerContact] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [EmployeeTypeId], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title]) VALUES (4, 2, N'Joe', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [EmployeeTypeId], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title]) VALUES (6, 2, N'Todd', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [EmployeeTypeId], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title]) VALUES (7, 2, N'Sarah', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [EmployeeTypeId], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title]) VALUES (8, 2, N'Barbara', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [EmployeeTypeId], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title]) VALUES (9, 2, N'Theresa', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [EmployeeTypeId], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title]) VALUES (10, 2, N'Dave', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Id], [EmployeeTypeId], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title]) VALUES (11, 2, N'Steve', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeType] ON 

INSERT [dbo].[EmployeeType] ([Id], [Name]) VALUES (2, N'Sales')
SET IDENTITY_INSERT [dbo].[EmployeeType] OFF
SET IDENTITY_INSERT [dbo].[Lead] ON 

INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1040, NULL, 2, 8, 29, 4, 3, CAST(N'2016-08-22T19:34:00.000' AS DateTime), N'hghjgh', CAST(N'2016-08-29T19:35:00.000' AS DateTime), CAST(N'2016-08-22T19:35:00.000' AS DateTime), CAST(N'2016-08-22T19:35:00.000' AS DateTime), N'sfsdfsd', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1041, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1044, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1045, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1046, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1052, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1072, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1076, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1077, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1078, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1079, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1080, NULL, 2, 8, 29, 4, 3, NULL, N'6666666', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1081, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1082, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1083, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1084, NULL, 2, 8, 29, 4, 3, NULL, N'555', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1085, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1086, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1087, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1088, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1089, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1090, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1091, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1092, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1093, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1094, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1095, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1096, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1097, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1098, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1099, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1100, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1101, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1102, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1103, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1104, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1105, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1106, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1107, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1108, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1109, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1110, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1111, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1112, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1113, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1114, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1115, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1116, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1117, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1118, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1119, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1120, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1121, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1122, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1123, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1124, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1125, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1126, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1127, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1128, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1129, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1130, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1131, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1132, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1133, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1134, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1135, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1136, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1142, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1143, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1144, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1145, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1146, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1147, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1148, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1149, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1150, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1151, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1152, NULL, 2, 8, 29, 4, 3, NULL, N'8787777', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1153, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1154, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1155, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1156, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1157, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, N'7777777', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1166, NULL, 2, 8, 38, 4, 3, NULL, N'sdfsdf', NULL, NULL, NULL, N'sdfsd', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1167, NULL, 2, 8, 39, 4, 3, CAST(N'2016-07-20T12:26:00.000' AS DateTime), N'sdfsdg', CAST(N'2016-07-19T12:26:00.000' AS DateTime), CAST(N'2016-07-11T12:26:00.000' AS DateTime), CAST(N'2016-07-18T12:26:00.000' AS DateTime), N'55', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1168, NULL, 2, 8, 40, 4, 3, NULL, N'dfgff', NULL, NULL, NULL, N'dfgfd', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1169, NULL, 2, 8, 29, 4, 3, CAST(N'2016-07-04T12:31:00.000' AS DateTime), N'77777', CAST(N'2016-07-20T12:31:00.000' AS DateTime), CAST(N'2016-07-20T12:31:00.000' AS DateTime), CAST(N'2016-07-04T12:31:00.000' AS DateTime), N'777777', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1170, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1172, NULL, 2, 8, 43, 4, 3, CAST(N'2016-07-27T09:29:00.000' AS DateTime), N'ioioi', CAST(N'2016-07-31T09:29:00.000' AS DateTime), CAST(N'2016-07-31T09:29:00.000' AS DateTime), CAST(N'2016-07-31T09:29:00.000' AS DateTime), N'00000', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1175, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1176, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1177, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1178, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1179, NULL, 2, 8, 47, 4, 3, CAST(N'2016-07-04T10:09:00.000' AS DateTime), N'abc222', CAST(N'2016-07-19T10:09:00.000' AS DateTime), CAST(N'2016-07-25T10:09:00.000' AS DateTime), CAST(N'2016-07-18T10:09:00.000' AS DateTime), N'abc222', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1180, NULL, 2, 8, 48, 4, 3, NULL, N'9898', NULL, NULL, NULL, N'9898', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1183, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1184, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1186, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1188, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1189, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1190, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1191, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1192, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1193, NULL, 2, 8, 50, 4, 3, NULL, N'86544', NULL, NULL, NULL, N'7777', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1194, NULL, 2, 8, 51, 4, 3, NULL, N'86544', NULL, NULL, NULL, N'7777', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1195, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1196, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1197, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1198, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1199, NULL, 2, 8, 52, 4, 3, NULL, N'88888', NULL, NULL, NULL, N'7777777', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1200, NULL, 2, 8, 42, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1201, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1203, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1204, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1205, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1208, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1209, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (2187, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (2188, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (2189, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (2190, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (2191, NULL, 2, 8, 41, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lead] OFF
SET IDENTITY_INSERT [dbo].[LeadContact] ON 

INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (1, N'1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (2, N'2', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (3, N'111', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (4, N'222', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (7, N'1', N'2', N'3', N'4', N'5', N'6')
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (1002, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (1003, N'Cust1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[LeadContact] ([Id], [Customer], [ContactEmail], [ContactFirstName], [ContactLastName], [ContactMobile], [ContactOfficePhone]) VALUES (1004, N'Cust2', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LeadContact] OFF
SET IDENTITY_INSERT [dbo].[LeadContactTable] ON 

INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1, 1029, 1188, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2, 1029, 1188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (3, 1029, 1188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (4, 1029, 1188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (5, 1029, 1188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (6, 1029, 1188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (7, 1029, 1188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (8, 1029, 1188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (9, 1029, 1188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (10, 1029, 1189, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (11, 1029, 1189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (12, 1029, 1189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (13, 1029, 1189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (14, 1029, 1189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (15, 1029, 1189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (16, 1029, 1189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (17, 1029, 1189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (18, 1029, 1189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (19, 1029, 1190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (20, 1029, 1190, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (21, 1029, 1190, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (22, 1029, 1190, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (23, 1029, 1190, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (24, 1029, 1190, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (25, 1029, 1190, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (26, 1029, 1190, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (27, 1029, 1190, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (28, 1029, 1192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (29, 1029, 1192, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (30, 1029, 1192, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (31, 1029, 1192, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (32, 1029, 1192, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (33, 1029, 1192, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (34, 1029, 1192, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (35, 1029, 1192, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (36, 1029, 1192, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (56, 1029, 1195, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (57, 1029, 1195, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (58, 1029, 1195, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (59, 1029, 1195, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (60, 1029, 1195, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (61, 1029, 1195, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (62, 1029, 1195, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (63, 1029, 1195, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (64, 1029, 1195, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (65, 1015, 1195, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (76, 1029, 1199, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (77, 1029, 1199, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (78, 1029, 1199, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (79, 1029, 1199, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (80, 1029, 1199, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (81, 1029, 1199, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (82, 1029, 1199, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (83, 1029, 1199, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (84, 1029, 1199, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (85, 2073, 1199, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (185, 1029, 1201, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (186, 1029, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (187, 1029, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (188, 1029, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (189, 1029, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (190, 1029, 1201, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (191, 1029, 1201, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (192, 1029, 1201, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (193, 1029, 1201, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (194, 1033, 1201, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (195, 1033, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (196, 1033, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (197, 1033, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (198, 1033, 1201, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (199, 2092, 1201, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (367, 1016, 1204, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (368, 1016, 1204, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (369, 1016, 1204, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (370, 1016, 1204, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (469, 1017, 1040, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (470, 1017, 1040, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (471, 1017, 1040, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (472, 1017, 1040, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1292, 1029, 1205, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1293, 1029, 1205, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1294, 1029, 1205, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1295, 1029, 1205, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1296, 1029, 1205, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1297, 1029, 1205, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1298, 1029, 1205, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1299, 1029, 1205, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1300, 1029, 1205, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1301, 1014, 1205, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1344, 1029, 1072, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1345, 1029, 1072, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1346, 1029, 1072, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1347, 1029, 1072, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1348, 1029, 1072, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1357, 1016, 1046, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1358, 1016, 1046, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1359, 1016, 1046, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1360, 1016, 1046, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1361, 1015, 1046, NULL)
GO
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1362, 1015, 1046, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1363, 1015, 1046, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1364, 1015, 1046, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1365, 1029, 1208, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1366, 1029, 1208, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1367, 1029, 1208, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1368, 1029, 1208, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1369, 1029, 1208, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1370, 1033, 1208, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1371, 1033, 1208, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1372, 1033, 1208, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1373, 1033, 1208, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1374, 1033, 1208, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1375, 2092, 1208, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1376, 1029, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1377, 1029, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1378, 1029, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1379, 1029, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1380, 2088, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1381, 2088, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1382, 2088, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1383, 2088, 1209, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2002, 1029, 2187, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2003, 1029, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2004, 1029, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2005, 1029, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2006, 1029, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2007, 1029, 2187, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2008, 1029, 2187, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2009, 1029, 2187, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2010, 1029, 2187, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2011, 1033, 2187, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2012, 1033, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2013, 1033, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2014, 1033, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2015, 1033, 2187, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2016, 2092, 2187, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2017, 1029, 2188, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2018, 1029, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2019, 1029, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2020, 1029, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2021, 1029, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2022, 1029, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2023, 1029, 2188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2024, 1029, 2188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2025, 1029, 2188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2026, 1029, 2188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2027, 1029, 2188, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2028, 1033, 2188, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2029, 1033, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2030, 1033, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2031, 1033, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2032, 1033, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2033, 1033, 2188, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2034, 1033, 2188, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2035, 1033, 2188, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2036, 1033, 2188, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2037, 1033, 2188, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2038, 1033, 2188, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2132, 1029, 2189, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2133, 1029, 2189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2134, 1029, 2189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2135, 1029, 2189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2136, 1029, 2189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2137, 1029, 2189, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2138, 1029, 2189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2139, 1029, 2189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2140, 1029, 2189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2141, 1029, 2189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2142, 1029, 2189, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2143, 1033, 2189, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2144, 1033, 2189, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2145, 1033, 2189, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2146, 1033, 2189, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2147, 1033, 2189, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2148, 1033, 2189, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2149, 1033, 2189, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2150, 1033, 2189, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2151, 1033, 2189, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2152, 1033, 2189, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2153, 1033, 2189, 1019)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2154, 1029, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2155, 1029, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2156, 1029, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2157, 1029, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2158, 1029, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2159, 1033, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2160, 1033, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2161, 1033, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2162, 1033, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2163, 1033, 2190, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2164, 1029, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2165, 1029, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2166, 1029, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2167, 1029, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2168, 1029, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2169, 1033, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2170, 1033, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2171, 1033, 2191, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2172, 1033, 2191, NULL)
GO
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2173, 1033, 2191, NULL)
SET IDENTITY_INSERT [dbo].[LeadContactTable] OFF
SET IDENTITY_INSERT [dbo].[LeadCustomer] ON 

INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1, 2107, 1193)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (3, 2108, 1194)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (5, 2110, 1196)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (7, 2112, 1197)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (8, 2114, 1198)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (9, 2113, 1198)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (10, 2116, 1199)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (11, 2118, 1200)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (12, 2117, 1200)
SET IDENTITY_INSERT [dbo].[LeadCustomer] OFF
SET IDENTITY_INSERT [dbo].[LeadSource] ON 

INSERT [dbo].[LeadSource] ([Id], [Name]) VALUES (2, N'Phone')
INSERT [dbo].[LeadSource] ([Id], [Name]) VALUES (3, N'Sales')
INSERT [dbo].[LeadSource] ([Id], [Name]) VALUES (4, N'RFP')
SET IDENTITY_INSERT [dbo].[LeadSource] OFF
SET IDENTITY_INSERT [dbo].[LeadStatus] ON 

INSERT [dbo].[LeadStatus] ([Id], [Name]) VALUES (1, N'Won')
INSERT [dbo].[LeadStatus] ([Id], [Name]) VALUES (2, N'Lost')
INSERT [dbo].[LeadStatus] ([Id], [Name]) VALUES (3, N'Lead')
INSERT [dbo].[LeadStatus] ([Id], [Name]) VALUES (4, N'Bidding')
INSERT [dbo].[LeadStatus] ([Id], [Name]) VALUES (5, N'Pending')
INSERT [dbo].[LeadStatus] ([Id], [Name]) VALUES (6, N'RFI')
SET IDENTITY_INSERT [dbo].[LeadStatus] OFF
SET IDENTITY_INSERT [dbo].[LeadType] ON 

INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (4, N'Aggregate')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (5, N'Crushing')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (6, N'Disposal')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (7, N'HMA-FOB')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (8, N'HMA-Install')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (9, N'MISC')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (10, N'ONE')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (11, N'Site Work')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (12, N'Soil')
INSERT [dbo].[LeadType] ([Id], [Name]) VALUES (13, N'Cold Patch')
SET IDENTITY_INSERT [dbo].[LeadType] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (28, N'New Project', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (29, N'ABC', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (30, N'xxxxx', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (31, N'xxxxyyyy', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (32, N'xxxxyyyy', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (33, N'xxxxyyyy', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (34, N'xxxxyyyy', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (35, N'xxxxyyyy', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (36, N'xxxxyyyy', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (37, N'xxxxyyyy', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (38, N'sdfsd', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (39, N'sdfsd', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (40, N'dfdgdfgdfgfd', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (41, N'', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (42, N'hgfddtt', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (43, N'ioiiii', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (44, N'ccfgg', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (45, N'98766', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (46, N'012', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (47, N'abc222', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (48, N'9898', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (49, N'4545', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (50, N'78666', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (51, N'78666', N'')
INSERT [dbo].[Project] ([Id], [Name], [Number]) VALUES (52, N'887766', N'')
SET IDENTITY_INSERT [dbo].[Project] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CustomerContact]  WITH CHECK ADD  CONSTRAINT [FK_CustomerContact_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[CustomerContact] CHECK CONSTRAINT [FK_CustomerContact_Contact]
GO
ALTER TABLE [dbo].[CustomerContact]  WITH CHECK ADD  CONSTRAINT [FK_CustomerContact_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerContact] CHECK CONSTRAINT [FK_CustomerContact_Customer]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeType] FOREIGN KEY([EmployeeTypeId])
REFERENCES [dbo].[EmployeeType] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeType]
GO
ALTER TABLE [dbo].[Lead]  WITH CHECK ADD  CONSTRAINT [FK_Lead_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lead] CHECK CONSTRAINT [FK_Lead_Employee]
GO
ALTER TABLE [dbo].[Lead]  WITH CHECK ADD  CONSTRAINT [FK_Lead_LeadSource] FOREIGN KEY([LeadSourceId])
REFERENCES [dbo].[LeadSource] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lead] CHECK CONSTRAINT [FK_Lead_LeadSource]
GO
ALTER TABLE [dbo].[Lead]  WITH CHECK ADD  CONSTRAINT [FK_Lead_LeadStatus] FOREIGN KEY([LeadStatusId])
REFERENCES [dbo].[LeadStatus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lead] CHECK CONSTRAINT [FK_Lead_LeadStatus]
GO
ALTER TABLE [dbo].[Lead]  WITH CHECK ADD  CONSTRAINT [FK_Lead_LeadType] FOREIGN KEY([LeadTypeId])
REFERENCES [dbo].[LeadType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lead] CHECK CONSTRAINT [FK_Lead_LeadType]
GO
ALTER TABLE [dbo].[Lead]  WITH CHECK ADD  CONSTRAINT [FK_Lead_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lead] CHECK CONSTRAINT [FK_Lead_Project]
GO
ALTER TABLE [dbo].[LeadContactTable]  WITH CHECK ADD  CONSTRAINT [FK_LeadContactTable_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[LeadContactTable] CHECK CONSTRAINT [FK_LeadContactTable_Customer]
GO
ALTER TABLE [dbo].[LeadContactTable]  WITH CHECK ADD  CONSTRAINT [FK_LeadContactTable_Lead] FOREIGN KEY([LeadID])
REFERENCES [dbo].[Lead] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeadContactTable] CHECK CONSTRAINT [FK_LeadContactTable_Lead]
GO
ALTER TABLE [dbo].[LeadCustomer]  WITH CHECK ADD  CONSTRAINT [FK_LeadCustomer_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeadCustomer] CHECK CONSTRAINT [FK_LeadCustomer_Customer]
GO
ALTER TABLE [dbo].[LeadCustomer]  WITH CHECK ADD  CONSTRAINT [FK_LeadCustomer_Lead] FOREIGN KEY([LeadId])
REFERENCES [dbo].[Lead] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeadCustomer] CHECK CONSTRAINT [FK_LeadCustomer_Lead]
GO
ALTER TABLE [dbo].[LeadNote]  WITH CHECK ADD  CONSTRAINT [FK_LeadNote_Lead] FOREIGN KEY([LeadId])
REFERENCES [dbo].[Lead] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeadNote] CHECK CONSTRAINT [FK_LeadNote_Lead]
GO
ALTER TABLE [dbo].[ProjectNote]  WITH CHECK ADD  CONSTRAINT [FK_ProjectNote_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectNote] CHECK CONSTRAINT [FK_ProjectNote_Project]
GO
USE [master]
GO
ALTER DATABASE [Projects] SET  READ_WRITE 
GO
