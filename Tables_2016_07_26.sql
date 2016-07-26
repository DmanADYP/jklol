USE [master]
GO
/****** Object:  Database [Projects]    Script Date: 7/26/2016 11:40:14 AM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 7/26/2016 11:40:15 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 7/26/2016 11:40:15 AM ******/
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
/****** Object:  Table [dbo].[CustomerContact]    Script Date: 7/26/2016 11:40:15 AM ******/
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
/****** Object:  Table [dbo].[Lead]    Script Date: 7/26/2016 11:40:15 AM ******/
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
/****** Object:  Table [dbo].[LeadContactTable]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  View [dbo].[v_lead_contact]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[LeadContact]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[LeadCustomer]    Script Date: 7/26/2016 11:40:16 AM ******/
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
/****** Object:  Table [dbo].[LeadNote]    Script Date: 7/26/2016 11:40:17 AM ******/
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
/****** Object:  Table [dbo].[LeadSource]    Script Date: 7/26/2016 11:40:17 AM ******/
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
/****** Object:  Table [dbo].[LeadStatus]    Script Date: 7/26/2016 11:40:17 AM ******/
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
/****** Object:  Table [dbo].[LeadType]    Script Date: 7/26/2016 11:40:17 AM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 7/26/2016 11:40:17 AM ******/
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
/****** Object:  Table [dbo].[ProjectNote]    Script Date: 7/26/2016 11:40:17 AM ******/
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
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerContact] ON 

INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (1, 1029, 16)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (2, 1029, 17)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (3, 1028, 18)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (4, 1033, 16)
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

INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1040, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1041, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1044, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1045, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1046, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1048, NULL, 2, 8, 29, 4, 3, CAST(N'2016-07-04T15:00:00.000' AS DateTime), N'34534543', CAST(N'2016-07-26T15:00:00.000' AS DateTime), CAST(N'2016-07-19T15:00:00.000' AS DateTime), CAST(N'2016-07-14T15:00:00.000' AS DateTime), N'343534', NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1049, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1052, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1053, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1054, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1055, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1056, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1057, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1058, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1059, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1060, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1061, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1062, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1063, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1064, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1065, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1066, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1067, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1068, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1069, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1070, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1071, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1072, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1073, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1074, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1075, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
GO
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1149, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1150, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1151, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1152, NULL, 2, 8, 29, 4, 3, NULL, N'8787777', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1153, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1154, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1155, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1156, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (1157, NULL, 2, 8, 29, 4, 3, NULL, NULL, NULL, NULL, NULL, N'7777777', NULL)
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

INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (21, 1029, 1145, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (22, 1029, 1145, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (23, 1029, 1145, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (24, 1029, 1145, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (25, 1029, 1145, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (26, 1029, 1145, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (27, 1029, 1145, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (28, 1029, 1145, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (29, 1029, 1145, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (30, 1028, 1146, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (31, 1028, 1146, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (32, 1028, 1146, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (33, 1028, 1146, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (34, 1028, 1146, 18)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (48, 1029, 1149, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (49, 1029, 1149, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (50, 1029, 1149, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (51, 1029, 1149, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (52, 1029, 1149, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (53, 1029, 1149, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (54, 1029, 1149, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (55, 1029, 1149, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (56, 1029, 1149, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (57, 1029, 1150, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (58, 1029, 1150, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (59, 1029, 1150, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (60, 1029, 1150, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (61, 1029, 1150, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (62, 1029, 1150, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (63, 1029, 1150, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (64, 1029, 1150, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (65, 1029, 1150, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (66, 1029, 1151, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (67, 1029, 1151, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (68, 1029, 1151, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (69, 1029, 1151, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (70, 1029, 1151, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (71, 1029, 1151, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (72, 1029, 1151, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (73, 1029, 1151, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (74, 1029, 1151, 17)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (127, 1029, 1152, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (128, 1033, 1152, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (129, 1033, 1152, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (130, 1033, 1152, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (131, 1033, 1152, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (132, 1033, 1152, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (212, 1028, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (213, 1028, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (214, 1028, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (215, 1028, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (216, 1033, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (217, 1033, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (218, 1033, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (219, 1033, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (220, 1029, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (221, 1029, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (222, 1029, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (223, 1029, 1153, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (224, 1044, 1154, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (225, 1044, 1154, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (226, 1044, 1154, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (227, 1044, 1154, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (278, 1029, 1155, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (279, 1029, 1155, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (280, 1029, 1155, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (281, 1029, 1155, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (282, 1029, 1155, 16)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (283, 1028, 1155, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (284, 1030, 1155, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (285, 2039, 1156, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (286, 2039, 1156, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (287, 2039, 1156, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (288, 2039, 1156, NULL)
SET IDENTITY_INSERT [dbo].[LeadContactTable] OFF
SET IDENTITY_INSERT [dbo].[LeadCustomer] ON 

INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1007, 1028, 1040)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1008, 1028, 1041)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1009, 1029, 1044)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1010, 1028, 1044)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1011, 1029, 1045)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1012, 1028, 1045)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1013, 1029, 1046)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1015, 1029, 1048)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1016, 1028, 1048)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1017, 1033, 1049)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1020, 1029, 1052)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1021, 1028, 1052)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1022, 1029, 1053)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1023, 1028, 1053)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1024, 1028, 1054)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1028, 1028, 1055)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1029, 1028, 1056)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1030, 1033, 1056)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1031, 1028, 1057)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1032, 1033, 1057)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1033, 1028, 1058)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1034, 1029, 1059)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1035, 1028, 1059)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1036, 1033, 1059)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1037, 1029, 1060)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1038, 1028, 1060)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1039, 1033, 1060)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1040, 1029, 1061)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1041, 1028, 1061)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1042, 1029, 1062)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1043, 1028, 1062)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1044, 1029, 1063)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1045, 1028, 1063)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1046, 1029, 1064)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1047, 1028, 1064)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1048, 1033, 1064)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1054, 1028, 1065)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1055, 1029, 1065)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1073, 1029, 1066)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1074, 1033, 1066)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1096, 1029, 1069)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1097, 1033, 1069)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1098, 1029, 1070)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1099, 1028, 1070)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1100, 1029, 1071)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1101, 1028, 1071)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1102, 1029, 1072)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1103, 1028, 1072)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1104, 1029, 1073)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1105, 1028, 1073)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1106, 1029, 1074)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1107, 1033, 1074)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1108, 1029, 1075)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1109, 1033, 1075)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1111, 1028, 1077)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1112, 1028, 1078)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1113, 1029, 1079)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1114, 1028, 1079)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1117, 1029, 1081)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1118, 1033, 1081)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1123, 1029, 1084)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1124, 1033, 1084)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1125, 1029, 1085)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1126, 1033, 1085)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1127, 1029, 1086)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1128, 1033, 1086)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1129, 1029, 1087)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1130, 1033, 1087)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1131, 1029, 1088)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1132, 1033, 1088)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1133, 1029, 1089)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1134, 1033, 1089)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1135, 1029, 1090)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1136, 1033, 1090)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1137, 1029, 1091)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1138, 1033, 1091)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1139, 1029, 1092)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1140, 1029, 1093)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1141, 1029, 1094)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1142, 1029, 1095)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1143, 1028, 1095)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1144, 1029, 1096)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1145, 1033, 1096)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1146, 1029, 1097)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1147, 1029, 1098)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1148, 1033, 1098)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1149, 1029, 1099)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1150, 1033, 1099)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1151, 1029, 1100)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1152, 1029, 1101)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1153, 1029, 1102)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1154, 1033, 1102)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1155, 1029, 1103)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1156, 1033, 1103)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1157, 1029, 1104)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1158, 1033, 1104)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1159, 1029, 1105)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1160, 1033, 1105)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1161, 1029, 1106)
GO
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1162, 1028, 1106)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1163, 1029, 1107)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1164, 1028, 1107)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1165, 1029, 1108)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1166, 1028, 1108)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1167, 1028, 1109)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1168, 1029, 1110)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1169, 1033, 1110)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1170, 1029, 1111)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1171, 1033, 1111)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1176, 1029, 1114)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1177, 1033, 1114)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1190, 1029, 1124)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1191, 1029, 1125)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1192, 1029, 1126)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1193, 1029, 1127)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1194, 1029, 1128)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1195, 1029, 1129)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1196, 1029, 1130)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1197, 1033, 1130)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1198, 1029, 1131)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1199, 1033, 1131)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1200, 1029, 1132)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1201, 1033, 1132)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1202, 1029, 1133)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1203, 1033, 1133)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1204, 1028, 1134)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1205, 1029, 1135)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1206, 1028, 1135)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1207, 1033, 1135)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1208, 1029, 1136)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1209, 1028, 1136)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1210, 1033, 1136)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1217, 1029, 1142)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1218, 1044, 1143)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1219, 1044, 1144)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1220, 1029, 1145)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1221, 1044, 1145)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1222, 1028, 1146)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1223, 1044, 1147)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1224, 1029, 1148)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1225, 1044, 1148)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1226, 1029, 1149)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1227, 1029, 1150)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1228, 1029, 1151)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1229, 1029, 1152)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1230, 1029, 1153)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1231, 1028, 1153)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1232, 1044, 1154)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1233, 1029, 1155)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1234, 1028, 1155)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1235, 1033, 1155)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1236, 1030, 1155)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1237, 2039, 1156)
INSERT [dbo].[LeadCustomer] ([Id], [CustomerId], [LeadId]) VALUES (1238, 2044, 1157)
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
