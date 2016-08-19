USE [Projects]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/18/2016 10:25:23 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 8/18/2016 10:25:23 PM ******/
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
/****** Object:  Table [dbo].[CustomerContact]    Script Date: 8/18/2016 10:25:23 PM ******/
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
/****** Object:  Table [dbo].[Lead]    Script Date: 8/18/2016 10:25:23 PM ******/
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
/****** Object:  Table [dbo].[LeadContactTable]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  View [dbo].[v_lead_contact]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[LeadContact]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[LeadCustomer]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[LeadNote]    Script Date: 8/18/2016 10:25:24 PM ******/
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
/****** Object:  Table [dbo].[LeadSource]    Script Date: 8/18/2016 10:25:25 PM ******/
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
/****** Object:  Table [dbo].[LeadStatus]    Script Date: 8/18/2016 10:25:25 PM ******/
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
/****** Object:  Table [dbo].[LeadType]    Script Date: 8/18/2016 10:25:25 PM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 8/18/2016 10:25:25 PM ******/
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
/****** Object:  Table [dbo].[ProjectNote]    Script Date: 8/18/2016 10:25:25 PM ******/
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

INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (1020, N'aa', N'aaaa', N'aa', N'aa', N'aa', N'aa', N'aa')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (1021, N'bb', N'bb', N'bb', N'bb', N'bb', N'bb', N'bb')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (1022, N'cccc', N'ccc', N'cc', N'cc', N'cc', N'cc', N'cc')
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [WorkPhone], [MobilePhone], [Email], [Title], [Notes]) VALUES (1023, N'dd', N'ddd', N'dd', N'dd', N'dd', N'dd', N'ddd')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (3107, N'a', N'a', NULL)
INSERT [dbo].[Customer] ([Id], [Name], [CustomerInsuranceInformation], [SendCreditApplication]) VALUES (3108, N'b', N'b', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerContact] ON 

INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (1, 3107, 1020)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (2, 3107, 1021)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (3, 3108, 1022)
INSERT [dbo].[CustomerContact] ([Id], [CustomerId], [ContactId]) VALUES (4, 3108, 1023)
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

INSERT [dbo].[Lead] ([Id], [Name], [LeadSourceId], [EmployeeId], [ProjectId], [LeadTypeId], [LeadStatusId], [CreatedDate], [Address], [BidDueDate], [BidOpeningDate], [FollowUpDate], [Quantity], [ContactID]) VALUES (2192, NULL, 2, 8, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lead] OFF
SET IDENTITY_INSERT [dbo].[LeadContactTable] ON 

INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (1, 3107, 2192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (2, 3107, 2192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (3, 3107, 2192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (4, 3107, 2192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (5, 3108, 2192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (6, 3108, 2192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (7, 3108, 2192, NULL)
INSERT [dbo].[LeadContactTable] ([ContactID], [CustomerID], [LeadID], [ccID]) VALUES (8, 3108, 2192, NULL)
SET IDENTITY_INSERT [dbo].[LeadContactTable] OFF
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
