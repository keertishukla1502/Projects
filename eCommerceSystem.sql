USE [master]
GO
/****** Object:  Database [eCommerceSystem]    Script Date: 3/3/2022 4:50:29 PM ******/
CREATE DATABASE [eCommerceSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eCommerceSystem_data', FILENAME = N'D:\SQL_2016\eCommerceSystem_data.mdf' , SIZE = 8192KB , MAXSIZE = 4194304KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eCommerceSystem_log', FILENAME = N'D:\SQL_2016\eCommerceSystem_log.ldf' , SIZE = 73728KB , MAXSIZE = 4194304KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [eCommerceSystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eCommerceSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eCommerceSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eCommerceSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eCommerceSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eCommerceSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eCommerceSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [eCommerceSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eCommerceSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eCommerceSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eCommerceSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eCommerceSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eCommerceSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eCommerceSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eCommerceSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eCommerceSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eCommerceSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eCommerceSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eCommerceSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eCommerceSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eCommerceSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eCommerceSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eCommerceSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eCommerceSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eCommerceSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eCommerceSystem] SET  MULTI_USER 
GO
ALTER DATABASE [eCommerceSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eCommerceSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eCommerceSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eCommerceSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eCommerceSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eCommerceSystem', N'ON'
GO
ALTER DATABASE [eCommerceSystem] SET QUERY_STORE = OFF
GO
USE [eCommerceSystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [eCommerceSystem]
GO
/****** Object:  User [atul]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE USER [atul] FOR LOGIN [atul] WITH DEFAULT_SCHEMA=[atul]
GO
ALTER ROLE [db_owner] ADD MEMBER [atul]
GO
/****** Object:  Schema [atul]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE SCHEMA [atul]
GO
/****** Object:  Table [atul].[__EFMigrationsHistory]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetRoleClaims]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetRoleClaimsIdentity]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetRoleClaimsIdentity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaimsIdentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetRoles]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetRolesIdentity]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetRolesIdentity](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRolesIdentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserClaims]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserClaimsIdentity]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserClaimsIdentity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaimsIdentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserLogins]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserLoginsIdentity]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserLoginsIdentity](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLoginsIdentity] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserRoles]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserRolesIdentity]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserRolesIdentity](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRolesIdentity] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUsers]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUsersIdentity]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUsersIdentity](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Firstname] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
 CONSTRAINT [PK_AspNetUsersIdentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserTokens]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[AspNetUserTokensIdentity]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[AspNetUserTokensIdentity](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokensIdentity] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[Order]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NULL,
	[DeliveryAddress] [nvarchar](max) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[TblCart]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[TblCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsComplete] [bit] NULL,
 CONSTRAINT [PK_TblCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [atul].[TblCartSummary]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[TblCartSummary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NULL,
	[ProductId] [int] NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_TblCartSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [atul].[TblCategory]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[TblCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TblCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [atul].[TblContactUs]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[TblContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_TblContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[TblExceptionDetails]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[TblExceptionDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[ExceptionDate] [datetime] NULL,
 CONSTRAINT [PK_TblExceptionDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblNews]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblNews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblNews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblOrderShipping]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblOrderShipping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShippingAddressId] [int] NULL,
	[CartId] [int] NULL,
	[UserID] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblOrderShipping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblPlugin]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblPlugin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[PluginFile] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[IsPublic] [bit] NULL,
 CONSTRAINT [PK_tblPlugin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblPluginFile]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblPluginFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PluginId] [int] NULL,
	[PluginFilePath] [nvarchar](max) NULL,
	[FileType] [nvarchar](500) NULL,
	[FileName] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblPluginFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[TblProduct]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[TblProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductName] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Price] [int] NULL,
	[InStock] [bit] NULL,
	[ShowPublic] [bit] NULL,
	[SubCategoryID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TblProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[TblProductImages]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[TblProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[ProductPath] [nvarchar](max) NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_TblProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblShippingAddress]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblShippingAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[AddressLine] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[Landmark] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Customer_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblShippingAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblSubCategory]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblSubCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[SubCategoryName] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblTickets]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblTickets](
	[Ticket_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date_Entered] [datetime] NULL,
	[Account_Number] [nvarchar](50) NULL,
	[Phone_Number] [nvarchar](50) NULL,
	[Customer_Name] [nvarchar](150) NULL,
	[Selected] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[Createdby] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblTransaction]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](500) NULL,
	[CartId] [int] NULL,
	[Price] [int] NULL,
	[Guid] [nvarchar](max) NULL,
	[TransactionDate] [datetime] NULL,
 CONSTRAINT [PK_tblTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [atul].[tblWishList]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [atul].[tblWishList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[ProductId] [int] NULL,
	[InCart] [bit] NULL,
 CONSTRAINT [PK_tblWishList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [atul].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200724144419_InitialCreate', N'3.1.6')
INSERT [atul].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211022093405_First-Create', N'3.1.20')
GO
INSERT [atul].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1f2800b1-bcbc-45f6-9806-62cf02204c74', N'Admin', N'ADMIN', N'715348de-3255-43b0-8921-fbcf2a286c65')
INSERT [atul].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5', N'User', N'USER', N'118abf78-f4f6-4327-b09b-8e5ac8e71889')
GO
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', N'1f2800b1-bcbc-45f6-9806-62cf02204c74')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2b2a1b7a-6cef-460a-b2c7-b81860dc8ff0', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2e0823b0-6203-4eed-a54d-c4de65dacee8', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'32fb746c-ac0f-4685-bef1-2486f87945d4', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'673b869c-f63c-4a6e-97f0-f92136b0d0f5', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'730922ce-9278-4c1c-b7db-dfbe34ff1e91', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'873922f8-66ab-41e5-994a-0f6e60513a7a', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8d79b86c-5f52-4028-842b-17ef8b6f278f', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a326f953-730d-4d29-ba0f-bd32beeaf594', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b3918e2a-eb6f-4e46-88d9-35ceec661ed8', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ed32c28d-dc02-46c8-b33f-9f3774bcb210', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f1bc7dce-0983-4fd2-a222-5fa61a80044d', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
INSERT [atul].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f387ebbe-32d0-4343-a13c-4be4a29438b7', N'999bed67-a5c5-439e-b585-0b6c3d0d4fa5')
GO
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'2b2a1b7a-6cef-460a-b2c7-b81860dc8ff0', N'test1@user.com', N'TEST1@USER.COM', N'test1@user.com', N'TEST1@USER.COM', 0, N'AQAAAAEAACcQAAAAEPSMsuqSSjw7QuitltDRxTL5eATraHKSVAUB1DGmsc0tf9nV3IL82R7UBCvcYFaoFg==', N'YTDA5UI4GQ3EDQ356R4PY6YA56C3QIKZ', N'5190fa32-c6d5-42f1-9de9-fb3bafa5f220', N'9876543210', 0, 0, NULL, 1, 0, N'Test', N'User')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'2e0823b0-6203-4eed-a54d-c4de65dacee8', N'Mayank@123', N'MAYANK@123', N'Mayank@123', N'MAYANK@123', 0, N'AQAAAAEAACcQAAAAEO10z41EYib2Y1K1TqUJGp2yTSrvr5yolDnGdfyt/cmkvq0Ni/n+IU94a7sXulx3zQ==', N'DYKES3AJ3KZ34FPYBENONTV6GNA3TGM7', N'b704c85c-b2d0-4cbd-9efd-b7de3b99b746', N'2564535566', 0, 0, NULL, 1, 0, N'Mayank', N'Jaiswal')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'32fb746c-ac0f-4685-bef1-2486f87945d4', N'Test@user.com', N'TEST@USER.COM', N'Test@user.com', N'TEST@USER.COM', 0, N'AQAAAAEAACcQAAAAEG1rODkLuT/LT+q4pmM7T1VbLH6LhibDel3ssGqFFFJZ7erzZaSBrpFl9bvvUHeK4w==', N'L3IN445AZB72JJ4GTQF4HDNWS3LF2O6G', N'23baca3a-f5bf-44b4-b069-9e6e81fbdf26', N'9876543210', 0, 0, NULL, 1, 0, N'Test', N'User')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', N'arpan@mail.com', N'ARPAN@MAIL.COM', N'arpan@mail.com', N'ARPAN@MAIL.COM', 0, N'AQAAAAEAACcQAAAAEHVnWMtA9ElYj60vQ9OcZ6F3SzyRIq//R4Dibmdc/rcm1nUl+LN072/1Ay9+8NQK+w==', N'3XNKG5U4ND6RQACG3JHUWVWI6QR5ZK54', N'4c994420-7653-4f4a-b2a1-aea948999f19', N'1234567890', 0, 0, NULL, 1, 0, N'Arpan', N'Sir')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'58b03656-0112-4760-b82f-fe05caf542b5', N'Testing@mailinator.com', N'TESTING@MAILINATOR.COM', N'Testing@mailinator.com', N'TESTING@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEPSnAZ0mT1T1CBu2Iw/vbyxTuqt6YhgvfLRzPGMZz4ncppVHiGi2O4mxI+wyyNecJQ==', N'DOXYC34FKC427P2WZY4F2BSB7FFTMGR5', N'6f708c42-2994-4e78-a50b-396dc6a619c1', N'86565656565565', 0, 0, NULL, 1, 0, N'TestNew', N'Bew')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'673b869c-f63c-4a6e-97f0-f92136b0d0f5', N'testfirst@mailinator.com', N'TESTFIRST@MAILINATOR.COM', N'testfirst@mailinator.com', N'TESTFIRST@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEOWRJZmMnBWkSbyXKjVD3G+K+UeNrfMpz2cFwJQHao9H3Fa6RVNYkl3CvaVlj14YLQ==', N'GRW52GLE3NUX7F2HN6QRVR46HTWQYASS', N'8d2f88a9-0463-4a9e-8a2a-7324c207b473', N'7894515151', 0, 0, NULL, 1, 0, N'testUser', N'Test')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'730922ce-9278-4c1c-b7db-dfbe34ff1e91', N'sanjay.s@cisinlabs.com', N'SANJAY.S@CISINLABS.COM', N'sanjay.s@cisinlabs.com', N'SANJAY.S@CISINLABS.COM', 0, N'AQAAAAEAACcQAAAAEF3L9w9oQ8xIQHGIV5At6Z5u0rLAQ/YX+rDmCObcILDDmvD8j4xnSII7Q8DaOo4p+g==', N'NJRMIYRLNPU75LBEGSYG52RVVJXBNUBF', N'756476cf-98ec-4490-a77a-a29600d03a33', N'8989898988', 0, 0, NULL, 1, 0, N'Sanjay', N'Singj')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'873922f8-66ab-41e5-994a-0f6e60513a7a', N'shubham.n@cisinlabs.com', N'SHUBHAM.N@CISINLABS.COM', N'shubham.n@cisinlabs.com', N'SHUBHAM.N@CISINLABS.COM', 0, N'AQAAAAEAACcQAAAAEDie1Vbd+831hPQGYEc449N9Ibt0AP6cCRPs0D0wotx0kGAzlpG7HlQhQHsmVLTJJA==', N'IXFJTIPERNQACGSZHGYRCJTMQ37EA3CR', N'a3c7a7db-9fcc-43f6-8c84-73a4884c31b1', N'123469875', 0, 0, NULL, 1, 0, N'Shubham', N'N')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'8d79b86c-5f52-4028-842b-17ef8b6f278f', N'chandni@mailinator.com', N'CHANDNI@MAILINATOR.COM', N'chandni@mailinator.com', N'CHANDNI@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEKV2N0j0wv48GGBUFQtRwjtURZC0mvrV3+14tOQtsON9uLgfYjEiSlc5FTd9CLlqIA==', N'CEVNTZHVQ4S4LDWWNO44NOA5GNBIYRBI', N'd7d98982-7a54-4ad4-ac09-37a536673859', N'1245636570', 0, 0, NULL, 1, 0, N'Chandni', N'S')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'a326f953-730d-4d29-ba0f-bd32beeaf594', N'test3@user.com', N'TEST3@USER.COM', N'test3@user.com', N'TEST3@USER.COM', 0, N'AQAAAAEAACcQAAAAEMfOduJITbOn8dKNenTnao3dXnlz+D+EnugdxbVOLmKJQbVUJYIloEbUPnjxsQXtlw==', N'O7WBYWAXLNPKEBZ7535D6BKZYU3FCTKM', N'dbcd08c0-369e-4f4e-a5b6-01f74fcc478d', N'9876543210', 0, 0, NULL, 1, 0, N'Test', N'User')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'b3918e2a-eb6f-4e46-88d9-35ceec661ed8', N'user@mailinator.com', N'USER@MAILINATOR.COM', N'user@mailinator.com', N'USER@MAILINATOR.COM', 0, N'AQAAAAEAACcQAAAAEBMucrC4hQ7gJgh8rCCw8wiRUsdcuHMhwokQKs06torDhHOflT2AD9Gs9e6EEzac4g==', N'TIMXSW26IRXSZWIGX32FFYC6264REUTG', N'ac298761-2c89-440d-bf0c-a80ea413d5ac', NULL, 0, 0, NULL, 1, 0, N'User', N'public')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'bdf8bca8-c3c0-4f57-95ce-f0277d33e177', N'abc@gmail.com', N'ABC@GMAIL.COM', N'abc@gmail.com', N'ABC@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBCzHZ3BUORZOdJeQmfb+EY4q2rS+LtXfoa23voDSrVivL0kh9QBNzqLLVWblax8tQ==', N'XSADEAMSNQQU5GTDLY6HOPWUOMZ657U2', N'5389752c-9e2c-428b-8176-0d185a480fde', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'c1d329bc-5594-4679-b1d3-3a6ccc54d038', N'keerti.s@cisinlabs.com', N'KEERTI.S@CISINLABS.COM', N'keerti.s@cisinlabs.com', N'KEERTI.S@CISINLABS.COM', 1, N'AQAAAAEAACcQAAAAEKnq0KfKXqgXqPPuhrhSef3cAVKozzV8GQewGzO4SADiNdIqjE0+iwJKIRbhc/rXvg==', N'B5MXV5LL3O4QG7UFXHSA3GD2CQPSJRD2', N'ef66d230-899b-47cf-ab66-10e5decac09d', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', N'Admin@mail.com', N'ADMIN@MAIL.COM', N'Admin@mail.com', N'ADMIN@MAIL.COM', 0, N'AQAAAAEAACcQAAAAEOGagr9nR/T8z6bxlWW1zaFYW0yWWbZadk2cyGjv+RwgrwkFRz/vuF9xq8czsZVArA==', N'4T2SEZ5ILNA635R4USILJNHQBN6UNUTE', N'93cfd3ab-200e-4470-9f10-29249c9f24b4', NULL, 0, 0, NULL, 1, 0, N'Admin', N'Admin')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'e74b8715-3c09-4d2a-a80c-30661c8b0eca', N'abcd@gmail.com', N'ABCD@GMAIL.COM', N'abcd@gmail.com', N'ABCD@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEN6+vE55aef7nq19Q97w7qWFMGrD0nZCQkozqvHF75mP7t5mbyM5I44d6wgW6odbnQ==', N'W6ISPNBSMR5CJRYEQ65ZR7FCGJKFELJ7', N'58adfba3-0b3e-4c0b-9427-33af2f2cd851', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'ed32c28d-dc02-46c8-b33f-9f3774bcb210', N'atul@cisinlabs.com', N'ATUL@CISINLABS.COM', N'atul@cisinlabs.com', N'ATUL@CISINLABS.COM', 0, N'AQAAAAEAACcQAAAAELDvbbStHNt4qACEqznzswghlo87Ak7sO3xRZaSKkSXDBeK8ezgXwVLmU0qDfc8UVQ==', N'7ZCKEEM33MIX7OWIN3KCKFEJJOPIMM5P', N'7e6df531-8c30-49af-bdae-a8114070f582', N'2343434342', 0, 0, NULL, 1, 0, N'atul', N'khare')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'f1bc7dce-0983-4fd2-a222-5fa61a80044d', N'Newshubham@cisinlabs.com', N'NEWSHUBHAM@CISINLABS.COM', N'Newshubham@cisinlabs.com', N'NEWSHUBHAM@CISINLABS.COM', 0, N'AQAAAAEAACcQAAAAELgwQ4evzMdHgdMILuFj/3WHyVlaHh9qZTlTm9uh8Sa/gKiPO8V6U/GMiKdZgQOcMQ==', N'7OWZWXD7GDCKIFCTOVROIIZSEED2KHJN', N'c13eb400-216d-451c-8e8e-e43559fcb996', N'1314141555', 0, 0, NULL, 1, 0, N'Shubham', N'New')
INSERT [atul].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'f387ebbe-32d0-4343-a13c-4be4a29438b7', N'rajkumar.s@cisinlab.com', N'RAJKUMAR.S@CISINLAB.COM', N'rajkumar.s@cisinlab.com', N'RAJKUMAR.S@CISINLAB.COM', 0, N'AQAAAAEAACcQAAAAEFqWjteyz+pR9jWzWFX9AEthWnv61DGDe8UHhK6Ev22lDb5LexyO4Ddk1KjumxqiYQ==', N'3GG273XICBIK6F5CEWEMBMGVUGKA5FXC', N'2073380d-4854-43c5-845c-46c0bc0a5f24', N'1234567890', 0, 0, NULL, 1, 0, N'ra', N'sa')
GO
INSERT [atul].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', N'[AspNetUserStore]', N'AuthenticatorKey', N'UQ3XETVZRCMCVDTK2OSUUXDWLL3PCJTL')
GO
SET IDENTITY_INSERT [atul].[Order] ON 

INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (1, 4, N'Vijay Nagar', CAST(N'2021-04-05T21:04:09.240' AS DateTime))
INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (2, 4, N'Vijay Nagar', CAST(N'2021-04-05T21:06:06.527' AS DateTime))
INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (3, 2, N'sdgdf', CAST(N'2021-04-17T16:40:28.113' AS DateTime))
INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (4, 5, N'adfdsaf', CAST(N'2021-05-01T21:06:52.940' AS DateTime))
INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (5, 6, N'Vijay Nagar', CAST(N'2021-05-11T16:18:44.390' AS DateTime))
INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (6, 8, N'Vijay Nagar', CAST(N'2021-05-15T14:44:51.827' AS DateTime))
INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (7, 12, N'Vijay Nagar', CAST(N'2021-05-17T19:41:44.760' AS DateTime))
INSERT [atul].[Order] ([Id], [CartId], [DeliveryAddress], [OrderDate]) VALUES (8, 13, N'Vijay Nagar', CAST(N'2021-05-25T18:38:01.920' AS DateTime))
SET IDENTITY_INSERT [atul].[Order] OFF
GO
SET IDENTITY_INSERT [atul].[TblCart] ON 

INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (1, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2020-10-13T20:36:09.853' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (2, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', CAST(N'2020-11-06T16:28:23.463' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (3, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-04-05T20:32:53.843' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (4, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-04-05T21:00:11.583' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (5, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', CAST(N'2021-05-01T20:58:16.320' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (6, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-11T16:16:42.143' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (7, N'f387ebbe-32d0-4343-a13c-4be4a29438b7', CAST(N'2021-05-15T14:33:02.877' AS DateTime), 0)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (8, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-15T14:42:02.293' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (9, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-15T20:45:44.583' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (10, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-17T16:47:20.703' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (11, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-17T17:06:35.443' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (12, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-17T17:15:55.583' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (13, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-25T18:27:49.923' AS DateTime), 1)
INSERT [atul].[TblCart] ([Id], [UserId], [CreatedDate], [IsComplete]) VALUES (14, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-29T18:12:28.247' AS DateTime), 0)
SET IDENTITY_INSERT [atul].[TblCart] OFF
GO
SET IDENTITY_INSERT [atul].[TblCartSummary] ON 

INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (19, 2, 2, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (22, 1, 2, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (23, 3, 10, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (24, 3, 3, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (25, 4, 10, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (26, 5, 2, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (28, 6, 2, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (29, 7, 2, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (30, 8, 3, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (31, 9, 3, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (32, 10, 10, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (33, 11, 10, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (34, 12, 10, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (35, 13, 10, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (36, 14, 3, 1)
INSERT [atul].[TblCartSummary] ([Id], [CartId], [ProductId], [Qty]) VALUES (37, 14, 10, 3)
SET IDENTITY_INSERT [atul].[TblCartSummary] OFF
GO
SET IDENTITY_INSERT [atul].[TblCategory] ON 

INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (7, N'DNN1', CAST(N'2020-08-29T13:56:35.187' AS DateTime), CAST(N'2021-10-14T13:57:46.897' AS DateTime), NULL)
INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (8, N'WordPress1', CAST(N'2020-08-29T13:56:50.817' AS DateTime), CAST(N'2021-10-14T13:57:56.790' AS DateTime), NULL)
INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (9, N'NoopComercer', CAST(N'2020-09-16T16:02:15.603' AS DateTime), CAST(N'2021-04-06T13:28:45.513' AS DateTime), NULL)
INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (10, N'Bikes', CAST(N'2020-09-19T22:28:21.873' AS DateTime), CAST(N'2020-10-14T18:46:35.417' AS DateTime), NULL)
INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (11, N'Laptop', CAST(N'2020-10-16T17:22:25.660' AS DateTime), CAST(N'2020-10-16T18:35:27.913' AS DateTime), 1)
INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (12, N'TestCatea', CAST(N'2021-05-11T16:03:23.763' AS DateTime), CAST(N'2021-05-11T16:03:33.317' AS DateTime), NULL)
INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (13, N'tests', CAST(N'2021-05-15T14:35:11.693' AS DateTime), CAST(N'2021-05-15T14:35:17.407' AS DateTime), NULL)
INSERT [atul].[TblCategory] ([Id], [CategoryName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (14, N'asas', CAST(N'2021-10-14T14:34:00.547' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [atul].[TblCategory] OFF
GO
SET IDENTITY_INSERT [atul].[TblContactUs] ON 

INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (9, N'Test', N'TestingPurpose', N'info@cisinlabs.com', N'What is new in your website')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (10, N'test2', N'test test', N'asdf@test.com', N'testing the functionality')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (11, N'test test', N'Testing', N'shubham.n@cisinlabs.com', N'My Ecommerce Searching')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (12, N'dfdf', N'aadd', N'shubham.n@cisinlabs.com', N'e-commerce changes')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (13, N'ddf', N'dcdfdff', N'shubham.n@cisinlabs.com', N'ddffgghhhhhhhhhh')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (14, N'xxs', N'dff', N'shubham.n@cisinlabs.com', N'dfdfdfffff')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (15, N'fgfgfg', N'dff', N'sanjay.s@cisinlabs.com', N'ffffff')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (16, N'Chandni Shah', N'About Information', N'cshah21@nyit.edu', N'This is your website. what is new for me.')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (17, N'Chandni Shah', N'ddddd', N'cshah21@nyit.edu', N'dddd')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (18, N'Chandni Shah', N'ddddd', N'cshah21@nyit.edu', N'dddd')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (19, N'Chandni Shah', N'ddddd', N'cshah21@nyit.edu', N'dddd')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (20, N'cc', N'cccc', N'cshah21@nyit.edu', N'cc')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (21, N'Chandni Shah', N'About Information', N'cshah21@nyit.edu', N'cccccc')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (22, N'gfgfg', N'About Information', N'shuhbam.n@cisinlabs.com', N'ddd')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (23, N'cc', N'sss', N'shuhbam.n@cisinlabs.com', N'dd')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (24, N'Shubham Nema', N'Need Product Details', N'shubham.n@cisinlabs.com', N'I need information about Electrical item.')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (25, N'Shubham Nema', N'Need Product Details', N'shubham.n@cisinlabs.com', N'Need information about electricle information')
INSERT [atul].[TblContactUs] ([Id], [Name], [Subject], [Email], [Message]) VALUES (26, N'Test', N'Need information about Vegetable ', N'shubham.n@cisinlabs.com', N'Please let me know')
SET IDENTITY_INSERT [atul].[TblContactUs] OFF
GO
SET IDENTITY_INSERT [atul].[TblExceptionDetails] ON 

INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (1, N'Exception type: Microsoft.Data.SqlClient.SqlException
Message       : Invalid column name ''DeletionReason''.
Invalid column name ''IsDeleted''.
Invalid column name ''UserId''.
Stacktrace:
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at ECommerce.Repositories.Repository.GenericRepository`1.GetAll() in E:\01_AbzsData\00 Live Projects\10 FreVee\CarlosProject\ECommerce.Repositories\Repository\GenericRepository.cs:line 29
   at E_CommerceSystem.WebApi.User.UserProductController.Index(Nullable`1 page) in E:\01_AbzsData\00 Live Projects\10 FreVee\CarlosProject\E-CommerceSystem\WebApi\User\UserProductController.cs:line 62

', CAST(N'2020-10-13T21:20:12.277' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (2, N'Exception type: Microsoft.Data.SqlClient.SqlException
Message       : Invalid column name ''DeletionReason''.
Invalid column name ''IsDeleted''.
Invalid column name ''UserId''.
Stacktrace:
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at ECommerce.Repositories.Repository.GenericRepository`1.GetAll() in E:\01_AbzsData\00 Live Projects\10 FreVee\CarlosProject\ECommerce.Repositories\Repository\GenericRepository.cs:line 29
   at E_CommerceSystem.WebApi.User.UserProductController.Index(Nullable`1 page) in E:\01_AbzsData\00 Live Projects\10 FreVee\CarlosProject\E-CommerceSystem\WebApi\User\UserProductController.cs:line 62

', CAST(N'2020-10-13T21:21:22.810' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (3, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 29
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 51

', CAST(N'2020-10-28T12:35:03.587' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (4, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody)
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs)

', CAST(N'2020-10-28T12:49:45.367' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (5, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 234

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2020-11-06T16:28:09.680' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (6, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 239

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2020-11-18T20:58:16.100' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (7, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 239

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2020-11-18T20:58:23.517' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (8, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 239

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2020-11-21T14:07:42.413' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (9, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 261
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 238

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2020-11-21T16:15:27.627' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (10, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 32
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 52

', CAST(N'2020-12-15T18:21:34.953' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (11, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 32
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 51

', CAST(N'2020-12-15T18:23:39.207' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (12, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 32
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 51

', CAST(N'2020-12-15T18:27:58.023' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (13, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 32
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 51

', CAST(N'2020-12-15T18:28:02.983' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (14, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody)
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs)

', CAST(N'2020-12-15T18:50:44.313' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (15, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 239

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-04-13T17:17:00.167' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (16, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 239

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-04-13T17:17:00.167' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (17, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 261
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 238

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-04-17T16:51:51.920' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (18, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 261
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 238

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-04-17T16:51:51.920' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (19, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 261
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 238

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-04-17T16:53:14.633' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (20, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at System.Linq.Expressions.ExpressionVisitor.Visit(Expression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at System.Linq.Expressions.ExpressionVisitor.Visit(Expression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at System.Linq.Expressions.ExpressionVisitor.Visit(Expression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at System.Linq.Expressions.ExpressionVisitor.Visit(Expression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 239

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-04-23T13:56:22.570' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (21, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at System.Linq.Queryable.FirstOrDefault[TSource](IQueryable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.AddShippingProduct(Int32 ShippingId) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 442

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-05-01T20:46:01.123' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (22, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 32
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 52

', CAST(N'2021-05-11T16:06:02.623' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (23, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.AddShippingProduct(Int32 ShippingId) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 442

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-05-11T16:15:22.017' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (24, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 32
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 51

', CAST(N'2021-05-11T16:16:16.417' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (25, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 261
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 238

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-05-11T16:16:33.677' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (26, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 239

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-05-15T14:32:52.287' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (27, N'Exception type: System.Net.Mail.SmtpException
Message       : The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at
Stacktrace:
   at System.Net.Mail.MailCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.MailCommand.Send(SmtpConnection conn, Byte[] command, MailAddress from, Boolean allowUnicode)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at E_CommerceSystem.Common.CommonEmail.SendMail(String Recipient, String SubjectBody, String MsgBody) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Common\CommonEmail.cs:line 32
   at E_CommerceSystem.Areas.User.Controllers.ContactController.Contact(ContactUs contactUs) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ContactController.cs:line 52

', CAST(N'2021-05-15T14:39:19.307' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (28, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at System.Linq.Expressions.BinaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at System.Linq.Expressions.MethodCallExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 261
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 238

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-05-15T20:34:22.300' AS DateTime))
INSERT [atul].[TblExceptionDetails] ([Id], [Message], [ExceptionDate]) VALUES (29, N'Exception type: System.InvalidOperationException
Message       : An exception was thrown while attempting to evaluate a LINQ query parameter expression. To show additional information call EnableSensitiveDataLogging() when overriding DbContext.OnConfiguring.
Stacktrace:
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Evaluate(Expression expression, Boolean generateParameter)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitBinary(BinaryExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.VisitBinary(BinaryExpression binaryExpression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitLambda[T](Expression`1 node)
   at System.Linq.Expressions.Expression`1.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Linq.Expressions.ExpressionVisitor.VisitUnary(UnaryExpression node)
   at System.Linq.Expressions.UnaryExpression.Accept(ExpressionVisitor visitor)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at System.Dynamic.Utils.ExpressionVisitorUtils.VisitArguments(ExpressionVisitor visitor, IArgumentProvider nodes)
   at System.Linq.Expressions.ExpressionVisitor.VisitMethodCall(MethodCallExpression node)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.Visit(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.ExtractParameters(Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.ExtractParameters(Expression query, IParameterValues parameterValues, IDiagnosticsLogger`1 logger, Boolean parameterize, Boolean generateContextAccessors)
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryable`1.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at E_CommerceSystem.Areas.User.Controllers.ProductController.ProductSummaryDetails(Int32& TotalPrice, List`1& CartSummaryModel) in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 261
   at E_CommerceSystem.Areas.User.Controllers.ProductController.CartSummaryPage() in D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\Areas\User\Controllers\ProductController.cs:line 238

Exception type: System.NullReferenceException
Message       : Object reference not set to an instance of an object.
Stacktrace:
   at lambda_method(Closure )
   at Microsoft.EntityFrameworkCore.Query.Internal.ParameterExtractingExpressionVisitor.GetValue(Expression expression, String& parameterName)

', CAST(N'2021-05-15T20:34:55.057' AS DateTime))
SET IDENTITY_INSERT [atul].[TblExceptionDetails] OFF
GO
SET IDENTITY_INSERT [atul].[tblNews] ON 

INSERT [atul].[tblNews] ([ID], [Title], [Description], [Image], [IsDeleted]) VALUES (3, N'Ladies', N'She has white hair.', N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadImages\949402634_margaretcrenshaw.jpg', NULL)
INSERT [atul].[tblNews] ([ID], [Title], [Description], [Image], [IsDeleted]) VALUES (4, N'ShubhamNews', N'Testing is my purposess', NULL, NULL)
INSERT [atul].[tblNews] ([ID], [Title], [Description], [Image], [IsDeleted]) VALUES (5, N'Salad', N'This is very tasty Salad.', N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadImages\1941646904_red-apple-isolated-on-white-260nw-1498042211.webp', NULL)
INSERT [atul].[tblNews] ([ID], [Title], [Description], [Image], [IsDeleted]) VALUES (6, N'New Test', N'News about the usa and india pacific', N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadImages\1974694746_Veg.jpg', NULL)
SET IDENTITY_INSERT [atul].[tblNews] OFF
GO
SET IDENTITY_INSERT [atul].[tblOrderShipping] ON 

INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (1, 1, 1, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (2, 2, 2, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', CAST(N'2021-04-17T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (3, 3, 2, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', CAST(N'2021-03-20T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (6, 4, 4, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (7, 3, 5, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (8, 4, 6, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-11T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (9, 4, 8, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-15T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (10, 4, 9, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-15T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (11, 4, 10, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-17T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (12, 4, 11, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-17T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (13, 4, 12, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-17T00:00:00.000' AS DateTime))
INSERT [atul].[tblOrderShipping] ([Id], [ShippingAddressId], [CartId], [UserID], [CreatedDate]) VALUES (14, 4, 13, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', CAST(N'2021-05-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [atul].[tblOrderShipping] OFF
GO
SET IDENTITY_INSERT [atul].[tblPlugin] ON 

INSERT [atul].[tblPlugin] ([Id], [Name], [Description], [CreatedDate], [PluginFile], [CategoryId], [IsPublic]) VALUES (1, N'fdfdfdgdh', N'Testing', CAST(N'2021-05-15T14:34:28.380' AS DateTime), NULL, 7, 0)
INSERT [atul].[tblPlugin] ([Id], [Name], [Description], [CreatedDate], [PluginFile], [CategoryId], [IsPublic]) VALUES (2, N'test', N'testing one', CAST(N'2021-04-06T16:21:04.070' AS DateTime), NULL, 7, 1)
SET IDENTITY_INSERT [atul].[tblPlugin] OFF
GO
SET IDENTITY_INSERT [atul].[tblPluginFile] ON 

INSERT [atul].[tblPluginFile] ([Id], [PluginId], [PluginFilePath], [FileType], [FileName]) VALUES (1, 2, N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadPlugin\511421002_Bonus.rar', N'application/octet-stream', N'Bonus.rar')
INSERT [atul].[tblPluginFile] ([Id], [PluginId], [PluginFilePath], [FileType], [FileName]) VALUES (2, 1, N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadPlugin\840885405_a.zip', N'application/x-zip-compressed', N'a.zip')
SET IDENTITY_INSERT [atul].[tblPluginFile] OFF
GO
SET IDENTITY_INSERT [atul].[TblProduct] ON 

INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (2, 8, N'samsung', N'dsdsdsd', CAST(N'2021-05-15T14:49:45.080' AS DateTime), NULL, 5, 0, 0, 1, NULL)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (3, 8, N'ComputerNew', N'electronicsNew', CAST(N'2020-09-05T14:30:21.220' AS DateTime), NULL, 15, 1, 1, 2, NULL)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (4, 8, N'new test', N'desc1', CAST(N'2020-10-13T20:31:24.450' AS DateTime), NULL, 17, 1, 0, 2, 1)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (7, 8, N'jhfhdfd', N'jgjhfgjhjhhgfhjhfhgfhggfhgfhg', CAST(N'2020-10-13T20:33:32.077' AS DateTime), NULL, 8, 1, 0, 1, 1)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (8, 8, N'Testuser', N'Testing my shubham', CAST(N'2020-11-18T12:30:07.450' AS DateTime), NULL, 4560, 1, 0, 1, NULL)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (9, 8, N'Testing', N'Testing My Game', CAST(N'2020-11-18T12:30:16.413' AS DateTime), NULL, 3, 1, 0, 1, NULL)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (10, 7, N'NewProduct', N'TestOne', CAST(N'2020-10-20T18:16:19.800' AS DateTime), NULL, 1, 1, 1, 3, NULL)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (11, 7, N'test', N'testung', CAST(N'2021-04-06T14:16:32.397' AS DateTime), NULL, 45, 1, 0, 3, NULL)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (12, 7, N'ChandniTest', N'testing end', CAST(N'2021-05-11T16:01:13.070' AS DateTime), NULL, 2, 1, 1, 4, NULL)
INSERT [atul].[TblProduct] ([Id], [CategoryId], [ProductName], [Description], [CreatedDate], [UpdatedDate], [Price], [InStock], [ShowPublic], [SubCategoryID], [IsDeleted]) VALUES (13, 7, N'Vegitable', N'Testing', CAST(N'2021-05-15T14:32:43.620' AS DateTime), NULL, 5, 1, 1, 3, NULL)
SET IDENTITY_INSERT [atul].[TblProduct] OFF
GO
SET IDENTITY_INSERT [atul].[TblProductImages] ON 

INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (2, N'download.jpg', N'image/jpeg', N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadImages\1082702671_download.jpg', 2)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (3, N'photo-1558981403-c5f9899a28bc.jpg', N'image/jpeg', N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadImages\1955449356_photo-1558981403-c5f9899a28bc.jpg', 3)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (4, N'screenshot-1586522962604.jpg', N'image/jpeg', N'E:\Rakesh Yadav\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadImages\1611529891_screenshot-1586522962604.jpg', 4)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (6, N'100041818_download.jpg', N'image/jpeg', N'E:\01_AbzsData\00 Live Projects\10 FreVee\CarlosProject\E-CommerceSystem\wwwroot\UploadImages\1880111681_100041818_download.jpg', 6)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (7, N'100041818_download.jpg', N'image/jpeg', N'E:\01_AbzsData\00 Live Projects\10 FreVee\CarlosProject\E-CommerceSystem\wwwroot\UploadImages\653671206_100041818_download.jpg', 7)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (8, N'margaret crenshaw.jpg', N'image/jpeg', N'D:\HostingSpaces\Atul\ecommerce.ak.mt.cisinlive.com\wwwroot\wwwroot\UploadImages\1907224793_margaretcrenshaw.jpg', 8)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (9, N'new Salad.jpg', N'image/jpeg', N'D:\HostingSpaces\Atul\ecommerce.ak.mt.cisinlive.com\wwwroot\wwwroot\UploadImages\1080512490_newSalad.jpg', 9)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (10, N'Orange.jpg', N'image/jpeg', N'D:\MyBackUp\MyProject\Chandni\E-CommerceWeb\E-CommerceSystem\wwwroot\UploadImages\306912297_Orange.jpg', 10)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (11, N'Veg.jpg', N'image/jpeg', N'D:\HostingSpaces\Atul\ecommerce.ak.mt.cisinlive.com\wwwroot\wwwroot\UploadImages\852796773_Veg.jpg', 12)
INSERT [atul].[TblProductImages] ([Id], [FileName], [Type], [ProductPath], [ProductId]) VALUES (12, N'Veg.jpg', N'image/jpeg', N'D:\HostingSpaces\Atul\ecommerce.ak.mt.cisinlive.com\wwwroot\wwwroot\UploadImages\2014605446_Veg.jpg', 13)
SET IDENTITY_INSERT [atul].[TblProductImages] OFF
GO
SET IDENTITY_INSERT [atul].[tblShippingAddress] ON 

INSERT [atul].[tblShippingAddress] ([Id], [UserId], [AddressLine], [AddressLine2], [Landmark], [City], [State], [Country], [ZipCode], [Customer_Name]) VALUES (1, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', N'geeta bhawan mandir, Near Geeta Bhawan Square', NULL, N'vijay nagar', N'Hilton Head Island', NULL, N'United States', N'29928', NULL)
INSERT [atul].[tblShippingAddress] ([Id], [UserId], [AddressLine], [AddressLine2], [Landmark], [City], [State], [Country], [ZipCode], [Customer_Name]) VALUES (2, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', N'sdgdf', NULL, N'fgfg', N'dfgdf', NULL, N'dfgfd', N'654465', NULL)
INSERT [atul].[tblShippingAddress] ([Id], [UserId], [AddressLine], [AddressLine2], [Landmark], [City], [State], [Country], [ZipCode], [Customer_Name]) VALUES (3, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', N'adfdsaf', NULL, N'dljf', N'adfas', NULL, N'india', N'12458', NULL)
INSERT [atul].[tblShippingAddress] ([Id], [UserId], [AddressLine], [AddressLine2], [Landmark], [City], [State], [Country], [ZipCode], [Customer_Name]) VALUES (4, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', N'Vijay Nagar', NULL, N'Ram Mandir', N'Indore', NULL, N'India', N'452001', NULL)
SET IDENTITY_INSERT [atul].[tblShippingAddress] OFF
GO
SET IDENTITY_INSERT [atul].[tblSubCategory] ON 

INSERT [atul].[tblSubCategory] ([Id], [CategoryId], [SubCategoryName], [IsDeleted]) VALUES (1, 8, N'Computer', NULL)
INSERT [atul].[tblSubCategory] ([Id], [CategoryId], [SubCategoryName], [IsDeleted]) VALUES (2, 8, N'Home Appliances', NULL)
INSERT [atul].[tblSubCategory] ([Id], [CategoryId], [SubCategoryName], [IsDeleted]) VALUES (3, 7, N'Cars', NULL)
INSERT [atul].[tblSubCategory] ([Id], [CategoryId], [SubCategoryName], [IsDeleted]) VALUES (4, 7, N'KGF', 1)
SET IDENTITY_INSERT [atul].[tblSubCategory] OFF
GO
SET IDENTITY_INSERT [atul].[tblTickets] ON 

INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'1', N'1234569870', N'Rajkumar', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (2, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'2', N'1121569870', N'Arun kumar', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (3, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'3', N'1161109870', N'Varun', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (4, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'4', N'1134569870', N'Divya', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (5, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'5', N'1100025870', N'Mahesh', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (6, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'6', N'1142569870', N'Kanha', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (7, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'7', N'1114569870', N'Krishna', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (8, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'8', N'1553569870', N'Sohan', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (9, CAST(N'2021-10-20T11:36:17.527' AS DateTime), N'9', N'1111569870', N'Mohan', 0, N'Your ticket number generated successfully and interted in DB', -1, CAST(N'2021-10-20T11:36:17.527' AS DateTime), 1)
INSERT [atul].[tblTickets] ([Ticket_ID], [Date_Entered], [Account_Number], [Phone_Number], [Customer_Name], [Selected], [Description], [Createdby], [CreatedDate], [IsActive]) VALUES (10, CAST(N'2021-10-21T22:38:09.530' AS DateTime), N'1', N'dddd', N'Rajkumar', 0, N'Your ticket number generated successfully', -1, CAST(N'2021-10-21T22:38:09.530' AS DateTime), 1)
SET IDENTITY_INSERT [atul].[tblTickets] OFF
GO
SET IDENTITY_INSERT [atul].[tblTransaction] ON 

INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (1, N'MQYVJ7P8DFZD4', 4, 1, N'eb8e3cc2-6400-4e34-adb7-bf2fd94fa3ce', CAST(N'2021-04-05T21:04:20.310' AS DateTime))
INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (2, N'MQYVJ7P8DFZD4', 4, 1, N'eb8e3cc2-6400-4e34-adb7-bf2fd94fa3ce', CAST(N'2021-04-05T21:06:06.533' AS DateTime))
INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (3, N'MQYVJ7P8DFZD4', 2, 5, N'd8632558-4c11-4f6b-b84b-6f93630c01db', CAST(N'2021-04-17T16:40:34.560' AS DateTime))
INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (4, N'MQYVJ7P8DFZD4', 5, 5, N'4bdb8354-3be4-4d7b-b4e4-833b4cc83e20', CAST(N'2021-05-01T21:07:23.197' AS DateTime))
INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (5, N'MQYVJ7P8DFZD4', 6, 5, N'8e881bb0-bce7-4ddb-866a-2e295858dc97', CAST(N'2021-05-11T16:18:44.413' AS DateTime))
INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (6, N'MQYVJ7P8DFZD4', 8, 15, N'e9cad799-58bb-4cbc-b3ba-fb5522bef8dc', CAST(N'2021-05-15T14:44:51.857' AS DateTime))
INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (7, N'MQYVJ7P8DFZD4', 12, 1, N'0149b8df-9387-4e4d-a9fa-125f63e356d0', CAST(N'2021-05-17T19:41:44.867' AS DateTime))
INSERT [atul].[tblTransaction] ([Id], [TransactionId], [CartId], [Price], [Guid], [TransactionDate]) VALUES (8, N'MQYVJ7P8DFZD4', 13, 1, N'93b5808c-c7a1-474a-9ccc-0b86fd9f6f06', CAST(N'2021-05-25T18:38:01.950' AS DateTime))
SET IDENTITY_INSERT [atul].[tblTransaction] OFF
GO
SET IDENTITY_INSERT [atul].[tblWishList] ON 

INSERT [atul].[tblWishList] ([Id], [UserName], [ProductId], [InCart]) VALUES (10, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', 8, 1)
INSERT [atul].[tblWishList] ([Id], [UserName], [ProductId], [InCart]) VALUES (14, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', 10, 1)
INSERT [atul].[tblWishList] ([Id], [UserName], [ProductId], [InCart]) VALUES (15, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', 2, 1)
INSERT [atul].[tblWishList] ([Id], [UserName], [ProductId], [InCart]) VALUES (16, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', 2, 1)
INSERT [atul].[tblWishList] ([Id], [UserName], [ProductId], [InCart]) VALUES (17, N'3b4a28cf-af9f-4e66-a4e4-ad63f9e0467e', 3, 1)
INSERT [atul].[tblWishList] ([Id], [UserName], [ProductId], [InCart]) VALUES (19, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', 3, 1)
INSERT [atul].[tblWishList] ([Id], [UserName], [ProductId], [InCart]) VALUES (20, N'c2a6ffef-f07f-42f6-a21d-d03bbd88c472', 10, 0)
SET IDENTITY_INSERT [atul].[tblWishList] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [atul].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaimsIdentity_RoleId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaimsIdentity_RoleId] ON [atul].[AspNetRoleClaimsIdentity]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [atul].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [atul].[AspNetRolesIdentity]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [atul].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaimsIdentity_UserId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaimsIdentity_UserId] ON [atul].[AspNetUserClaimsIdentity]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [atul].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLoginsIdentity_UserId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLoginsIdentity_UserId] ON [atul].[AspNetUserLoginsIdentity]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [atul].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRolesIdentity_RoleId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRolesIdentity_RoleId] ON [atul].[AspNetUserRolesIdentity]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [atul].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [atul].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [atul].[AspNetUsersIdentity]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [atul].[AspNetUsersIdentity]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TblProduct_CategoryId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_TblProduct_CategoryId] ON [atul].[TblProduct]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblSubCategory_CategoryId]    Script Date: 3/3/2022 4:50:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblSubCategory_CategoryId] ON [atul].[tblSubCategory]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [atul].[tblTickets] ADD  DEFAULT (getdate()) FOR [Date_Entered]
GO
ALTER TABLE [atul].[tblTickets] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [atul].[tblTickets] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [atul].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [atul].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [atul].[AspNetRoleClaimsIdentity]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaimsIdentity_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [atul].[AspNetRolesIdentity] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetRoleClaimsIdentity] CHECK CONSTRAINT [FK_AspNetRoleClaimsIdentity_AspNetRoles_RoleId]
GO
ALTER TABLE [atul].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [atul].[AspNetUserClaimsIdentity]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaimsIdentity_AspNetUsersIdentity_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsersIdentity] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserClaimsIdentity] CHECK CONSTRAINT [FK_AspNetUserClaimsIdentity_AspNetUsersIdentity_UserId]
GO
ALTER TABLE [atul].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [atul].[AspNetUserLoginsIdentity]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLoginsIdentity_AspNetUsersIdentity_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsersIdentity] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserLoginsIdentity] CHECK CONSTRAINT [FK_AspNetUserLoginsIdentity_AspNetUsersIdentity_UserId]
GO
ALTER TABLE [atul].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [atul].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [atul].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [atul].[AspNetUserRolesIdentity]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRolesIdentity_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [atul].[AspNetRolesIdentity] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserRolesIdentity] CHECK CONSTRAINT [FK_AspNetUserRolesIdentity_AspNetRoles_RoleId]
GO
ALTER TABLE [atul].[AspNetUserRolesIdentity]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRolesIdentity_AspNetUsersIdentity_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsersIdentity] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserRolesIdentity] CHECK CONSTRAINT [FK_AspNetUserRolesIdentity_AspNetUsersIdentity_UserId]
GO
ALTER TABLE [atul].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [atul].[AspNetUserTokensIdentity]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokensIdentity_AspNetUsersIdentity_UserId] FOREIGN KEY([UserId])
REFERENCES [atul].[AspNetUsersIdentity] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [atul].[AspNetUserTokensIdentity] CHECK CONSTRAINT [FK_AspNetUserTokensIdentity_AspNetUsersIdentity_UserId]
GO
ALTER TABLE [atul].[TblProduct]  WITH CHECK ADD  CONSTRAINT [FK_TblProduct_TblCategory] FOREIGN KEY([CategoryId])
REFERENCES [atul].[TblCategory] ([Id])
GO
ALTER TABLE [atul].[TblProduct] CHECK CONSTRAINT [FK_TblProduct_TblCategory]
GO
ALTER TABLE [atul].[tblSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblSubCategory_TblCategory] FOREIGN KEY([CategoryId])
REFERENCES [atul].[TblCategory] ([Id])
GO
ALTER TABLE [atul].[tblSubCategory] CHECK CONSTRAINT [FK_tblSubCategory_TblCategory]
GO
/****** Object:  StoredProcedure [atul].[SpCancelTicketByIds]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [atul].[SpCancelTicketByIds]
@Ids Nvarchar(200)=''
As
Exec('Update tblTickets Set Selected=0 where Ticket_Id in ('+@Ids+')')
GO
/****** Object:  StoredProcedure [atul].[SpGetTicketDetail]    Script Date: 3/3/2022 4:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [atul].[SpGetTicketDetail]
As

Select * from tblTickets
GO
USE [master]
GO
ALTER DATABASE [eCommerceSystem] SET  READ_WRITE 
GO
