USE [master]
GO
/****** Object:  Database [GIBDD]    Script Date: 26.02.2023 7:42:20 ******/
CREATE DATABASE [GIBDD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GIBDD_Suv_Dor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GIBDD_Suv_Dor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GIBDD_Suv_Dor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GIBDD_Suv_Dor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GIBDD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GIBDD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GIBDD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GIBDD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GIBDD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GIBDD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GIBDD] SET ARITHABORT OFF 
GO
ALTER DATABASE [GIBDD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GIBDD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GIBDD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GIBDD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GIBDD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GIBDD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GIBDD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GIBDD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GIBDD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GIBDD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GIBDD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GIBDD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GIBDD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GIBDD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GIBDD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GIBDD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GIBDD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GIBDD] SET RECOVERY FULL 
GO
ALTER DATABASE [GIBDD] SET  MULTI_USER 
GO
ALTER DATABASE [GIBDD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GIBDD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GIBDD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GIBDD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GIBDD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GIBDD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GIBDD', N'ON'
GO
ALTER DATABASE [GIBDD] SET QUERY_STORE = ON
GO
ALTER DATABASE [GIBDD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [GIBDD]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[PostCode] [int] NULL,
	[Region] [int] NOT NULL,
	[City] [int] NULL,
	[Street] [int] NULL,
	[House] [varchar](5) NULL,
 CONSTRAINT [PK__Address__091C2A1B7F60ED59] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarOwner] [int] NULL,
	[CarRegistrationDate] [date] NOT NULL,
	[vin] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Car__68A0340E07020F21] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentsIssueOrganization]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentsIssueOrganization](
	[OrgID] [int] IDENTITY(1,1) NOT NULL,
	[OrgName] [int] NOT NULL,
	[DeptCode] [varchar](7) NOT NULL,
 CONSTRAINT [PK__Document__420C9E0C22AA2996] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[DriverSurname] [varchar](30) NOT NULL,
	[DriverName] [varchar](30) NOT NULL,
	[DriverPatronymic] [varchar](30) NULL,
	[DriverAddress] [int] NULL,
	[DriverExperience] [int] NULL,
	[DriverDateOfBirth] [date] NULL,
 CONSTRAINT [PK__Owner__81938598117F9D94] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver_Insurance]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver_Insurance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Insurance] [int] NOT NULL,
	[Driver] [int] NOT NULL,
 CONSTRAINT [PK__Driver_I__3214EC272EF4BC20] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverLicense]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverLicense](
	[LisenseID] [int] IDENTITY(1,1) NOT NULL,
	[LicensetSeries] [int] NOT NULL,
	[LicensetNum] [int] NOT NULL,
	[LicenseIssueOrg] [int] NOT NULL,
	[LicneseDriver] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LisenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[InsuranceID] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceCar] [int] NULL,
	[InsuranceCompany] [int] NULL,
	[InsurancePayment] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranceCompany]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceCompany](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrgName]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrgName](
	[OrgNameID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrgNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnerChangeHistory]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnerChangeHistory](
	[ChangeID] [int] IDENTITY(1,1) NOT NULL,
	[ChangeCar] [int] NOT NULL,
	[NewOwner] [int] NOT NULL,
	[StartOwningDate] [date] NOT NULL,
	[EndOwningDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ChangeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passport](
	[PassportID] [int] IDENTITY(1,1) NOT NULL,
	[PassportSeries] [int] NOT NULL,
	[PassportNum] [int] NOT NULL,
	[PassportIssueOrg] [int] NOT NULL,
	[PassportDriver] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PassportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[StreetID] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StreetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheftFoundedCar]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheftFoundedCar](
	[CaseID] [int] IDENTITY(1,1) NOT NULL,
	[CaseCar] [int] NOT NULL,
	[CaseDate] [date] NOT NULL,
	[CaseAddress] [int] NOT NULL,
	[CaseStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiclePassport]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiclePassport](
	[VehiclePassportID] [int] IDENTITY(1,1) NOT NULL,
	[VehiclePassportCar] [int] NOT NULL,
	[VehiclePassportNum] [varchar](30) NOT NULL,
	[EngineNum] [varchar](20) NOT NULL,
	[CarGovNum] [varchar](20) NOT NULL,
	[CarBrand] [int] NOT NULL,
	[CarModel] [int] NULL,
	[ManufactureYear] [int] NOT NULL,
 CONSTRAINT [PK__VehicleP__100A70625061C448] PRIMARY KEY CLUSTERED 
(
	[VehiclePassportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (1, 235243, 1, 1, 1, N'84')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (2, 903719, 2, 2, 2, N'79')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (3, 903719, 2, 2, 2, N'80')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (4, 890591, 3, 3, 3, N'16')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (5, 890591, 3, 3, 3, N'17')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (6, 596892, 4, 4, 4, N'37')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (7, 596892, 4, 4, 4, N'38')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (8, 177326, 5, 5, 5, N'25')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (9, 4893, 6, 6, 6, N'54')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (10, 4893, 6, 6, 6, N'55')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (11, 879196, 7, 7, 7, N'35')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (12, 879196, 7, 7, 7, N'36')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (13, 879196, 7, 7, 7, N'37')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (14, 177326, 5, 5, 5, N'26')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (15, 177326, 5, 5, 5, N'27')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (16, 384138, 8, 8, 8, N'52')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (17, 384138, 8, 8, 8, N'53')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (18, 205031, 9, 9, 9, N'50')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (19, 81865, 7, 9, 10, N'83')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (20, 81865, 7, 9, 10, N'84')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (21, 969236, 10, 10, 11, N'0')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (22, 177326, 5, 5, 5, N'28')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (23, 177326, 5, 5, 5, N'29')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (24, 177326, 5, 5, 5, N'30')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (25, 177326, 5, 5, 5, N'31')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (26, 177326, 5, 5, 5, N'32')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (27, 612314, 11, 11, 12, N'75')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (28, 612314, 11, 11, 12, N'76')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (29, 205031, 9, 9, 9, N'50')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (30, 205031, 9, 9, 9, N'51')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (31, 205031, 9, 9, 9, N'52')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (32, 205031, 9, 9, 9, N'53')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (33, 205031, 9, 9, 9, N'54')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (34, 205031, 9, 9, 9, N'55')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (35, 205031, 9, 9, 9, N'56')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (36, 612314, 11, 11, 12, N'77')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (37, 612314, 11, 11, 12, N'78')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (38, 71586, 12, 12, 13, N'86')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (39, 71586, 12, 12, 13, N'87')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (40, 71586, 12, 12, 13, N'88')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (41, 71586, 12, 12, 13, N'89')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (42, 71586, 12, 12, 13, N'90')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (43, 71586, 12, 12, 13, N'91')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (44, 71586, 12, 12, 13, N'92')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (45, 71586, 12, 12, 13, N'93')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (46, 71586, 12, 12, 13, N'94')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (47, 71586, 12, 12, 13, N'95')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (48, 219654, 13, 10, 14, N'4')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (49, 986261, 2, 3, 15, N'46')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (50, 219654, 13, 10, 14, N'5')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (51, 986261, 2, 3, 15, N'47')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (52, 219654, 13, 10, 14, N'6')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (53, 986261, 2, 3, 15, N'48')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (54, 219654, 13, 10, 14, N'7')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (55, 986261, 2, 3, 15, N'49')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (56, 219654, 13, 10, 14, N'8')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (57, 111112, 2, 2, 2, N'2')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (58, 219654, 13, 10, 14, N'9')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (59, 986261, 2, 3, 15, N'51')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (60, 219654, 13, 10, 14, N'10')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (61, 986261, 2, 3, 15, N'52')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (62, 219654, 13, 10, 14, N'11')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (63, 986261, 2, 3, 15, N'53')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (64, 219654, 13, 10, 14, N'12')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (65, 986261, 2, 3, 15, N'54')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (66, 219654, 13, 10, 14, N'5')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (67, 986261, 2, 3, 15, N'47')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (68, 219654, 13, 10, 14, N'6')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (69, 986261, 2, 3, 15, N'48')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (70, 219654, 13, 10, 14, N'7')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (71, 986261, 2, 3, 15, N'49')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (72, 219654, 13, 10, 14, N'8')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (73, 986261, 2, 3, 15, N'50')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (74, 219654, 13, 10, 14, N'9')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (75, 986261, 2, 3, 15, N'51')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (76, 219654, 13, 10, 14, N'10')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (77, 986261, 2, 3, 15, N'52')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (78, 219654, 13, 10, 14, N'11')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (79, 986261, 2, 3, 15, N'53')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (80, 219654, 13, 10, 14, N'12')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (81, 219654, 13, 10, 14, N'5')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (82, 986261, 2, 3, 15, N'47')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (83, 219654, 13, 10, 14, N'6')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (84, 986261, 2, 3, 15, N'48')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (85, 219654, 13, 10, 14, N'7')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (86, 986261, 2, 3, 15, N'49')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (87, 219654, 13, 10, 14, N'8')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (88, 986261, 2, 3, 15, N'50')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (89, 219654, 13, 10, 14, N'9')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (90, 986261, 2, 3, 15, N'51')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (91, 191147, 7, 13, 16, N'3')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (92, 857872, 14, 14, 17, N'58')
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (93, 857872, 14, 14, 17, NULL)
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (94, NULL, 7, NULL, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [PostCode], [Region], [City], [Street], [House]) VALUES (95, NULL, 15, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (1, N'Acura')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (2, N'Audi')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (3, N'Chevrolet')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (4, N'Harley Davidson')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (5, N'Jeep')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (6, N'Honda')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (7, N'Kia')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (8, N'Land Rover')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (9, N'Volkswagen')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (10, N'Porsche')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (11, N'Hyundai')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (12, N'Dodge')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (13, N'Ford')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (14, N'Toyota')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (15, N'Nissan')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (16, N'BMW')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (18, 56, CAST(N'2013-11-08' AS Date), N'JH4DB1650MS013392')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (19, 78, CAST(N'2010-12-27' AS Date), N'WAUDK84AXRN029130')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (20, 2, CAST(N'2018-05-15' AS Date), N'1GNDT13W012105424')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (21, 5, CAST(N'2012-02-13' AS Date), N'1HD1KEM15CB610062')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (22, 23, CAST(N'2000-05-10' AS Date), N'3G1JC1245WS848211')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (23, 15, CAST(N'2003-10-27' AS Date), N'1C4BJWKGXDL508578')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (24, 7, CAST(N'2019-06-05' AS Date), N'1HGEM21292L047875')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (25, 1, CAST(N'2017-02-12' AS Date), N'KNAFB121625150469')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (26, 9, CAST(N'2008-05-03' AS Date), N'JH4DA1840KS004941')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (27, 17, CAST(N'2007-01-28' AS Date), N'SALME1D48CA365300')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (28, 26, CAST(N'2020-09-16' AS Date), N'3VWSD29M11M069435')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (29, 33, CAST(N'1998-01-22' AS Date), N'WP0CB29906S769518')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (30, 41, CAST(N'2019-05-09' AS Date), N'5NPET46C07H192362')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (31, 49, CAST(N'2019-12-15' AS Date), N'2B3HD46R02H210893')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (32, 57, CAST(N'2021-07-07' AS Date), N'1C4GJWAG0DL544058')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (33, 65, CAST(N'1999-08-04' AS Date), N'1FTRW14W84KC76110')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (34, 73, CAST(N'2002-07-07' AS Date), N'TRUTC28N611004782')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (35, 90, CAST(N'2008-02-29' AS Date), N'JTDBT123710161315')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (36, 76, CAST(N'2014-07-22' AS Date), N'JN1CA21DXXT805880')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (37, 63, CAST(N'2001-01-04' AS Date), N'2FMZA51665BA05533')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (38, 35, CAST(N'2018-06-08' AS Date), N'JH4NA1260MT001906')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (39, 7, CAST(N'2016-10-06' AS Date), N'4T1SV21E1MU396756')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (40, 15, CAST(N'2020-11-27' AS Date), N'WAUHE78P09A029968')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (42, 3, CAST(N'2007-10-05' AS Date), N'WAUBH74F07N020574')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (43, 20, CAST(N'2018-02-21' AS Date), N'WAUMFAFH0D0015345')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (44, 63, CAST(N'2018-06-06' AS Date), N'1FDGF4GY0BEA08312')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (45, 75, CAST(N'2015-12-27' AS Date), N'1FMEU6FE9AUA18258')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (46, 8, CAST(N'2012-08-06' AS Date), N'1FDSS34S4YHA65815')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (47, 11, CAST(N'1999-10-29' AS Date), N'KM8SC12B02U320804')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (48, 12, CAST(N'2019-11-24' AS Date), N'5XYZW3LAXEG131014')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (49, 90, CAST(N'2019-09-19' AS Date), N'KM8SC73E764108810')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (50, 57, CAST(N'2012-10-23' AS Date), N'KMHDH4AE4DU221347')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (51, 45, CAST(N'2003-03-25' AS Date), N'WBABS53483JU97924')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (52, 55, CAST(N'2003-08-16' AS Date), N'WBANM71027CP89338')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (53, 89, CAST(N'2002-03-28' AS Date), N'WBAKC6C50D0011836')
INSERT [dbo].[Car] ([CarID], [CarOwner], [CarRegistrationDate], [vin]) VALUES (54, 97, CAST(N'2000-08-09' AS Date), N'WAUJC58E53A179138')
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName]) VALUES (1, N'Ногинск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (2, N'Клин')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (3, N'Мытищи')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (4, N'Серебряные Пруды')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (5, N'Егорьевск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (6, N'Серпухов')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (7, N'Пушкино')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (8, N'Люберцы')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (9, N'Дорохово')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (10, N'Солнечногорск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (11, N'Домодедово')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (12, N'Можайск')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (13, N'Озёры')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (14, N'Раменское')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentsIssueOrganization] ON 

INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (1, 1, N'493-914')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (2, 2, N'922-790')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (3, 3, N'512-624')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (4, 4, N'275-301')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (5, 5, N'893-765')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (6, 6, N'402-316')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (7, 7, N'974-281')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (8, 5, N'465-481')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (9, 8, N'095-862')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (10, 9, N'244-464')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (11, 10, N'121-650')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (12, 11, N'134-123')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (13, 4, N'451-730')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (14, 12, N'793-495')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (15, 12, N'721-176')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (16, 13, N'102-815')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (17, 2, N'362-427')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (18, 4, N'750-508')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (19, 9, N'418-444')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (20, 9, N'757-605')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (21, 14, N'661-091')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (22, 15, N'469-496')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (23, 16, N'315-173')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (24, 2, N'118-321')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (25, 12, N'961-923')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (26, 7, N'679-877')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (27, 17, N'336-517')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (28, 11, N'296-232')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (29, 9, N'266-708')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (30, 7, N'157-895')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (31, 6, N'174-918')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (32, 14, N'406-759')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (33, 3, N'569-416')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (34, 9, N'181-610')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (35, 9, N'123-582')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (36, 1, N'838-525')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (37, 16, N'459-099')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (38, 12, N'144-435')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (39, 2, N'686-883')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (40, 10, N'056-054')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (41, 7, N'192-554')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (42, 18, N'140-184')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (43, 4, N'887-674')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (44, 18, N'534-382')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (45, 13, N'755-103')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (46, 10, N'737-818')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (47, 14, N'187-059')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (48, 16, N'457-196')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (49, 14, N'655-849')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (50, 1, N'943-784')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (51, 8, N'856-922')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (52, 18, N'010-809')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (53, 5, N'591-742')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (54, 17, N'493-025')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (55, 8, N'709-019')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (56, 18, N'209-736')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (57, 7, N'111-116')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (58, 11, N'487-999')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (59, 6, N'377-078')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (60, 16, N'144-258')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (61, 15, N'781-242')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (62, 3, N'161-551')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (63, 1, N'937-407')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (64, 13, N'394-263')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (65, 8, N'927-228')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (66, 11, N'109-693')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (67, 5, N'984-165')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (68, 13, N'394-003')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (69, 18, N'142-239')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (70, 8, N'990-185')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (71, 19, N'713-263')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (72, 19, N'583-207')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (73, 12, N'516-443')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (74, 7, N'021-859')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (75, 1, N'732-401')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (76, 18, N'919-520')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (77, 10, N'069-456')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (78, 7, N'878-787')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (79, 19, N'912-593')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (80, 9, N'533-636')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (81, 14, N'726-601')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (82, 11, N'820-790')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (83, 10, N'590-325')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (84, 14, N'448-471')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (85, 8, N'018-415')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (86, 6, N'223-462')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (87, 19, N'696-478')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (88, 15, N'620-305')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (89, 12, N'545-831')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (90, 16, N'071-364')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (91, 10, N'256-101')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (92, 7, N'023-187')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (93, 7, N'192-278')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (94, 19, N'142-290')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (95, 16, N'154-279')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (96, 4, N'833-858')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (97, 4, N'485-450')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (98, 13, N'861-158')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (99, 14, N'219-419')
GO
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (100, 19, N'195-366')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (101, 13, N'314-439')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (102, 10, N'976-220')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (103, 6, N'477-052')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (104, 11, N'061-732')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (105, 1, N'267-712')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (106, 13, N'311-801')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (107, 1, N'719-880')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (108, 4, N'035-125')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (109, 11, N'990-376')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (110, 15, N'360-868')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (111, 4, N'870-479')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (112, 18, N'507-066')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (113, 5, N'027-747')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (114, 1, N'077-470')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (115, 16, N'848-535')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (116, 6, N'970-828')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (117, 12, N'223-538')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (118, 4, N'609-330')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (119, 13, N'265-126')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (120, 14, N'931-747')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (121, 6, N'956-336')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (122, 18, N'567-166')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (123, 15, N'374-967')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (124, 2, N'194-738')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (125, 10, N'541-518')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (126, 11, N'775-597')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (127, 7, N'992-345')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (128, 12, N'254-005')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (129, 7, N'941-626')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (130, 7, N'815-429')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (131, 9, N'745-592')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (132, 9, N'640-361')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (133, 3, N'503-280')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (134, 18, N'110-864')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (135, 12, N'145-551')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (136, 14, N'176-394')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (137, 2, N'562-947')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (138, 2, N'736-543')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (139, 2, N'532-111')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (140, 15, N'244-619')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (141, 4, N'994-853')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (142, 15, N'375-985')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (143, 16, N'552-954')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (144, 9, N'207-471')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (145, 1, N'511-217')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (146, 10, N'716-718')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (147, 1, N'111-119')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (148, 20, N'105-369')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (149, 9, N'835-955')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (150, 16, N'436-962')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (151, 12, N'023-793')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (152, 6, N'497-430')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (153, 15, N'848-137')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (154, 8, N'186-607')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (155, 2, N'450-659')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (156, 16, N'285-259')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (157, 9, N'073-326')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (158, 7, N'490-749')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (159, 11, N'873-246')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (160, 1, N'561-827')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (161, 19, N'460-253')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (162, 8, N'746-966')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (163, 11, N'914-787')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (164, 17, N'720-316')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (165, 6, N'133-016')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (166, 17, N'404-432')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (167, 10, N'785-756')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (168, 13, N'987-316')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (169, 2, N'029-214')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (170, 18, N'973-557')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (171, 9, N'643-682')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (172, 11, N'091-452')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (173, 12, N'120-381')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (174, 20, N'733-306')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (175, 16, N'404-146')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (176, 11, N'098-161')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (177, 12, N'257-840')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (178, 7, N'584-459')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (179, 1, N'703-231')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (180, 13, N'355-633')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (181, 2, N'222-222')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (182, 3, N'222-223')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (183, 3, N'333-333')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (184, 3, N'333-333')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (185, 4, N'444-444')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (186, 5, N'123-123')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (187, 5, N'123-125')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (188, 13, N'12323')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (189, 9, N'999-999')
INSERT [dbo].[DocumentsIssueOrganization] ([OrgID], [OrgName], [DeptCode]) VALUES (190, 8, N'999-998')
SET IDENTITY_INSERT [dbo].[DocumentsIssueOrganization] OFF
GO
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (1, N'Клюева', N'Мирослава', N'Романовна', 1, 18, CAST(N'1982-12-04' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (2, N'Гусев', N'Владислав', N'Александрович', 2, 18, CAST(N'1992-01-22' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (3, N'Кузнецов', N'Олег', N'Миронович', 3, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (4, N'Свиридова', N'Варвара', N'Ярославовна', 4, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (5, N'Черкасов', N'Глеб', N'Маркович', 5, 12, CAST(N'1999-11-17' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (6, N'Дмитриев', N'Григорий', N'Леонидович', 6, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (7, N'Соловьев', N'Кирилл', N'Леонидович', 7, 8, CAST(N'2004-06-29' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (8, N'Винокуров', N'Марк', N'Сергеевич', 8, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (9, N'Алексеев', N'Константин', N'Богданович', 9, 14, CAST(N'1993-03-23' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (10, N'Горшков', N'Александр', N'Вадимович', 10, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (11, N'Галкина', N'Полина', N'Тимофеевна', 11, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (12, N'Чижов', N'Дмитрий', N'Владимирович', 12, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (13, N'Чернышева', N'Александра', N'Леонидовна', 13, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (14, N'Ильин', N'Павел', N'Степанович', 14, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (15, N'Дроздова', N'София', N'Артёмовна', 15, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (16, N'Черкасова', N'Ева', N'Ильинична', 16, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (17, N'Рыбаков', N'Егор', N'Николаевич', 17, 9, CAST(N'1990-12-31' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (18, N'Дмитриев', N'Михаил', N'Семёнович', 18, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (19, N'Львова', N'Мария', N'Георгиевна', 19, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (20, N'Никонов', N'Денис', N'Ильич', 20, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (21, N'Мартынов', N'Роман', N'Матвеевич', 21, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (22, N'Коротков', N'Никита', N'Сергеевич', 22, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (23, N'Климова', N'Полина', N'Тимуровна', 23, 1, CAST(N'2002-10-20' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (24, N'Кузнецова', N'Яна', N'Степановна', 24, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (25, N'Чистякова', N'Арина', N'Мироновна', 25, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (26, N'Золотарев', N'Даниил', N'Мирославович', 26, 3, CAST(N'1998-01-22' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (27, N'Наумов', N'Тимофей', N'Андреевич', 27, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (28, N'Михеев', N'Даниил', N'Данилович', 28, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (29, N'Селиванов', N'Константин', N'Андреевич', 29, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (30, N'Борисова', N'Мария', N'Петровна', 30, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (31, N'Васильева', N'Марина', N'Васильевна', 31, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (32, N'Михайлов', N'Илья', N'Артёмович', 32, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (33, N'Морозов', N'Билал', N'Михайлович', 33, 5, CAST(N'1995-06-23' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (34, N'Лукин', N'Даниил', N'Фёдорович', 34, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (35, N'Фролова', N'Ника', N'Ивановна', 35, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (36, N'Родионов', N'Егор', N'Михайлович', 36, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (37, N'Николаев', N'Алексей', N'Тихонович', 37, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (38, N'Новиков', N'Марк', N'Артёмович', 38, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (39, N'Гусев', N'Али', N'Данилович', 39, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (40, N'Дроздова', N'Ульяна', N'Григорьевна', 40, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (41, N'Черных', N'Елизавета', N'Ильинична', 41, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (42, N'Тихомирова', N'Виктория', N'Даниэльевна', 42, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (43, N'Фролова', N'Ника', N'Платоновна', 43, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (44, N'Михайлова', N'Кира', N'Михайловна', 44, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (45, N'Ершова', N'Яна', N'Артёмовна', 45, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (46, N'Грачева', N'Лилия', N'Артёмовна', 46, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (47, N'Матвеева', N'Милана', N'Марковна', 47, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (48, N'Шаров', N'Глеб', N'Захарович', 48, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (49, N'Семенова', N'Василиса', N'Мирославовна', 49, 10, CAST(N'1991-05-19' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (50, N'Зубова', N'Полина', N'Марковна', 50, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (51, N'Иванов', N'Мирон', N'Арсентьевич', 51, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (52, N'Гуляев', N'Макар', N'Тимофеевич', 52, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (53, N'Березина', N'Агния', N'Андреевна', 53, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (54, N'Кудрявцева', N'Майя', N'Максимовна', 54, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (55, N'Синицын', N'Святослав', N'Артёмович', 55, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (56, N'Судакова', N'Полина', N'Денисовна', 56, 10, CAST(N'1990-12-31' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (57, N'Лавров', N'Милан', N'Андреевн', 57, 1, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (58, N'Павловская', N'Виктория', N'Владимировна', 58, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (59, N'Соболева', N'Виктория', N'Захаровна', 59, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (60, N'Еремин', N'Иван', N'Сергеевич', 60, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (61, N'Розанова', N'Алия', N'Александровна', 61, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (62, N'Крюков', N'Дмитрий', N'Егорович', 62, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (63, N'Козлов', N'Андрей', N'Леонидович', 63, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (64, N'Бирюкова', N'Амина', N'Александровна', 64, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (65, N'Князева', N'Милана', N'Александровна', 65, 11, CAST(N'1990-04-14' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (66, N'Корнилов', N'Егор', N'Елисеевич', 66, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (67, N'Молчанова', N'Амалия', N'Ивановна', 67, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (68, N'Екатерина', N'Орлова', N'', 68, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (69, N'Александра', N'Иванова', N'', 69, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (70, N'Милана', N'Третьякова', N'', 70, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (71, N'Марта', N'Власова', N'', 71, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (72, N'Даниил', N'Алешин', N'', 72, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (73, N'Фёдор', N'Демин', N'', 73, 1, CAST(N'2003-05-25' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (74, N'Максим', N'Леонтьев', N'', 74, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (75, N'Марк', N'Дмитриев', N'', 75, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (76, N'Алиса', N'Демина', N'', 76, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (77, N'Даниил', N'Ефремов', N'', 77, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (78, N'Тимур', N'Абрамов', N'', 78, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (79, N'Платон', N'Корнеев', N'', 79, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (80, N'Анна', N'Петрова', N'', 80, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (81, N'Михаил', N'Крылов', N'', 81, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (82, N'Максим', N'Митрофанов', N'', 82, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (83, N'Евгений', N'Королев', N'', 83, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (84, N'Фёдор', N'Воробьев', N'', 84, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (85, N'Амира', N'Сидорова', N'', 85, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (86, N'Оливия', N'Соловьева', N'', 86, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (87, N'Максим', N'Баранов', N'', 87, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (88, N'Анна', N'Ситникова', N'', 88, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (89, N'Елизавета', N'Иванова', N'', 89, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (90, N'Каролина', N'Смирнова', N'', 90, NULL, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (91, N'Сергеев', N'Александр', N'Андреевич', NULL, 15, CAST(N'1996-03-27' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (92, N'Черных', N'Марат', N'Константинович', NULL, 11, NULL)
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (93, N'Еремина', N'Анна', N'Данииловна', NULL, 12, CAST(N'1998-12-29' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (94, N'Андреев', N'Максим', N'Артемьевич', NULL, 2, CAST(N'2002-08-26' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (95, N'Гусева', N'Ксения', N'Ярославовна', NULL, 10, CAST(N'1992-04-21' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (97, N'Климов', N'Мирослав', N'Артёмович', NULL, 6, CAST(N'1995-04-02' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (99, N'Соловьева', N'Светлана', N'Ивановна', NULL, 4, CAST(N'2005-05-19' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (100, N'Клюев', N'Георгий', N'Констанович', NULL, 22, CAST(N'1980-02-11' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (101, N'Алексеев', N'Владислав', N'Богданович', NULL, 12, CAST(N'1995-05-12' AS Date))
GO
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (103, N'Золотарев', N'Маргарита', N'Павловна', NULL, 2, CAST(N'1999-09-23' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (104, N'Морозова', N'Кристина', N'Никитична', NULL, 2, CAST(N'2000-07-04' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (106, N'Семенов', N'Станислав', N'Сергеевич', NULL, 12, CAST(N'1990-06-23' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (109, N'Демина', N'Елена', N'Генадьевна', NULL, 8, CAST(N'1995-10-30' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (110, N'Еремин', N'Степан', N'Иванович', NULL, 20, CAST(N'1989-07-18' AS Date))
INSERT [dbo].[Driver] ([DriverID], [DriverSurname], [DriverName], [DriverPatronymic], [DriverAddress], [DriverExperience], [DriverDateOfBirth]) VALUES (111, N'Клюев', N'Снинислав', N'Георгиевич', NULL, 1, CAST(N'2004-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[Driver] OFF
GO
SET IDENTITY_INSERT [dbo].[Driver_Insurance] ON 

INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (1, 1, 56)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (2, 2, 23)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (3, 3, 2)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (4, 4, 5)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (5, 5, 23)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (7, 7, 7)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (8, 8, 1)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (9, 9, 9)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (10, 10, 17)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (11, 11, 26)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (12, 12, 33)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (14, 14, 49)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (15, 15, 57)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (16, 16, 65)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (17, 17, 73)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (29, 1, 93)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (30, 2, 94)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (31, 3, 95)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (33, 5, 97)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (35, 7, 99)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (36, 8, 100)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (37, 9, 101)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (39, 11, 103)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (40, 12, 104)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (42, 14, 106)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (45, 17, 109)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (46, 1, 110)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (47, 8, 111)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (48, 6, 91)
INSERT [dbo].[Driver_Insurance] ([ID], [Insurance], [Driver]) VALUES (50, 13, 92)
SET IDENTITY_INSERT [dbo].[Driver_Insurance] OFF
GO
SET IDENTITY_INSERT [dbo].[DriverLicense] ON 

INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (1, 5849, 119147, 91, 1)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (2, 5459, 446419, 92, 2)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (3, 372, 653900, 93, 3)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (4, 5878, 696847, 94, 4)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (5, 6399, 751321, 95, 5)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (6, 6568, 305062, 96, 6)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (7, 6454, 761762, 97, 7)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (8, 7541, 65798, 98, 8)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (9, 564, 956134, 99, 9)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (10, 2866, 56167, 100, 10)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (11, 6189, 363231, 101, 11)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (12, 5576, 834254, 102, 12)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (13, 2502, 614705, 103, 13)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (14, 180, 375400, 104, 14)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (15, 1248, 430520, 105, 15)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (16, 3655, 456304, 106, 16)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (17, 9887, 604656, 107, 17)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (18, 3561, 606225, 108, 18)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (19, 3368, 911377, 109, 19)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (20, 8449, 672435, 110, 20)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (21, 6111, 125242, 111, 21)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (22, 9491, 591644, 112, 22)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (23, 6205, 730533, 113, 23)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (24, 6952, 163401, 114, 24)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (25, 3957, 842222, 115, 25)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (26, 5295, 448797, 116, 26)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (27, 164, 482063, 117, 27)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (28, 1348, 757760, 118, 28)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (29, 1087, 884307, 119, 29)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (30, 8355, 423972, 120, 30)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (31, 9240, 354051, 121, 31)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (32, 2719, 168366, 122, 32)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (33, 913, 258480, 123, 33)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (34, 2741, 298651, 124, 34)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (35, 9014, 506640, 125, 35)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (36, 5581, 245542, 126, 36)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (37, 795, 321908, 127, 37)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (38, 1337, 769014, 128, 38)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (39, 7393, 402462, 129, 39)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (40, 8499, 26277, 130, 40)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (41, 3958, 490996, 131, 41)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (42, 1066, 715121, 132, 42)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (43, 8305, 355332, 133, 43)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (44, 5772, 776338, 134, 44)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (45, 1819, 771550, 135, 45)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (46, 3441, 91968, 136, 46)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (47, 8104, 830963, 137, 47)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (48, 3390, 41582, 138, 48)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (49, 1367, 856255, 139, 49)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (50, 7701, 875906, 140, 50)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (51, 871, 497633, 141, 51)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (52, 7262, 159811, 142, 52)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (53, 7461, 390905, 143, 53)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (54, 8820, 319580, 144, 54)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (55, 9688, 683290, 145, 55)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (56, 2650, 172581, 146, 56)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (57, 1113, 111113, 147, 57)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (58, 8845, 869027, 148, 58)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (59, 8722, 547988, 149, 59)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (60, 8895, 701784, 150, 60)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (61, 4142, 340603, 151, 61)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (62, 867, 258940, 152, 62)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (63, 2507, 792308, 153, 63)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (64, 4226, 50655, 154, 64)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (65, 3565, 190676, 155, 65)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (66, 4435, 771564, 156, 66)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (67, 1162, 762534, 157, 67)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (68, 5299, 711188, 158, 68)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (69, 3461, 270838, 159, 69)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (70, 5746, 974486, 160, 70)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (71, 6747, 781127, 161, 71)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (72, 3603, 144958, 162, 72)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (73, 653, 670077, 163, 73)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (74, 5295, 127033, 164, 74)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (75, 6610, 141018, 165, 75)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (76, 7780, 385716, 166, 76)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (77, 2266, 899409, 167, 77)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (78, 5717, 216122, 168, 78)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (79, 8282, 337340, 169, 79)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (80, 5248, 558027, 170, 80)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (81, 8175, 97054, 171, 81)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (82, 2106, 179202, 172, 82)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (83, 7068, 769234, 173, 83)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (84, 4399, 394247, 174, 84)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (85, 337, 163709, 175, 85)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (86, 8212, 323759, 176, 86)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (87, 8970, 91372, 177, 87)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (88, 5646, 91479, 178, 88)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (89, 4106, 883587, 179, 89)
INSERT [dbo].[DriverLicense] ([LisenseID], [LicensetSeries], [LicensetNum], [LicenseIssueOrg], [LicneseDriver]) VALUES (90, 3676, 514753, 180, 90)
SET IDENTITY_INSERT [dbo].[DriverLicense] OFF
GO
SET IDENTITY_INSERT [dbo].[Insurance] ON 

INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (1, 18, 7, CAST(6051.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (2, 19, 1, CAST(3878.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (3, 20, 3, CAST(7498.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (4, 21, 5, CAST(9558.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (5, 22, 8, CAST(3013.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (6, 23, 7, CAST(8240.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (7, 24, 6, CAST(8460.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (8, 25, 6, CAST(7871.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (9, 26, 4, CAST(5282.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (10, 27, 8, CAST(5906.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (11, 28, 4, CAST(4759.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (12, 29, 6, CAST(6623.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (13, 30, 7, CAST(5297.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (14, 31, 2, CAST(5249.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (15, 32, 8, CAST(8420.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (16, 33, 2, CAST(2889.00 AS Decimal(10, 2)))
INSERT [dbo].[Insurance] ([InsuranceID], [InsuranceCar], [InsuranceCompany], [InsurancePayment]) VALUES (17, 34, 6, CAST(6412.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Insurance] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuranceCompany] ON 

INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (1, N'АО "АльфаСтрахование"')
INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (2, N'АО "СОГАЗ"')
INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (3, N'АО СК "Армеец"')
INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (4, N'ООО "СК "Согласие"')
INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (5, N'ООО РСО "ЕВРОИНС"')
INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (6, N'ООО СК "Сбербанк страхование"')
INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (7, N'ПАО СК "Росгосстрах"')
INSERT [dbo].[InsuranceCompany] ([CompanyID], [CompanyName]) VALUES (8, N'СПАО "Ингосстрах"')
SET IDENTITY_INSERT [dbo].[InsuranceCompany] OFF
GO
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (1, N'Integra')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (2, N'100')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (3, N'Blazer')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (4, N'Flhtk')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (5, N'Cavalier')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (6, N'Wrangler Unlimited')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (7, N'Civic')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (8, N'Spectra')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (9, N'Range Rover')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (10, N'Jetta')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (11, N'911')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (12, N'Sonata')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (13, N'Intrepid')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (14, N'Wrangler')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (15, N'F 150')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (16, N'TT')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (17, N'ECHO')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (18, N'Maxima')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (19, N'Freestar')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (20, N'NSX')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (21, N'Camry')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (22, N'A3')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (23, N'A4')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (24, N'A6')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (25, N'F 450')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (26, N'Explorer')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (27, N'Econoline')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (28, N'Santa Fe')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (29, N'Santa Fe Sport')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (30, N'Elantra')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (31, N'3 серии')
INSERT [dbo].[Model] ([ModelID], [ModelName]) VALUES (32, N'7 серии')
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[OrgName] ON 

INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (1, N'ГУ МВД России по г. Казани')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (2, N'ГУ МВД России по г. Волгограду')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (3, N'ГУ МВД России по г. Санкт-Петербургу')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (4, N'ГУ МВД России по г. Саратову')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (5, N'ГУ МВД России по г. Уфе')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (6, N'ГУ МВД России по Пермскому краю')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (7, N'ГУ МВД России по г. Нижнему Новгороду')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (8, N'ГУ МВД России по г. Воронежу')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (9, N'ГУ МВД России по г. Ижевску')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (10, N'ГУ МВД России по г. Ростову-на-Дону')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (11, N'ГУ МВД России по г. Тюмени')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (12, N'ГУ МВД России по г. Челябинску')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (13, N'ГУ МВД России по г. Москве')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (14, N'ГУ МВД России по г. Красноярску')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (15, N'ГУ МВД России по г. Новосибирску')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (16, N'ГУ МВД России по г. Тольятти')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (17, N'ГУ МВД России по г. Краснодару')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (18, N'ГУ МВД России по г. Самаре')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (19, N'ГУ МВД России по г. Екатеринбургу')
INSERT [dbo].[OrgName] ([OrgNameID], [OrganizationName]) VALUES (20, N'ГУ МВД России по г. Омску')
SET IDENTITY_INSERT [dbo].[OrgName] OFF
GO
SET IDENTITY_INSERT [dbo].[Passport] ON 

INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (1, 6191, 859316, 1, 1)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (2, 9909, 661998, 2, 2)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (3, 5578, 221861, 3, 3)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (4, 5699, 972395, 4, 4)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (5, 7928, 98980, 5, 5)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (6, 4021, 157226, 6, 6)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (7, 3297, 81858, 7, 7)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (8, 6067, 284341, 8, 8)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (9, 5575, 395301, 9, 9)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (10, 706, 319563, 10, 10)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (11, 9334, 76954, 11, 11)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (12, 5960, 917965, 12, 12)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (13, 5455, 852634, 13, 13)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (14, 557, 343335, 14, 14)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (15, 5390, 79115, 15, 15)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (16, 3771, 953653, 16, 16)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (17, 1559, 689588, 17, 17)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (18, 170, 683031, 18, 18)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (19, 7548, 293517, 19, 19)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (20, 6987, 970014, 20, 20)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (21, 5095, 775049, 21, 21)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (22, 862, 665736, 22, 22)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (23, 1757, 54087, 23, 23)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (24, 8064, 396877, 24, 24)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (25, 1262, 771972, 25, 25)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (26, 8716, 540150, 26, 26)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (27, 3913, 744034, 27, 27)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (28, 8824, 92820, 28, 28)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (29, 7681, 841936, 29, 29)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (30, 6647, 30709, 30, 30)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (31, 5780, 970579, 31, 31)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (32, 3087, 598514, 32, 32)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (33, 2067, 151017, 33, 33)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (34, 4583, 252004, 34, 34)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (35, 3470, 798644, 35, 35)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (36, 4169, 34892, 36, 36)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (37, 6408, 950486, 37, 37)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (38, 7681, 987471, 38, 38)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (39, 9779, 495344, 39, 39)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (40, 3186, 511014, 40, 40)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (41, 8945, 842437, 41, 41)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (42, 2569, 191385, 42, 42)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (43, 4910, 417345, 43, 43)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (44, 619, 108014, 44, 44)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (45, 1921, 123369, 45, 45)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (46, 8751, 237050, 46, 46)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (47, 8307, 148805, 47, 47)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (48, 9207, 900547, 48, 48)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (49, 2526, 982747, 49, 49)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (50, 3362, 888043, 50, 50)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (51, 2708, 637056, 51, 51)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (52, 7983, 459288, 52, 52)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (53, 4156, 852659, 53, 53)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (54, 3558, 140014, 54, 54)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (55, 8816, 944409, 55, 55)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (56, 1339, 265416, 56, 56)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (57, 1112, 111112, 57, 57)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (58, 5639, 97126, 58, 58)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (59, 3946, 685659, 59, 59)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (60, 3386, 76087, 60, 60)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (61, 9073, 21489, 61, 61)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (62, 9156, 94447, 62, 62)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (63, 222, 297100, 63, 63)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (64, 1067, 965537, 64, 64)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (65, 3555, 809000, 65, 65)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (66, 5109, 343688, 66, 66)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (67, 6682, 667191, 67, 67)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (68, 8764, 7293, 68, 68)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (69, 3413, 824608, 69, 69)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (70, 5966, 485695, 70, 70)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (71, 7143, 960465, 71, 71)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (72, 2550, 130203, 72, 72)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (73, 1689, 848352, 73, 73)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (74, 3953, 524337, 74, 74)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (75, 3498, 396148, 75, 75)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (76, 368, 638446, 76, 76)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (77, 1819, 531059, 77, 77)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (78, 2199, 393272, 78, 78)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (79, 7635, 474975, 79, 79)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (80, 6565, 662526, 80, 80)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (81, 5691, 94368, 81, 81)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (82, 5595, 890584, 82, 82)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (83, 2043, 364804, 83, 83)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (84, 5467, 126768, 84, 84)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (85, 2954, 556556, 85, 85)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (86, 4935, 374013, 86, 86)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (87, 1062, 616852, 87, 87)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (88, 1783, 934810, 88, 88)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (89, 822, 298525, 89, 89)
INSERT [dbo].[Passport] ([PassportID], [PassportSeries], [PassportNum], [PassportIssueOrg], [PassportDriver]) VALUES (90, 3158, 382676, 90, 90)
SET IDENTITY_INSERT [dbo].[Passport] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (1, N'Кировская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (2, N'Магаданская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (3, N'Ивановская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (4, N'Рязанская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (5, N'Ярославская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (6, N'Новгородская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (7, N'Новосибирская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (8, N'Иркутская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (9, N'Вологодская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (10, N'Сахалинская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (11, N'Ростовская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (12, N'Пензенская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (13, N'Липецкая')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (14, N'Саратовская')
INSERT [dbo].[Region] ([RegionID], [RegionName]) VALUES (15, N'Московская')
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Угнана')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Найдена')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Street] ON 

INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (1, N'ул. Ломоносова')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (2, N'бульвар Бухарестская')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (3, N'бульвар Домодедовская')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (4, N'наб. Космонавтов')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (5, N'проезд Славы')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (6, N'въезд Гоголя')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (7, N'въезд Балканская')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (8, N'пл. 1905года')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (9, N'пер. Бухарестская')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (10, N'бульвар Гагарина')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (11, N'бульвар Будапештсткая')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (12, N'бульвар Ладыгина')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (13, N'проезд Балканская')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (14, N'въезд Гагарина')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (15, N'пер. Сталина')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (16, N'шоссе Чехова')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (17, N'въезд Космонавтов')
SET IDENTITY_INSERT [dbo].[Street] OFF
GO
SET IDENTITY_INSERT [dbo].[TheftFoundedCar] ON 

INSERT [dbo].[TheftFoundedCar] ([CaseID], [CaseCar], [CaseDate], [CaseAddress], [CaseStatus]) VALUES (1, 18, CAST(N'2021-03-06' AS Date), 91, 1)
INSERT [dbo].[TheftFoundedCar] ([CaseID], [CaseCar], [CaseDate], [CaseAddress], [CaseStatus]) VALUES (2, 30, CAST(N'2021-03-28' AS Date), 92, 1)
INSERT [dbo].[TheftFoundedCar] ([CaseID], [CaseCar], [CaseDate], [CaseAddress], [CaseStatus]) VALUES (3, 34, CAST(N'2022-07-03' AS Date), 93, 1)
INSERT [dbo].[TheftFoundedCar] ([CaseID], [CaseCar], [CaseDate], [CaseAddress], [CaseStatus]) VALUES (4, 18, CAST(N'2022-06-18' AS Date), 94, 2)
INSERT [dbo].[TheftFoundedCar] ([CaseID], [CaseCar], [CaseDate], [CaseAddress], [CaseStatus]) VALUES (5, 34, CAST(N'2022-09-12' AS Date), 95, 2)
SET IDENTITY_INSERT [dbo].[TheftFoundedCar] OFF
GO
SET IDENTITY_INSERT [dbo].[VehiclePassport] ON 

INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (2, 18, N'3643827
', N'1286288
', N'С533УХ123', 1, 1, 1991)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (3, 19, N'2380490
', N'1170947
', N'Р098АС08', 2, 2, 1994)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (4, 20, N'3411097', N'5535801', N'О269КК93', 3, 3, 2001)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (5, 21, N'6869423', N'5147226', N'Е352НС777', 4, 4, 2012)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (6, 22, N'5640035', N'4034696', N'В895ЕС777', 3, 5, 1998)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (7, 23, N'3987354', N'4211119', N'Р554АК63', 5, 6, 2013)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (8, 24, N'4174559', N'3005002', N'Е979ОУ26', 6, 7, 2002)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (9, 25, N'5099423', N'4319137', N'В034РО53', 7, 8, 2002)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (10, 26, N'5606655', N'1699896', N'С357АС48', 1, 1, 1998)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (11, 27, N'4548221', N'5704726', N'Р721НО23', 8, 9, 2012)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (12, 28, N'3199227', N'4981288', N'В498ВР123', 9, 10, 2001)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (13, 29, N'4126724', N'5558146', N'Х811КЕ193', 10, 11, 2006)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (14, 30, N'3345323', N'4363737', N'У700МХ158', 11, 12, 2007)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (15, 31, N'2709913', N'5153579', N'С716УО123', 12, 13, 2002)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (16, 32, N'4494289', N'4871461', N'Т961КО193', 5, 14, 2013)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (17, 33, N'6278665', N'3439524', N'Р977ХР23', 13, 15, 2004)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (18, 34, N'8063041', N'3910846', N'Х687РУ778', 2, 16, 2001)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (38, 35, N'729316', N'7045985', N'м145ТН777', 14, 17, 2001)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (39, 36, N'685347', N'2276472', N'А601АН123', 15, 18, 1999)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (40, 37, N'690432', N'1368153', N'М999РН96', 13, 19, 2005)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (41, 38, N'713655', N'3447266', N'А 759 Т У82', 1, 20, 1991)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (42, 39, N'686123', N'4224845', N'О 657 В А182', 14, 21, 1991)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (43, 40, N'725148', N'112535', N'В 769 С Х182', 2, 22, 2009)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (45, 42, N'728124', N'1037599', N'А 951 У Н198', 2, 24, 2007)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (46, 43, N'658712', N'1971869', N'О 338 В Х123', 2, NULL, 2013)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (47, 44, N'698867', N'2450682', N'Т 258 У Х23', 13, 25, 2011)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (48, 45, N'658666', N'4022847', N'Н 743 С Н93', 13, 26, 2010)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (49, 46, N'701785', N'5689512', N'М 584 Х О123', 13, 17, 2000)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (50, 47, N'710504', N'3889086', N'О 353 М Р93', 11, 28, 2002)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (51, 48, N'653342', N'6917561', N'М 158 А У193', 11, 29, 2014)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (52, 49, N'719415', N'5235952', N'В 646 Е Х193', 11, 28, 2006)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (53, 50, N'736214', N'448154', N'А 582 М М198', 11, 30, 2013)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (54, 51, N'687558', N'3600979', N'Н 640 М Е188', 16, 31, 2003)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (55, 52, N'683336', N'4246380', N'О 318 О Н177', 16, NULL, 2007)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (56, 53, N'712683', N'4008645', N'К 654 С С999', 16, 32, 2013)
INSERT [dbo].[VehiclePassport] ([VehiclePassportID], [VehiclePassportCar], [VehiclePassportNum], [EngineNum], [CarGovNum], [CarBrand], [CarModel], [ManufactureYear]) VALUES (60, 54, N'694913', N'7766028', N'О 175 Е Р98', 2, 23, 2003)
SET IDENTITY_INSERT [dbo].[VehiclePassport] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK__Address__City__3E52440B] FOREIGN KEY([City])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK__Address__City__3E52440B]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK__Address__Region__3F466844] FOREIGN KEY([Region])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK__Address__Region__3F466844]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK__Address__Street__403A8C7D] FOREIGN KEY([Street])
REFERENCES [dbo].[Street] ([StreetID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK__Address__Street__403A8C7D]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Driver] FOREIGN KEY([CarOwner])
REFERENCES [dbo].[Driver] ([DriverID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Driver]
GO
ALTER TABLE [dbo].[DocumentsIssueOrganization]  WITH CHECK ADD FOREIGN KEY([OrgName])
REFERENCES [dbo].[OrgName] ([OrgNameID])
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK__Owner__OwnerAddr__1367E606] FOREIGN KEY([DriverAddress])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK__Owner__OwnerAddr__1367E606]
GO
ALTER TABLE [dbo].[Driver_Insurance]  WITH CHECK ADD  CONSTRAINT [FK__Driver_In__Drive__76969D2E] FOREIGN KEY([Driver])
REFERENCES [dbo].[Driver] ([DriverID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Driver_Insurance] CHECK CONSTRAINT [FK__Driver_In__Drive__76969D2E]
GO
ALTER TABLE [dbo].[Driver_Insurance]  WITH CHECK ADD  CONSTRAINT [FK__Driver_In__Insur__75A278F5] FOREIGN KEY([Insurance])
REFERENCES [dbo].[Insurance] ([InsuranceID])
GO
ALTER TABLE [dbo].[Driver_Insurance] CHECK CONSTRAINT [FK__Driver_In__Insur__75A278F5]
GO
ALTER TABLE [dbo].[DriverLicense]  WITH CHECK ADD  CONSTRAINT [FK__DriverLic__Licen__2E1BDC42] FOREIGN KEY([LicenseIssueOrg])
REFERENCES [dbo].[DocumentsIssueOrganization] ([OrgID])
GO
ALTER TABLE [dbo].[DriverLicense] CHECK CONSTRAINT [FK__DriverLic__Licen__2E1BDC42]
GO
ALTER TABLE [dbo].[DriverLicense]  WITH CHECK ADD  CONSTRAINT [FK__DriverLic__Licne__2F10007B] FOREIGN KEY([LicneseDriver])
REFERENCES [dbo].[Driver] ([DriverID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DriverLicense] CHECK CONSTRAINT [FK__DriverLic__Licne__2F10007B]
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD FOREIGN KEY([InsuranceCompany])
REFERENCES [dbo].[InsuranceCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Car] FOREIGN KEY([InsuranceCar])
REFERENCES [dbo].[Car] ([CarID])
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Insurance_Car]
GO
ALTER TABLE [dbo].[OwnerChangeHistory]  WITH CHECK ADD  CONSTRAINT [FK__OwnerChan__NewOw__52593CB8] FOREIGN KEY([NewOwner])
REFERENCES [dbo].[Driver] ([DriverID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OwnerChangeHistory] CHECK CONSTRAINT [FK__OwnerChan__NewOw__52593CB8]
GO
ALTER TABLE [dbo].[OwnerChangeHistory]  WITH CHECK ADD  CONSTRAINT [FK_OwnerChangeHistory_Car] FOREIGN KEY([ChangeCar])
REFERENCES [dbo].[Car] ([CarID])
GO
ALTER TABLE [dbo].[OwnerChangeHistory] CHECK CONSTRAINT [FK_OwnerChangeHistory_Car]
GO
ALTER TABLE [dbo].[Passport]  WITH CHECK ADD  CONSTRAINT [FK__Passport__Passpo__286302EC] FOREIGN KEY([PassportIssueOrg])
REFERENCES [dbo].[DocumentsIssueOrganization] ([OrgID])
GO
ALTER TABLE [dbo].[Passport] CHECK CONSTRAINT [FK__Passport__Passpo__286302EC]
GO
ALTER TABLE [dbo].[Passport]  WITH CHECK ADD  CONSTRAINT [FK__Passport__Passpo__29572725] FOREIGN KEY([PassportDriver])
REFERENCES [dbo].[Driver] ([DriverID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Passport] CHECK CONSTRAINT [FK__Passport__Passpo__29572725]
GO
ALTER TABLE [dbo].[TheftFoundedCar]  WITH CHECK ADD  CONSTRAINT [FK__TheftFoun__CaseA__4D94879B] FOREIGN KEY([CaseAddress])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[TheftFoundedCar] CHECK CONSTRAINT [FK__TheftFoun__CaseA__4D94879B]
GO
ALTER TABLE [dbo].[TheftFoundedCar]  WITH CHECK ADD FOREIGN KEY([CaseStatus])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[TheftFoundedCar]  WITH CHECK ADD  CONSTRAINT [FK_TheftFoundedCar_Car] FOREIGN KEY([CaseCar])
REFERENCES [dbo].[Car] ([CarID])
GO
ALTER TABLE [dbo].[TheftFoundedCar] CHECK CONSTRAINT [FK_TheftFoundedCar_Car]
GO
ALTER TABLE [dbo].[VehiclePassport]  WITH CHECK ADD  CONSTRAINT [FK__VehiclePa__CarBr__4F7CD00D] FOREIGN KEY([CarBrand])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[VehiclePassport] CHECK CONSTRAINT [FK__VehiclePa__CarBr__4F7CD00D]
GO
ALTER TABLE [dbo].[VehiclePassport]  WITH CHECK ADD  CONSTRAINT [FK__VehiclePa__CarMo__5070F446] FOREIGN KEY([CarModel])
REFERENCES [dbo].[Model] ([ModelID])
GO
ALTER TABLE [dbo].[VehiclePassport] CHECK CONSTRAINT [FK__VehiclePa__CarMo__5070F446]
GO
ALTER TABLE [dbo].[VehiclePassport]  WITH CHECK ADD  CONSTRAINT [FK_VehiclePassport_Car] FOREIGN KEY([VehiclePassportCar])
REFERENCES [dbo].[Car] ([CarID])
GO
ALTER TABLE [dbo].[VehiclePassport] CHECK CONSTRAINT [FK_VehiclePassport_Car]
GO
/****** Object:  Trigger [dbo].[InsurancePaymentIncrease]    Script Date: 26.02.2023 7:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsurancePaymentIncrease]
ON [dbo].[Driver_Insurance]
AFTER INSERT
AS
UPDATE Insurance
SET InsurancePayment = InsurancePayment*1.03
FROM INSERTED
WHERE InsuranceID = inserted.Insurance
GO
ALTER TABLE [dbo].[Driver_Insurance] ENABLE TRIGGER [InsurancePaymentIncrease]
GO
/****** Object:  Trigger [dbo].[InsurancePaymentUpdate]    Script Date: 26.02.2023 7:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[InsurancePaymentUpdate]
ON [dbo].[Driver_Insurance]
AFTER INSERT, UPDATE
AS
IF DATEDIFF(year, (select DriverDateOfBirth
	FROM Driver, inserted
	WHERE DriverID = inserted.Driver), GETDATE()) = 20
BEGIN
UPDATE Insurance
SET InsurancePayment = InsurancePayment * 0.75
FROM Inserted
WHERE InsuranceID = inserted.Insurance
END

ELSE
BEGIN

IF DATEDIFF(year, (select DriverDateOfBirth
	FROM Driver, inserted
	WHERE DriverID = inserted.Driver), GETDATE()) > 20
BEGIN
UPDATE Insurance
SET InsurancePayment = InsurancePayment * 0.82
FROM Inserted
WHERE InsuranceID = inserted.Insurance
END

IF DATEDIFF(year, (select DriverDateOfBirth
	FROM Driver, inserted
	WHERE DriverID = inserted.Driver), GETDATE()) <= 19
BEGIN
UPDATE Insurance
SET InsurancePayment = InsurancePayment * 1.2
FROM Inserted
WHERE InsuranceID = inserted.Insurance
END

END

GO
ALTER TABLE [dbo].[Driver_Insurance] DISABLE TRIGGER [InsurancePaymentUpdate]
GO
USE [master]
GO
ALTER DATABASE [GIBDD] SET  READ_WRITE 
GO