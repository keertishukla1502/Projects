USE [master]
GO
/****** Object:  Database [delete2]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE DATABASE [delete2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'delete2_data', FILENAME = N'D:\SQL_2012\delete2_data.mdf' , SIZE = 5184KB , MAXSIZE = 4194304KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'delete2_log', FILENAME = N'D:\SQL_2012\delete2_log.ldf' , SIZE = 1024KB , MAXSIZE = 4194304KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [delete2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [delete2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [delete2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [delete2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [delete2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [delete2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [delete2] SET ARITHABORT OFF 
GO
ALTER DATABASE [delete2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [delete2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [delete2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [delete2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [delete2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [delete2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [delete2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [delete2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [delete2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [delete2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [delete2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [delete2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [delete2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [delete2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [delete2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [delete2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [delete2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [delete2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [delete2] SET  MULTI_USER 
GO
ALTER DATABASE [delete2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [delete2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [delete2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [delete2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'delete2', N'ON'
GO
USE [delete2]
GO
/****** Object:  User [Atul]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE USER [Atul] FOR LOGIN [Atul] WITH DEFAULT_SCHEMA=[Atul]
GO
ALTER ROLE [db_owner] ADD MEMBER [Atul]
GO
/****** Object:  Schema [Atul]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE SCHEMA [Atul]
GO
/****** Object:  UserDefinedTableType [Atul].[IdNameTable]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE TYPE [Atul].[IdNameTable] AS TABLE(
	[options] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [Atul].[OptionTable]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE TYPE [Atul].[OptionTable] AS TABLE(
	[options] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [Atul].[OptionTable1]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE TYPE [Atul].[OptionTable1] AS TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[options] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [Atul].[RTableType]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE TYPE [Atul].[RTableType] AS TABLE(
	[id] [int] NULL,
	[NAME] [varchar](1) NULL
)
GO
/****** Object:  UserDefinedTableType [Atul].[TableType]    Script Date: 3/3/2022 5:56:02 PM ******/
CREATE TYPE [Atul].[TableType] AS TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](1) NULL
)
GO
/****** Object:  UserDefinedFunction [Atul].[CallProcInFunction]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  Create Function [Atul].[CallProcInFunction](@Celcius real)
  returns real
  as
  begin
      Execute Proc_HelloWorld 1
	  return  @Celcius*1.8+32
  end
GO
/****** Object:  UserDefinedFunction [Atul].[HelloWorldFunction]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Function [Atul].[HelloWorldFunction](@Celcius real)
  returns real
  as
  begin
      Execute Proc_HelloWorld 1
	  return  @Celcius*1.8+32
  end
GO
/****** Object:  UserDefinedFunction [Atul].[split_string]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [Atul].[split_string]
(
    @in_string VARCHAR(MAX),
    @delimeter VARCHAR(1)
)

RETURNS @list TABLE(Id int NOT NULL identity(1,1),tuple VARCHAR(100))
AS
BEGIN
        WHILE LEN(@in_string) > 0
        BEGIN
            INSERT INTO @list(tuple)
            SELECT left(@in_string, charindex(@delimeter, @in_string+',') -1) as tuple
    
            SET @in_string = stuff(@in_string, 1, charindex(@delimeter, @in_string + @delimeter), '')
        end
    RETURN 

END
GO
/****** Object:  UserDefinedFunction [dbo].[procedureinsidefunction]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE FUNCTION [dbo].[procedureinsidefunction]()
RETURNS varchar(22)
AS 
BEGIN
	execute Proc_HelloWorld
	Declare @hellovar varchar(22)=', welcome to sqlshack'
	RETURN  @hellovar 
END
GO
/****** Object:  Table [Atul].[__EFMigrationsHistoryOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[__EFMigrationsHistoryOLD1](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[AnswerTableOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[AnswerTableOLD1](
	[QuestionId] [int] NOT NULL,
	[Answer] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[AspNetRolesOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[AspNetRolesOLD1](
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
/****** Object:  Table [Atul].[AspNetUserClaimsOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[AspNetUserClaimsOLD1](
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
/****** Object:  Table [Atul].[AspNetUserLoginssOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[AspNetUserLoginssOLD1](
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
/****** Object:  Table [Atul].[AspNetUserRolesOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[AspNetUserRolesOLD1](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[AspNetUsersOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[AspNetUsersOLD1](
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
	[FirstName] [nchar](100) NULL,
	[LastName] [nchar](100) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[AspNetUserTokensOLD1]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[AspNetUserTokensOLD1](
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
/****** Object:  Table [Atul].[Books]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [varchar](50) NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Cities]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[city]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[city](
	[Cityid] [int] IDENTITY(1,1) NOT NULL,
	[Cityname] [varchar](100) NULL,
	[Sid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Class]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[age] [nvarchar](max) NULL,
	[mobileno] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Countries]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[country]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[country](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[Cname] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[EmployeeDetails]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[EmployeeDetails](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](64) NULL,
	[EmpAge] [int] NULL,
	[DOB] [date] NULL,
	[EmpSal] [numeric](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Employees]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Age] [int] NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Emptable]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Emptable](
	[Empid] [int] IDENTITY(1,1) NOT NULL,
	[Empname] [nvarchar](max) NULL,
	[Department] [nvarchar](max) NULL,
	[Salary] [int] NOT NULL,
 CONSTRAINT [PK_Emptable] PRIMARY KEY CLUSTERED 
(
	[Empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[GuestResponses]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[GuestResponses](
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Phone] [nvarchar](15) NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Age] [int] NULL,
	[WillAttend] [nvarchar](5) NULL,
 CONSTRAINT [PK_Email_GuestResponses] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Movie]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Movie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](60) NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[Genre] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Movies]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[Genre] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[MyProfile]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[MyProfile](
	[Profile_Id] [int] IDENTITY(101,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email_Id] [varchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Profile_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[OmCustomer]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[OmCustomer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_OmCustomer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[OnlineExam]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[OnlineExam](
	[QId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](max) NOT NULL,
	[option1] [varchar](50) NOT NULL,
	[option2] [varchar](50) NOT NULL,
	[option3] [varchar](50) NOT NULL,
	[option4] [varchar](50) NOT NULL,
	[CorrectAnswer] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[OptionTable]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[OptionTable](
	[QuestionId] [int] NOT NULL,
	[Options] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[P_Category]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[P_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Categoryname] [nvarchar](500) NULL,
 CONSTRAINT [PK_P_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Product_Test_Audit]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Product_Test_Audit](
	[PrdId] [int] NULL,
	[PrdName] [varchar](50) NULL,
	[Audit_Action] [varchar](100) NULL,
	[Audit_TimeStamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Productinfo]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Productinfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productSKU] [nvarchar](50) NULL,
	[title] [nvarchar](500) NULL,
	[Pprice] [decimal](18, 2) NULL,
	[Rprice] [decimal](18, 2) NULL,
	[brand] [nvarchar](50) NULL,
	[manufacturer] [nvarchar](500) NULL,
	[category] [nvarchar](50) NULL,
	[length] [nvarchar](50) NULL,
	[width] [nvarchar](50) NULL,
	[height] [nvarchar](50) NULL,
	[qty] [int] NULL,
 CONSTRAINT [PK_Productinfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[s]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[s](
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
/****** Object:  Table [Atul].[state]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[state](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[Sname] [varchar](100) NULL,
	[Cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[States]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[States](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[student123]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[student123](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sname] [varchar](30) NULL,
	[aaddress] [varchar](50) NULL,
	[studid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Students]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[StudentTbl]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[StudentTbl](
	[StudId] [int] IDENTITY(1,1) NOT NULL,
	[StudName] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[RollNo] [int] NULL,
	[Address] [nvarchar](500) NULL,
	[DistrictName] [nvarchar](50) NULL,
	[StateName] [nvarchar](50) NULL,
	[CollegeName] [nvarchar](200) NULL,
	[Stream] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentTbl] PRIMARY KEY CLUSTERED 
(
	[StudId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_City]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_City](
	[Id] [int] NULL,
	[CityName] [nvarchar](50) NULL,
	[StateId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_Country]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_Country](
	[Id] [int] NOT NULL,
	[CountryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_OnlineExam]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_OnlineExam](
	[QId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](500) NOT NULL,
	[Option1] [nvarchar](100) NOT NULL,
	[Option2] [nvarchar](100) NOT NULL,
	[Option3] [nvarchar](100) NOT NULL,
	[Option4] [nvarchar](100) NOT NULL,
	[Answer] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_Register]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_Register](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[MailId] [varchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Register] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_State]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_State](
	[Id] [int] NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_tbl_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_States]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_States](
	[Id] [int] NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_tbl_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_UserDetails]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_UserDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Gender] [varchar](1) NULL,
	[Country] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[City] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tbl_Videos]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tbl_Videos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullPath] [nvarchar](max) NULL,
	[Title] [nvarchar](500) NULL,
	[Describtion] [nvarchar](500) NULL,
	[Name] [nvarchar](50) NULL,
	[Extention] [nvarchar](50) NULL,
	[UploadedBy] [nvarchar](50) NULL,
	[UploadedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tbl_Videos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Atul].[TblCategory]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[TblCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblDepartment]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblEmployee]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblProduct]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblProduct](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NULL,
	[SubCat] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Price] [int] NULL,
	[InStoke] [bit] NULL,
	[ShowPublic] [bit] NULL,
	[Isdeleted] [bit] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblProductDetail]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblProductDetail](
	[ProductId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Brand] [varchar](100) NULL,
	[Status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblProductMaster]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblProductMaster](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[TblRoles]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[TblRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblSubCat]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblSubCat](
	[SubCatID] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NULL,
	[SubCatName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSubCat] PRIMARY KEY CLUSTERED 
(
	[SubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblUser]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Salary] [int] NULL,
	[DeptName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[tblUsers]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[tblUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Atul].[Units]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Atul].[Units](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/3/2022 5:56:02 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/3/2022 5:56:02 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/3/2022 5:56:02 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/3/2022 5:56:02 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/3/2022 5:56:02 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/3/2022 5:56:02 PM ******/
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
/****** Object:  Table [dbo].[category]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryId] [int] NULL,
	[categoryName] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Addres] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Password] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[SecurityAnwser] [nvarchar](50) NULL,
	[Gender] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestResponses]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestResponses](
	[Email] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[WillAttend] [bit] NULL,
 CONSTRAINT [PK_dbo.GuestResponses] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentReg]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentReg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subcategories]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subcategories](
	[subcatId] [int] NULL,
	[Fk_CatId] [int] NULL,
	[Subcategoryname] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Brand]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MemberRole]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MemberRole](
	[MemberRoleID] [int] IDENTITY(1,1) NOT NULL,
	[memberId] [int] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FristName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[EmailId] [varchar](200) NULL,
	[Password] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](500) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ProductImage] [varchar](max) NULL,
	[IsFeatured] [bit] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[ProductImage2] [varchar](max) NULL,
	[ProductImage3] [varchar](max) NULL,
	[BrandId] [int] NULL,
	[SubCategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[Adress] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [int] NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SlideImage]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SlideImage](
	[SlideId] [int] IDENTITY(1,1) NOT NULL,
	[SlideTitle] [varchar](500) NULL,
	[SlideImage] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SubCategory]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[SubCategoryName] [varchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Atul].[View_GetProductDetail]    Script Date: 3/3/2022 5:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  Create View [Atul].[View_GetProductDetail]
  AS
  Select PrdMst.ProductId,PrdMst.ProductName, PrdDtl.Price,PrdDtl.Brand,PrdDtl.Status as IsActive
  from tblProductMaster as PrdMst
  inner join tblProductDetail PrdDtl on PrdMst.ProductId=PrdDtl.ProductId
GO
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20211008072520_Initial', N'5.0.10')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20211122073802_InitialCreate', N'3.1.21')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20211123120456_InitialCreate', N'3.1.21')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20211124094731_InitialCreate', N'3.1.1')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20211124114348_InitialCreate', N'3.1.1')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20211124120413_InitialCreate', N'3.1.21')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20211126101537_InitialCreate', N'3.1.21')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20220117124534_Startemptable', N'5.0.13')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20220118092358_InitialDBSetup', N'5.0.7')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20220119102239_InitialCreate', N'5.0.12')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20220124102109_changetablename', N'5.0.13')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20220124102429_AddIdentitySupport', N'5.0.13')
INSERT [Atul].[__EFMigrationsHistoryOLD1] ([MigrationId], [ProductVersion]) VALUES (N'20220124103156_AddIdentitySupport', N'5.0.13')
GO
INSERT [Atul].[AnswerTableOLD1] ([QuestionId], [Answer]) VALUES (1, N'N. Modi')
INSERT [Atul].[AnswerTableOLD1] ([QuestionId], [Answer]) VALUES (2, N'Mumbai')
INSERT [Atul].[AnswerTableOLD1] ([QuestionId], [Answer]) VALUES (3, N'Sachin Tendulker')
GO
INSERT [Atul].[AspNetRolesOLD1] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3567af85-cc0c-40df-8e4f-570f8f7e50f2', N'Admin', N'ADMIN', N'7b0e2daf-113b-4468-9d57-d485b8250e38')
INSERT [Atul].[AspNetRolesOLD1] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd31de357-3591-4174-912c-b32114de18a2', N'User', N'USER', N'5bcc56af-76de-464d-a74f-5e7441758289')
GO
INSERT [Atul].[AspNetUserRolesOLD1] ([UserId], [RoleId]) VALUES (N'25677d73-cafc-4af4-b75a-5716e6b33385', N'3567af85-cc0c-40df-8e4f-570f8f7e50f2')
INSERT [Atul].[AspNetUserRolesOLD1] ([UserId], [RoleId]) VALUES (N'5bd11e7e-f367-459f-abf2-73cacb1c76e2', N'3567af85-cc0c-40df-8e4f-570f8f7e50f2')
INSERT [Atul].[AspNetUserRolesOLD1] ([UserId], [RoleId]) VALUES (N'3e8f686e-c2bf-4e09-98c4-20e95179920d', N'd31de357-3591-4174-912c-b32114de18a2')
INSERT [Atul].[AspNetUserRolesOLD1] ([UserId], [RoleId]) VALUES (N'c84cacd0-51e4-4ec8-84a8-c4a941016c86', N'd31de357-3591-4174-912c-b32114de18a2')
GO
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'000d912e-1614-4355-91b1-199f4c216cd0', N'test1@gmail.com', N'TEST1@GMAIL.COM', N'test1@gmail.com', N'TEST1@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEACwu9qYta41yIDN4/c7Vwa7fs5RcRACk7K2vcVSUB4vLsAQ6I5v848a7ZqTJCgEzg==', N'Y46CDXFT4VNKG733JVPBOHZGESMSNGJK', N'9032dfa3-4cd3-453e-b90f-fe6c01e769b1', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'0076617b-01fe-4b21-9446-72f6dfb3200c', N'shravil@gmail.com', N'SHRAVIL@GMAIL.COM', N'shravil@gmail.com', N'SHRAVIL@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEQVp6EC3XVm83+d9J4IJxRkBHQszZm4tYbvVXtNxmLiTxmE/6iRPLKKO9oL7poUFQ==', N'27ZZYO2WMTTHT7GJASJJWDDBU53URCBX', N'393c5120-eb7b-43cc-97ed-242d0730e464', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'0a1b0717-d0a2-44ca-8e20-2d3778e187b4', N'TestUse6@mail.com', N'TESTUSE6@MAIL.COM', N'TestUse6@mail.com', N'TESTUSE6@MAIL.COM', 0, N'AQAAAAEAACcQAAAAEOd2SPI37I1IJhEl+ZrCKXtyfbeJod2mqB1GbOmfZGyDIv1rNfH6Do4IzuTQkGvDQQ==', N'BIVW4UG3DMO4PD7PVHLSR2KQR6D2XYJS', N'b6523a32-c7ae-4087-8199-06baea0c287d', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'101e1dfd-e97e-477f-8ecb-8858796fc174', N'cis@gmail.com', N'CIS@GMAIL.COM', N'cis@gmail.com', N'CIS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOEoKDCJ31txo1IUSCDu6CMrPHS+72BjRrBb8JnFV26PrR8ilCPkxIeJ3rQUQrpXOA==', N'NUIEHATDP7XOHKNMLA2UKOUBTORZLIFQ', N'65dbd2c9-9533-4da0-8a56-91743acb2c6f', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'126e6b4f-4957-47e9-87bf-5d4927722266', N'm@gmail.com', N'M@GMAIL.COM', N'm@gmail.com', N'M@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEISvler/pvhfOUfXlwdQxl6jg/k0UPsLE5n07/Pmvo/UpegNettcrxaDe0wOfgdr0g==', N'TUWHTJL3UR3XYQUUV5FPV55VZGFNDFNN', N'23035f72-2c6e-4a57-8263-c9a92a1d238d', NULL, 0, 0, NULL, 1, 0, N'Mithun                                                                                              ', N'Verma                                                                                               ')
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'25677d73-cafc-4af4-b75a-5716e6b33385', N'TestUser@mail.com', N'TESTUSER@MAIL.COM', N'TestUser@mail.com', N'TESTUSER@MAIL.COM', 1, N'AQAAAAEAACcQAAAAEMMvYilIZ8jtz/0Wum95Epm6LHo3ZMWB3lLSBCs5LW4AuqP8SQi8ZBjQucoLFVPWOA==', N'ZNTJOAMOX772T2FADV766L7GAH7CQ6YL', N'78e4a8a4-95d2-4a92-ab98-05619dbdd361', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'3e8f686e-c2bf-4e09-98c4-20e95179920d', N'TestUser2@mail.com', N'TESTUSER2@MAIL.COM', N'TestUser2@mail.com', N'TESTUSER2@MAIL.COM', 1, N'AQAAAAEAACcQAAAAEK8p7ovkXmjvzItrznRvZ5BNENEUhDeR9yJoU7Nh54JccaiZwKIGeu1uukWwkAKaZg==', N'BQJPQ5R4QP3XD7TKS24NOMHOIO5WKACA', N'e41171d9-a9aa-4d5e-bda8-37cc0d3f99f5', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'59365dd3-644a-4d26-9142-d97f113c08aa', N'TestUse5@mail.com', N'TESTUSE5@MAIL.COM', N'TestUse5@mail.com', N'TESTUSE5@MAIL.COM', 0, N'AQAAAAEAACcQAAAAEMzk0hnuWAOSbmpYFve3JKtkyF2UlFmionCiQFC6nW7O8F9FamZbsbE9ct0QxryyKA==', N'6FZBDOUTU53WV7YT35DRCLF3UV5WZY4A', N'25de8ecd-474e-4a09-8976-acee846d0943', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'5bd11e7e-f367-459f-abf2-73cacb1c76e2', N'Admin@mail.com', N'ADMIN@MAIL.COM', N'Admin@mail.com', N'ADMIN@MAIL.COM', 1, N'AQAAAAEAACcQAAAAEESuu4zQt1LvXaEtDxf+4rvppy55oZ2lqH2Ar/U5o61+RAduhJbqrp9FT39NOPUg7w==', N'SE6A5OYDSZURN6FJT3RWPMYYEXWD525Y', N'b776ea7e-3a2c-4be0-b915-f395fbda4807', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'61c4b9fb-de8b-426f-9de6-c3172e59ee18', N'j@gmail.com', N'J@GMAIL.COM', N'j@gmail.com', N'J@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPzmAsjijQEvE68I15JVmVYTgPDxRe/xy6zoL5L+88YvPTPTg9gthlkOKES4efC9nQ==', N'NWABTP44HFLU7W4DHOZYZ5G4RH55WIVY', N'30f142d1-e705-453e-ba16-39ebcaab860b', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'6387cc0f-a415-4c2c-81e8-2a4055c64946', N'Keerti@gmail.com', N'KEERTI@GMAIL.COM', N'Keerti@gmail.com', N'KEERTI@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJ/d4rQHg014BLFNNajgqcXehWoCCwPCix4i9B8gB0O46rziUPat7/BkUUXHyZk0ag==', N'LFCH6UZYD65USQ4RX4D5HZBDDO2RXK35', N'83011666-8d17-4931-9bb1-e757347f4cf2', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'6f59d4b3-c5d8-48e4-a767-594f1364c526', N'harry@gmail.com', N'HARRY@GMAIL.COM', N'harry@gmail.com', N'HARRY@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFetqZ6LuyYxCeufuXd+s5Hmvsnai5Rq7C+BSUg3HYZts+S8crRjuyxU9Y2bdO3KxA==', N'YBIMHIZ5QEBBZE6WA2WN6ZJ3V6KACKRL', N'c5b8502c-5b5e-4d12-ba40-c699c8531b27', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'7494e991-e8ab-4ff6-ba05-e7f176ace40f', N'testm4', N'TESTM4', N'testm4@gmail.com', N'TESTM4@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKbRwek9i0sGgmaOUqLhVsgNlFCnFw+h+2pO/rNs0v28C0u2twa8IhYrdxvh9W1gig==', N'APFG3QXUC2TIBPOUCKRCI27ULKY3GGKE', N'7111c50c-45c3-413f-83a9-c9c9fcaa5519', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'7b00d424-bf78-4643-8ea2-b21cf90cf589', N'Shubham@gmail.com', N'SHUBHAM@GMAIL.COM', N'Shubham@gmail.com', N'SHUBHAM@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECap3KQX7tF6AIPugua5/k4+TECaGhKREEY7NTvKHUhg4XuZU51fKsjKQDT8HggkEA==', N'RFELBQ2Q5TAFMAMGQYWXLQ4DX5AO2ZWS', N'e7463bc0-99f9-4d1e-a6aa-1e2987645bb8', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'7d0a2f6f-802c-4940-81df-7fa9793c68b5', N'testm3', N'TESTM3', N'testm3@gmail.com', N'TESTM3@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEITtmEXCTPfEUxD9CakYABsOwAvOoLqj2JNYspR4MNnZyZheRkilNvxCrEkBFytmpQ==', N'DZDPJHSNOXIXHGJ22K4D3VJD6DLA2U7F', N'4b8398af-7cae-40e5-9eec-a5080a9938a9', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'9bfe64d9-8a34-477a-928c-f81964dacc6f', N'alex@gmail.com', N'ALEX@GMAIL.COM', N'alex@gmail.com', N'ALEX@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPn06YLBRcdM0nh1QEnRJqtBjaL/dq48JYZ12Up8hRgiR/3HRjOHlmleTKBtFy5nkg==', N'PHZAABU7GEIWFAS24ULLBNJYOX3IJ7J6', N'53528a51-2f35-4afc-81cb-02ebd8c33976', NULL, 0, 0, NULL, 1, 0, N'Alex                                                                                                ', N'Carry                                                                                               ')
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'a6f1aac4-a572-49ab-9659-6b4607f52228', N'testm1', N'TESTM1', N'testm1@gmail.com', N'TESTM1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEG4nVRbGcOVty7aBrSQTJWmX0GlXpqZQg350j5j2dbwSCHGAaF07OY1nqHqQBC362w==', N'FMBKXHLTELTU55ZR4X2PFRERTS4ZU5EW', N'e33cb3cf-9351-4c15-9f04-dcd455679005', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'c84cacd0-51e4-4ec8-84a8-c4a941016c86', N'TestUser3@mail.com', N'TESTUSER3@MAIL.COM', N'TestUser3@mail.com', N'TESTUSER3@MAIL.COM', 1, N'AQAAAAEAACcQAAAAEKtDZXiCdzAXlm4nNKrL3gnYHbRfiomeMIsDUCQSAVxztiwDdq12KZu+RYgbPSjX3w==', N'C6D3FTNHVBW37KANGGQV23IJUHOJUGFA', N'471855ab-de8e-4a6f-9d14-6042d06428ef', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'dbccb8ad-6829-4015-93d5-18cc5e388209', N's@gmail.com', N'S@GMAIL.COM', N's@gmail.com', N'S@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEFKKKkXtEJED8UaNOaqLQb6UgMse8Yveaphwxy8x/DYyG0+8lCCg7v9dlVwdAZWYPQ==', N'AWEBYGJ5RPEYFIPSD4EGQGJHARYCBSEQ', N'f2b6dcf9-d0e9-43f4-bf5f-43bd37feb68a', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'dd309229-c73e-4e8c-8096-0cc2cdd63b0b', N'waris@gmail.com', N'WARIS@GMAIL.COM', N'waris@gmail.com', N'WARIS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHOjj3QetFQA4pEbjTUO7zX6eKjYdCeSGUEYOocFGgMmyI2sStvGmRe/foqKJBHK7Q==', N'TGDA4C45P4BEJE7SAK2VFUUNNJDO53U7', N'9d67d1a1-a9aa-4586-874f-8f2e373b77c0', NULL, 0, 0, NULL, 1, 0, N'Waris                                                                                               ', N'Khan                                                                                                ')
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'e1f5cd00-5f67-4056-9415-1150706875c3', N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHw7/+alzIiGn6LStjCYjKa41oOLLMCDgGdv9hWdNen4qyiTgFO7Lcx0NK3Mav5HBQ==', N'7XNZ37AW43JAGLOHQ2NM5GPHZNFHQ3IN', N'bbe08809-5779-416b-9bdc-754875767130', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [Atul].[AspNetUsersOLD1] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'e8898343-1af3-4f77-883d-d5ddc9c7868b', N'shrav@gmail.com', N'SHRAV@GMAIL.COM', N'shrav@gmail.com', N'SHRAV@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENgxgX0opeoPLqLo2kWKJE42BjmAcYNfUSOWzswFb+WQhhsr8j99s4+ikT9XDhZh1Q==', N'APXH3XBEBXVJMKECVRYTIJNCV3X2Y6AL', N'0ebe1454-d715-4426-b987-3e6e72eb2f39', NULL, 0, 0, NULL, 1, 0, N'Shravil                                                                                             ', N'Bhagwat                                                                                             ')
GO
SET IDENTITY_INSERT [Atul].[Books] ON 

INSERT [Atul].[Books] ([BookId], [AuthorName], [price]) VALUES (1, N'man', 12)
INSERT [Atul].[Books] ([BookId], [AuthorName], [price]) VALUES (2, N'naman', 123)
SET IDENTITY_INSERT [Atul].[Books] OFF
GO
SET IDENTITY_INSERT [Atul].[city] ON 

INSERT [Atul].[city] ([Cityid], [Cityname], [Sid]) VALUES (1, N'Panna', 1)
INSERT [Atul].[city] ([Cityid], [Cityname], [Sid]) VALUES (2, N'Nyk', 2)
SET IDENTITY_INSERT [Atul].[city] OFF
GO
SET IDENTITY_INSERT [Atul].[Countries] ON 

INSERT [Atul].[Countries] ([CountryId], [CountryName]) VALUES (1, N'India')
INSERT [Atul].[Countries] ([CountryId], [CountryName]) VALUES (2, N'Pakistan')
INSERT [Atul].[Countries] ([CountryId], [CountryName]) VALUES (3, N'Usa')
INSERT [Atul].[Countries] ([CountryId], [CountryName]) VALUES (4, N'Brazil')
SET IDENTITY_INSERT [Atul].[Countries] OFF
GO
SET IDENTITY_INSERT [Atul].[country] ON 

INSERT [Atul].[country] ([Cid], [Cname]) VALUES (1, N'India')
INSERT [Atul].[country] ([Cid], [Cname]) VALUES (2, N'Usa')
SET IDENTITY_INSERT [Atul].[country] OFF
GO
SET IDENTITY_INSERT [Atul].[EmployeeDetails] ON 

INSERT [Atul].[EmployeeDetails] ([EmployeeId], [EmpName], [EmpAge], [DOB], [EmpSal]) VALUES (1, N'Raj', 27, CAST(N'1993-12-11' AS Date), CAST(15000.00 AS Numeric(9, 2)))
INSERT [Atul].[EmployeeDetails] ([EmployeeId], [EmpName], [EmpAge], [DOB], [EmpSal]) VALUES (2, N'Navin', 25, CAST(N'1995-12-11' AS Date), CAST(20000.00 AS Numeric(9, 2)))
SET IDENTITY_INSERT [Atul].[EmployeeDetails] OFF
GO
SET IDENTITY_INSERT [Atul].[Emptable] ON 

INSERT [Atul].[Emptable] ([Empid], [Empname], [Department], [Salary]) VALUES (4, N'Shubham', N'Devops', 60000)
SET IDENTITY_INSERT [Atul].[Emptable] OFF
GO
SET IDENTITY_INSERT [Atul].[Movie] ON 

INSERT [Atul].[Movie] ([Id], [Title], [ReleaseDate], [Genre], [Price]) VALUES (4, N'sures', CAST(N'1959-04-15T00:00:00.0000000' AS DateTime2), N'Western', CAST(3.99 AS Decimal(18, 2)))
INSERT [Atul].[Movie] ([Id], [Title], [ReleaseDate], [Genre], [Price]) VALUES (5, N'3 idiots', CAST(N'2021-11-05T00:00:00.0000000' AS DateTime2), N'comedy', CAST(78.00 AS Decimal(18, 2)))
INSERT [Atul].[Movie] ([Id], [Title], [ReleaseDate], [Genre], [Price]) VALUES (6, N'ssss', CAST(N'2021-11-09T00:00:00.0000000' AS DateTime2), N'ss', CAST(23.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [Atul].[Movie] OFF
GO
SET IDENTITY_INSERT [Atul].[Movies] ON 

INSERT [Atul].[Movies] ([Id], [Title], [ReleaseDate], [Genre], [Price]) VALUES (6, N'RHTDM', CAST(N'2022-01-03T00:00:00.0000000' AS DateTime2), N'romantic', CAST(70.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [Atul].[Movies] OFF
GO
SET IDENTITY_INSERT [Atul].[OmCustomer] ON 

INSERT [Atul].[OmCustomer] ([ID], [Name], [Mobile], [Address], [Email]) VALUES (3, N'omprakash', N'9713823148', N'Indore MP', N'opm@gmail.com')
SET IDENTITY_INSERT [Atul].[OmCustomer] OFF
GO
SET IDENTITY_INSERT [Atul].[OnlineExam] ON 

INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (14, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'This is Test')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (1, N'What is the Capital of Bangladesh', N'Delhi', N'Mumbai', N'Jaipur', N'Dhaka', N'Dhaka')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (2, N'What is the Capital of China', N'Delhi', N'Bejing', N'Jaipur', N'Dhaka', N'Bejing')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (15, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'Washington , DC')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (16, N'What is the Capital of the Russia ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'Moscow')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (17, N'What is the Capital of the Russia ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'Moscow')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (20, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'New York', N'Moscow')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (3, N'What is the Capital of Pakistan', N'Delhi', N'Bejing', N'Islamabad', N'Dhaka', N'Islamabad')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (4, N'What is the cleanest city of India', N'Delhi', N'Bejing', N'Indore', N'Dhaka', N'Indore')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (5, N'Which Country have more Nuclear Power station all around the world', N'Delhi', N'America', N'China', N'Russia', N'Russia')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (1, N'What is the Capital of the Russia ?', N'Bejing', N'Moscow', N'Delhi', N'New York', N'Moscow')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (8, N'What is the Capital of the USA ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'Washington , DC')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (1, N'This is Test', N'Bejing', N'Moscow', N'fvbnm', N'This is Test', N'Washington , DC')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (6, N'qwertyui', N'Bejing', N'Moscow', N'fvbnm', N'Washington , DC', N'cvbnm,')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (2, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'Tokyo', N'Tokyo')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (5, N'qwertyui', N'cvbnm', N'Moscow', N'Delhi', N'New York', N'Washington , DC')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (6, N'qwertyui', N'This is Test', N'dfvbnm,', N'Delhi', N'Tokyo', N'This is Test')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (1, N'qwertyui', N'cvbnm', N'Moscow', N'Delhi', N'fvbhnm', N'This is Test')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (6, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'Tokyo', N'Tokyo')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (7, N'a', N'b', N'c', N'd', N'e', N' e')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (8, N'a', N'b', N'c', N'd', N'e', N'f')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (9, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'New York', N'Moscow')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (10, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'Tokyo')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (11, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'This is Test', N'Tokyo')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (12, N'This is Test', N'cvbnm', N'dfvbnm,', N'fvbnm', N'fvbhnm', N'This is Test')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (13, N'What is the Capital of the Japan ?', N'Bejing', N'Moscow', N'Delhi', N'Tokyo', N'Moscow')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (18, N'What is the Capital of the Russia ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'Washington , DC')
INSERT [Atul].[OnlineExam] ([QId], [Question], [option1], [option2], [option3], [option4], [CorrectAnswer]) VALUES (19, N'What is the Capital of the Russia ?', N'Bejing', N'Moscow', N'Delhi', N'Washington , DC', N'Washington , DC')
SET IDENTITY_INSERT [Atul].[OnlineExam] OFF
GO
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (1, N'LK Advani')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (1, N'Manmohan singh')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (1, N'Sachin Tendulker')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (1, N'N. Modi')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (2, N'Delhi')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (2, N'Mumbai')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (2, N'Kolkata')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (3, N'Ricky Pointing')
INSERT [Atul].[OptionTable] ([QuestionId], [Options]) VALUES (3, N'Sachin Tendulker')
GO
SET IDENTITY_INSERT [Atul].[P_Category] ON 

INSERT [Atul].[P_Category] ([id], [Categoryname]) VALUES (1, N'Electronic')
INSERT [Atul].[P_Category] ([id], [Categoryname]) VALUES (2, N'Cloths')
INSERT [Atul].[P_Category] ([id], [Categoryname]) VALUES (3, N'Shoes')
SET IDENTITY_INSERT [Atul].[P_Category] OFF
GO
INSERT [Atul].[Product_Test_Audit] ([PrdId], [PrdName], [Audit_Action], [Audit_TimeStamp]) VALUES (6, N'Mobile', N'Inserted Record -- After Insert Trigger.', CAST(N'2021-11-29T18:53:48.690' AS DateTime))
INSERT [Atul].[Product_Test_Audit] ([PrdId], [PrdName], [Audit_Action], [Audit_TimeStamp]) VALUES (7, N'Head Phones', N'Inserted Record -- After Insert Trigger.', CAST(N'2021-11-30T11:03:34.197' AS DateTime))
INSERT [Atul].[Product_Test_Audit] ([PrdId], [PrdName], [Audit_Action], [Audit_TimeStamp]) VALUES (1, N'Pencil', N'Inserted Record -- After Insert Trigger.', CAST(N'2021-11-30T12:08:04.840' AS DateTime))
GO
SET IDENTITY_INSERT [Atul].[Productinfo] ON 

INSERT [Atul].[Productinfo] ([id], [productSKU], [title], [Pprice], [Rprice], [brand], [manufacturer], [category], [length], [width], [height], [qty]) VALUES (2, N'Test1', N'Title1', CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'A', N'man', N'3', N'10L', N'20W', N'30H', 55)
INSERT [Atul].[Productinfo] ([id], [productSKU], [title], [Pprice], [Rprice], [brand], [manufacturer], [category], [length], [width], [height], [qty]) VALUES (4, N'SKU4', N'F1', CAST(24.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)), N'Test Brand', N'Aditya Birla', N'2', N'88', N'99', N'44', 90)
INSERT [Atul].[Productinfo] ([id], [productSKU], [title], [Pprice], [Rprice], [brand], [manufacturer], [category], [length], [width], [height], [qty]) VALUES (5, N'SKU5', N'Title1', CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Test Brand', N'Aditya Birla', N'1', N'10L', N'99', N'44', 8552)
SET IDENTITY_INSERT [Atul].[Productinfo] OFF
GO
SET IDENTITY_INSERT [Atul].[state] ON 

INSERT [Atul].[state] ([Sid], [Sname], [Cid]) VALUES (1, N'MadhyaPradesh', 1)
INSERT [Atul].[state] ([Sid], [Sname], [Cid]) VALUES (2, N'Texas', 2)
SET IDENTITY_INSERT [Atul].[state] OFF
GO
SET IDENTITY_INSERT [Atul].[States] ON 

INSERT [Atul].[States] ([StateId], [CountryId], [StateName]) VALUES (1, 1, N'MP')
INSERT [Atul].[States] ([StateId], [CountryId], [StateName]) VALUES (2, 2, N'Sindh')
INSERT [Atul].[States] ([StateId], [CountryId], [StateName]) VALUES (3, 3, N'Texas')
INSERT [Atul].[States] ([StateId], [CountryId], [StateName]) VALUES (4, 4, N'saint of Mania')
SET IDENTITY_INSERT [Atul].[States] OFF
GO
SET IDENTITY_INSERT [Atul].[student123] ON 

INSERT [Atul].[student123] ([sid], [sname], [aaddress], [studid]) VALUES (1, N'naman', N'kishore ganj ', 2)
INSERT [Atul].[student123] ([sid], [sname], [aaddress], [studid]) VALUES (2, N'rahi', N'badnawar', 3)
INSERT [Atul].[student123] ([sid], [sname], [aaddress], [studid]) VALUES (3, N'soumya', N'panna', 5)
INSERT [Atul].[student123] ([sid], [sname], [aaddress], [studid]) VALUES (4, N'ayush', N'indore', 8)
SET IDENTITY_INSERT [Atul].[student123] OFF
GO
SET IDENTITY_INSERT [Atul].[Students] ON 

INSERT [Atul].[Students] ([id], [name]) VALUES (1, N'Mahesh')
SET IDENTITY_INSERT [Atul].[Students] OFF
GO
INSERT [Atul].[tbl_Country] ([Id], [CountryName]) VALUES (1, N'India')
GO
SET IDENTITY_INSERT [Atul].[tbl_OnlineExam] ON 

INSERT [Atul].[tbl_OnlineExam] ([QId], [Question], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1, N'Who is the Prime minister of India', N'LK Advani', N'Manmohan singh', N'Sachin Tendulker', N'N. Modi', N'N. Modi')
INSERT [Atul].[tbl_OnlineExam] ([QId], [Question], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (2, N'Capital City of Maharashtra', N'Delhi', N'Mumbai', N'Kolkata', N'Hariyana', N'Mumbai')
INSERT [Atul].[tbl_OnlineExam] ([QId], [Question], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (3, N'What is the capital of U.S.A', N'Newyork', N'Texas', N'Washington', N'Florida', N'Washington')
SET IDENTITY_INSERT [Atul].[tbl_OnlineExam] OFF
GO
INSERT [Atul].[tbl_Register] ([Id], [FirstName], [LastName], [Gender], [MailId], [CountryId], [StateId], [CityId]) VALUES (1, N'Rahul', N'Gangurde', 1, N'test11@gmail.com', 1, 1, 1)
INSERT [Atul].[tbl_Register] ([Id], [FirstName], [LastName], [Gender], [MailId], [CountryId], [StateId], [CityId]) VALUES (2, N'test', N'dsdsa', 1, N'te@gai.com', 0, 0, 0)
GO
INSERT [Atul].[tbl_States] ([Id], [StateName], [CountryId]) VALUES (1, N'MH', 1)
GO
SET IDENTITY_INSERT [Atul].[tbl_UserDetails] ON 

INSERT [Atul].[tbl_UserDetails] ([id], [FirstName], [LastName], [Gender], [Country], [State], [City]) VALUES (1, N'jatin', N'verma', N'M', N'America', N'California', N'California2')
INSERT [Atul].[tbl_UserDetails] ([id], [FirstName], [LastName], [Gender], [Country], [State], [City]) VALUES (2, N'arpan', N'sharma', N'M', N'India', N'Madhya Pradesh', N'Indore')
SET IDENTITY_INSERT [Atul].[tbl_UserDetails] OFF
GO
SET IDENTITY_INSERT [Atul].[tbl_Videos] ON 

INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (1, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111191641201910.mp4', N'test title', N'test desc', N'file_example_MP4_640_3MG.mp4', N'mp4', N'', CAST(N'2021-11-19T16:41:39.427' AS DateTime), 0)
INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (2, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111191651540058.mp4', N'test', N'this is a sample videos', N'file_example_MP4_1280_10MG.mp4', N'mp4', N'', CAST(N'2021-11-19T16:51:53.953' AS DateTime), 0)
INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (3, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111231413399850.mp4', N'Wild life sample videos', N'this is Wild life sample videos ', N'SampleVideo_1280x720_5mb.mp4', N'mp4', N'', CAST(N'2021-11-23T14:13:39.810' AS DateTime), 0)
INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (4, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111231449383297.mp4', N'this is  title', N'this id description of videos', N'SampleVideo_1280x720_5mb.mp4', N'mp4', N'', CAST(N'2021-11-23T14:49:38.187' AS DateTime), 0)
INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (5, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111231615402554.mp4', N'Video4', N'this is video4', N'file_example_MP4_640_3MG.mp4', N'mp4', N'', CAST(N'2021-11-23T16:15:39.987' AS DateTime), 0)
INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (6, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111231617036992.mp4', N'Video5', N'this is video5', N'SampleVideo_1280x720_5mb.mp4', N'mp4', N'', CAST(N'2021-11-23T16:17:03.420' AS DateTime), 0)
INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (7, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111241147220297.mp4', N'This is videos 7', N'This is videos 7 describtion', N'file_example_MP4_640_3MG.mp4', N'mp4', N'', CAST(N'2021-11-24T11:47:21.860' AS DateTime), 0)
INSERT [Atul].[tbl_Videos] ([Id], [FullPath], [Title], [Describtion], [Name], [Extention], [UploadedBy], [UploadedOn], [IsDeleted]) VALUES (8, N'E:\MithunVerma\React\VideoCrud2\wwwroot\202111241147341490.mp4', N'This is videos 8', N'This is videos 8 describtion', N'file_example_MP4_640_3MG.mp4', N'mp4', N'', CAST(N'2021-11-24T11:47:33.987' AS DateTime), 0)
SET IDENTITY_INSERT [Atul].[tbl_Videos] OFF
GO
SET IDENTITY_INSERT [Atul].[TblCategory] ON 

INSERT [Atul].[TblCategory] ([id], [CategoryName]) VALUES (1, N'Cat1')
INSERT [Atul].[TblCategory] ([id], [CategoryName]) VALUES (2, N'Cat2')
SET IDENTITY_INSERT [Atul].[TblCategory] OFF
GO
SET IDENTITY_INSERT [Atul].[tblDepartment] ON 

INSERT [Atul].[tblDepartment] ([Id], [DepartmentName]) VALUES (1, N'IT')
INSERT [Atul].[tblDepartment] ([Id], [DepartmentName]) VALUES (2, N'HR')
INSERT [Atul].[tblDepartment] ([Id], [DepartmentName]) VALUES (3, N'Development')
INSERT [Atul].[tblDepartment] ([Id], [DepartmentName]) VALUES (4, N'Account')
SET IDENTITY_INSERT [Atul].[tblDepartment] OFF
GO
SET IDENTITY_INSERT [Atul].[tblEmployee] ON 

INSERT [Atul].[tblEmployee] ([Id], [Name], [Designation], [Salary]) VALUES (1, N'Kanta Malviya', N'SE', 14)
INSERT [Atul].[tblEmployee] ([Id], [Name], [Designation], [Salary]) VALUES (4, N'Nikhi', N'SE', 26)
INSERT [Atul].[tblEmployee] ([Id], [Name], [Designation], [Salary]) VALUES (5, N'Priyanka', N'SE', 53)
INSERT [Atul].[tblEmployee] ([Id], [Name], [Designation], [Salary]) VALUES (8, N'Priyanka M', N'SE', 18)
SET IDENTITY_INSERT [Atul].[tblEmployee] OFF
GO
INSERT [Atul].[tblProductDetail] ([ProductId], [Price], [Brand], [Status]) VALUES (1, CAST(12 AS Decimal(18, 0)), N'Cello', N'A')
INSERT [Atul].[tblProductDetail] ([ProductId], [Price], [Brand], [Status]) VALUES (2, CAST(60 AS Decimal(18, 0)), N'Nutraj', N'A')
INSERT [Atul].[tblProductDetail] ([ProductId], [Price], [Brand], [Status]) VALUES (3, CAST(10 AS Decimal(18, 0)), N'Cello', N'A')
INSERT [Atul].[tblProductDetail] ([ProductId], [Price], [Brand], [Status]) VALUES (4, CAST(50 AS Decimal(18, 0)), N'Anand', N'A')
INSERT [Atul].[tblProductDetail] ([ProductId], [Price], [Brand], [Status]) VALUES (5, CAST(3 AS Decimal(18, 0)), N'Cello', N'A')
GO
SET IDENTITY_INSERT [Atul].[tblProductMaster] ON 

INSERT [Atul].[tblProductMaster] ([ProductId], [ProductName]) VALUES (1, N'Pencil')
INSERT [Atul].[tblProductMaster] ([ProductId], [ProductName]) VALUES (2, N'Color')
INSERT [Atul].[tblProductMaster] ([ProductId], [ProductName]) VALUES (3, N'Pen')
INSERT [Atul].[tblProductMaster] ([ProductId], [ProductName]) VALUES (4, N'Note Book')
INSERT [Atul].[tblProductMaster] ([ProductId], [ProductName]) VALUES (5, N'Scale')
INSERT [Atul].[tblProductMaster] ([ProductId], [ProductName]) VALUES (6, N'Mobile')
INSERT [Atul].[tblProductMaster] ([ProductId], [ProductName]) VALUES (7, N'Head Phones')
SET IDENTITY_INSERT [Atul].[tblProductMaster] OFF
GO
SET IDENTITY_INSERT [Atul].[TblRoles] ON 

INSERT [Atul].[TblRoles] ([ID], [UserId], [RoleName]) VALUES (1, 1, N'Admin')
INSERT [Atul].[TblRoles] ([ID], [UserId], [RoleName]) VALUES (2, 1, N'User')
INSERT [Atul].[TblRoles] ([ID], [UserId], [RoleName]) VALUES (3, 1, N'Customer')
INSERT [Atul].[TblRoles] ([ID], [UserId], [RoleName]) VALUES (4, 2, N'Customer')
INSERT [Atul].[TblRoles] ([ID], [UserId], [RoleName]) VALUES (5, 3, N'User')
INSERT [Atul].[TblRoles] ([ID], [UserId], [RoleName]) VALUES (6, 4, N'Admin')
SET IDENTITY_INSERT [Atul].[TblRoles] OFF
GO
SET IDENTITY_INSERT [Atul].[tblUser] ON 

INSERT [Atul].[tblUser] ([Id], [Name], [Gender], [Salary], [DeptName], [Email], [Password], [PhoneNumber], [Address]) VALUES (12, N'Keerti', N'female', 1295600, N'IT', N'Keertish@gmail.com', N'Keerti@123', N'9691871943', N'Rewa2')
INSERT [Atul].[tblUser] ([Id], [Name], [Gender], [Salary], [DeptName], [Email], [Password], [PhoneNumber], [Address]) VALUES (13, N'Keertishukla', N'female', 300000, N'HR', N'Keertishukla@gmail.com', NULL, N'9691871943', N'Rewa')
INSERT [Atul].[tblUser] ([Id], [Name], [Gender], [Salary], [DeptName], [Email], [Password], [PhoneNumber], [Address]) VALUES (14, N'KShukla', N'Select Gender', 13000, NULL, N'KSss@gmail.com', NULL, N'123456789', N'REWA')
INSERT [Atul].[tblUser] ([Id], [Name], [Gender], [Salary], [DeptName], [Email], [Password], [PhoneNumber], [Address]) VALUES (15, N'Keertishukla', NULL, 12900, N'IT', N'Keertishukla123@gmail.com', NULL, N'9691871943', N'jantacollage')
INSERT [Atul].[tblUser] ([Id], [Name], [Gender], [Salary], [DeptName], [Email], [Password], [PhoneNumber], [Address]) VALUES (17, N'Bharat', N'male', 34436, N'IT', N'Bharat@gmail.com', N'Bhart@123', N'2246876999', N'Indore')
SET IDENTITY_INSERT [Atul].[tblUser] OFF
GO
SET IDENTITY_INSERT [Atul].[tblUsers] ON 

INSERT [Atul].[tblUsers] ([Id], [UserName], [Password]) VALUES (1, N'Kanta', N'Km@123')
INSERT [Atul].[tblUsers] ([Id], [UserName], [Password]) VALUES (2, N'Rama', N'Rm@123')
INSERT [Atul].[tblUsers] ([Id], [UserName], [Password]) VALUES (3, N'Neha', N'Na@123')
INSERT [Atul].[tblUsers] ([Id], [UserName], [Password]) VALUES (4, N'Sahil', N'Sa@123')
SET IDENTITY_INSERT [Atul].[tblUsers] OFF
GO
SET IDENTITY_INSERT [Atul].[Units] ON 

INSERT [Atul].[Units] ([Id], [Name], [Description]) VALUES (1, N'pcs', N'Pieces')
INSERT [Atul].[Units] ([Id], [Name], [Description]) VALUES (3, N'Pair', N'PAIRS')
INSERT [Atul].[Units] ([Id], [Name], [Description]) VALUES (4, N'2 pcs Set', N'Set of 2 Pieces')
SET IDENTITY_INSERT [Atul].[Units] OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108111230468_InitialCreate', N'PartyInviteMVC5WebApp.Models.Delete2DBContext', 0x1F8B0800000000000400CD58DB6EDB46107D2FD07F20F8D4008ED696512035A804B26407462DDB301DE779458EA445F6C2729782F46D7DE827F5173ACBFB45A225BB6D02BD88B333672E9C393BD2DF7FFEE57DDA08EEAC21D64CC9917B3638751D90810A995C8EDCC42CDE7F703F7DFCF927EF2A141BE7B9D03BB77A6829F5C85D19135D10A2831508AA078205B1D26A6106811284868A0C4F4F7F2367670410C2452CC7F11E13699880F4011F274A06109984F2990A81EB5C8E277E8AEADC51013AA2018CDC071A9BED8D5C3303B3E7C9AF5F613E8EA24166E73A63CE28C6E4035FB80E9552196A30E28B2F1A7C132BB9F4231450FEB48D00F516946BC833B9A8D40F4DEA746893229561011524DA287124E0D9795E25D2367F55ADDDB28A58C72BACB7D9DAACD35A8EDCCF0968F3884555D256A0EDF162C263ABDD5FEF4103E5C4D9A97B52B60D7697FD9C3893849B24869184C4C494A36132E72CF81DB64FEA1BC8914C38AF878F09E0594380A2875845800E1F619127752528E3AE439AA6A46D5B5A36CDB27CB14DB0F75D674637B7209766855331FCE03AD76C036121C9FBE68B64382A6864E2041FEF306C3AE7509E935EB7D72CD6C67EED718D5F0F72DDEFE996FE4F8E1E564AFEF75EC6CBD2C78D34E7C3A32BFF95713E36066458E05C2AC581CAA6A147AAB1E90E139296A14C429C834E818381E1F4D21EC0C6EC182A64A17CAE749E6933CC0CD807B36B4891DDAA70328A1BB4A67857F0659815A9928C550BF6257BE8D79BD128C23758A3E35CE2F819174FDEFBC75393C83048A0773054196DE9C9A8982EA1758AAE31D27480A6D4D039B5D94F42D151EBBC943D052FDCEDAC7B9B78AAD75098D9EFF9041C4C976DD8AABCD798B10069D2E4A18CB14DDA1DFBF4BEA49CC6BBF96DA27822640F53F661D4C8AA8E53131F8E55D1511DAA921E8E94F34D1D26171D8E91B2491D21151C6E5F27933A4C5DDE45F348EB65B79B8C74BAAC75ABB57BB76FF6DB2AA5F792035AB3EEE573F7F23ED619C44CC575B04C6B16DA21F4B7DA8018588581FF079F7086F9560A332AD9021B3BBBFB5D5C8486AD45EEC759AA88D6213F66B3FA4E5B8C5CD33858D1B8BBC7BC754929907F1174F3AE0EF79A45E44D608D65E34D48B58582D9CE7CF33A3167A63F86E3568BEE6577C4DEF0F2DA904DECC80DE70A13C8426EAF1EAF5C2DBA34E291FA8F3F6F0A9A2D2B08FB53504260E7B3022D746EE44215A5C764EB11152AAD3733034343ACD938366C410383C701689DAEA5CF9427E9D8CC21BC91F789891233D61AC49C6FEBF97AA4DF7FBA3F3563F6EE23FBA4FF8D14304C8629C0BDBC4C180FCBB8AFBB9DB90FC2B6CF674079CA7BB89623DC725B22DD752ECC7D4079F9A61061AF23873F81883882E97BE9D335BC26365C896F6149836D711BEC0779F94534CBEE4D195DC654E81CA3B2B77F6810FB8FC6C77F0020D5DB5703110000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202109161451166_InitialCreate', N'LoginPageMVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7D383AC954B77B127B0B7489DE49CA09B0BD6D9C5795BD012ED082B51AA44A5098AFEB23EF427F52F9CA144C9E24D175BB19DA240118BC36F86C32167381CEE5F7FFC39FEF1290CAC479CA47E4426F6D1E8D0B6307123CF27CB899DD1C59BF7F68F1FBEFBC7F8C20B9FAC2F25DD09A3839E249DD80F94C6A78E93BA0F3844E928F4DD244AA3051DB951E8202F728E0F0FFFED1C1D3918206CC0B2ACF1A78C503FC4F90FF8398D888B639AA1E03AF27090F2EFD032CB51AD1B14E234462E9ED81FA3A54FEED0125F7F998E0A72DB3A0B7C04A2CC70B0B02D4448441105414F3FA7784693882C67317C40C1FD738C816E818214F3019CAEC8BB8EE5F0988DC559752CA1DC2CA551D813F0E8842BC791BBAFA562BB521EA8EF02D44C9FD9A873154EEC2B0FE79F3E4501284066783A0D12463CB1AF2B1667697C83E9A8EC382A202F1380FB354ABE8DEA880756E77E0795311D8F0ED97F07D6340B6896E009C1194D507060DD65F3C0777FC6CFF7D1374C262747F3C5C9FBB7EF9077F2EE077CF2B63E52182BD0091FE0D35D12C53801D9F0A21ABF6D39623F47EE5875ABF529B402B604EBC2B6AED1D3474C96F40156CCF17BDBBAF49FB0577EE1C6F599F8B08CA0134D32F8799305019A07B86A771A79B2FF37703D7EFB6E10AE37E8D15FE6532FF1878593C0BAFA8483BC357DF0E3627909F3FD95935D2651C87E8BF655B47E9D4559E2B2C14446927B942C3115A51B3B2BE3ED64D20C6A78B32E51F7DFB499A4AA796B49D980D65909258B6DAF8652DE97E5DBD9E2CEE218262F372DA6912683D378AB91D4FDC0AA13AD8CE7A8ABF11018D4DF792FBC08911F0CB01976E00281C8C24F425C8DF2A7084C0F91DE32DFA13485BDC0FB2F4A1F1A44873F07107D86DD2C01139D5114C62FCEEDEE2122F8260BE7CCF2B7C76BB0A9B9FF35BA442E8D920BC27A6D8CF73172BF4519BD20DE39A2F833754B40F6F3DE0FBB030C22CE99EBE234BD0463C6DE348238BB04BC22F4E4B8371CDBA1761D8C4C03E487FA6844DA4BBF96A4AB88444FA1442506325D64D2246ABE957713B524358B5A50B48ACAC9FA8ACAC0BA49CA29CD82E604AD72165483C57AF90C0D1FECE5B0FB1FED6DE6BC4D7B414D8D33D821F17F30C1096C63DE1DA214276435035DF68D5D040BF9F431A62FEE9B724E5F50900DCD6AADD5906F02C3AF861C76FF5743114127D1A3EFB1A8A4C311A82406F84EF4FAD355FB9A9324DBF6721086B96DE6DBD9034CCBE52C4D23D7CF578126F9C55317A2FC10C359ED798C6234722E04060686EE3397075F606CB66C54B7E41C079862EBCC2D92835394BAC853D50803F27A08567A548D60AB9C8828DCBF149E60E938619D103B04A5B0527D42D565E113D78F51D0AA25A9674717C6C65EF1905BCE718C0963D8AA892ECCF529102640C5479A94360D8D9D9AC5351BA2216A35CD795B08BB9A772533B1159B6C899D0D76C9E3B71731CC668D6DC1389B55D24500633A6F1706CACF2A5D0D403EB8EC9B814A27268381F2906A2B062A6A6C07062AAAE4D519687144ED3AFFD27975DFCC533C286FDFAD37AA6B07B629E863CF4CB3883DA10F851E3851CDF37CCE1AF113D51CCE404E7E3E4B79A82B9B08039F612AA66C56F1AE360E759A4164236A025C195A0B28BF0854809405D543B83297D7281D8F227AC09679B74658BEF74BB0351B50B1EB17A23542F3B5A96C9C9D4E1FD5C82A6B508CBCD361A186A3310879F31207DE4129A6BCACAA982EB1709F68B836303E190D0A6A895C0D4A2A0733B8964AD36CD7922E20EB13926DA425297C3268A91CCCE05AE236DAAE244D50D0232CD84845A20B1F68B195998ECADB546D63A72894E21FC68EA1A26A7C8DE2D827CB5A8515FF62CD8AF2AAE99B59FFB2A3B0C070DC54537D54495B71A2518296586A05D620E9A59FA4F41C5134472CCF33F542854CEB5B0DDB7FC9B2EE3ED5492CFD4049CDFEAE67EFC4EB7BC1D9AAD10807B98421862CA4C9F3E81A03D077B758C91B0A50A249DD4FA3200B8939C232F72E2EF0EAFD8B2F2AC2D891E4572228455D4A9C2BEABED3CCA8AB62A859AA2298F567CA0C61D277197FD6356E8A49CD28658AAA8E624A5BED6CE64CA14CBFD992C3C4FE93D58AF0322B8BD7A6D401F8A79E18B5F20605ACD6D61D55AC40A9638A2DDD11A532933AA4D4D443CA7A31892064BD612D3C8346F514DD39A8E5237574B5B53BB2A690A40EAD695E035B23B3DCD61D55536B5207D63477C75E159EC8BBE81EFB2EE3E1657DE7551C7037F35E068C97D91287717EB57BFC3A50ED734F2C7E53AF80F1EF7B694EC653DEFAE6542436363327038679EF11AEC0C5ADA7F1DEDE8C29DC6B0BDB7BD3BDBE19AF9FD1BEA86928A73C99A4E25E9DF6A453DD989FB0DA1FD32847AE82C4B64A35826B7F4E290E478C6034FB2598063E661B7949708D88BFC0292D6A39ECE3C3A363E939CEFE3C8D71D2D40B342754D3FB1871CEB65096451E51E23EA0442D92D8E0F9C80A54C93F5F110F3F4DECDFF25EA7792A83FD957F3EB0AED2CFC4FF258386FB24C3D6EF6AD1E730E5F41D1E705482FEFE2A5E467457F9D5FFBE165D0FACDB0496D3A97528297A9DE917DF4BF492A6E8BA81346BBFA278BDAB4D78A0A0459556CBFAEF11E63E1DE42D4229E53F43F4F47D5FD1B4EF0D3642D4BC29180A6F10159ADE0CAC83657C2FE0C14F9ABF17E83758FDFB81754433BE1DF0497F30F9E540F76DA8ECB9433FA439316D634BCAF5DC5A79BD5119E6AE7D9352A0BDD142578BB07BC00D5A68BD5988F2CA0A9807739D9AFAE4C1B07769F72F5E94BC2F75C8ABA07DB7E5C7DBAC386EB853FA5B151AEF41699CA6D467F7E5C4DBB635530A78CF6B32FB150DEF99B17137BFFBD2E06D1B9B2941BCE7C6D6AB0078CF6C6D57FE73C796D6D985EEBC9C57AD4C325CE5E8B2C86DE5BA45CA1D8EFFF3088CA088288B5796FAFAB0A6DAD616862B12335373619ACC5859380A5F85A2996DBFB17287DF38584ED3CCD650CED9C49BEFFF8DBC394D336F4391E42E0A8DB5658ABAE2EF967DACA982EA3515160B2369A9636F8B591BEFE55F531DF1204A11568FE176F9F5940D0FA29221974E8F3261F5A2187C67EDDF6604FF9DFACB1504FB971A097605AF59D15C9145543A6F49A29244CAD05C638A3C70A96709F517C8A5D0CC12D0F933F13CA9C7AE41E6D8BB22B7198D330A43C6E13C10125E2C0868E29FD7428B328F6F63F62B1D620820A6CF12F7B7E4A7CC0FBC4AEE4B4D4EC800C1A20B9EEE65734959DA77F95C21DD44A42310575F1514DDE3300E002CBD2533F488D7910DCCEF235E22F77995013481B44F84A8F6F1B98F96090A538EB1EA0F3FC186BDF0E9C3FF01B7E1ACCEA2540000, N'6.2.0-61023')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'User')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'69674a83-e31a-4076-bc79-b0943efcfc45', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0a356f7f-83e2-4347-8d1d-eeb16b90e8f4', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0a356f7f-83e2-4347-8d1d-eeb16b90e8f4', N'Keertiuser@gmail.com', 0, N'AGS18IVrNfcEcYiyQvAY1hoWhooU6fEeV79Zl4FhDM8UvV4p7VGtUSNEDynmhfRcuA==', N'06ee3af4-ee46-49a8-9b5b-404152805a0d', NULL, 0, 0, NULL, 1, 0, N'Keertiuser')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0a886da1-6e5a-41b9-b2e8-6fd6e0fcebf6', N'shuklaKeerti@gmail.com', 0, N'ACfv4MCxeCWF1D4E2I5N1GrJnsVyHeBg3RvgfYWpdzAG9zKVDxANVsruUCUDQZOCsw==', N'16591bcb-1e52-4496-9db3-f21a61e21233', NULL, 0, 0, NULL, 1, 0, N'shuklaKeerti@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1b990015-8bd5-43d0-8711-e5f92241fb07', N'Shukla@Gmail.com', 0, N'123456', N'03f76908-abff-42df-bbe9-83959e43223b', NULL, 0, 0, NULL, 1, 0, N'Shukla@Gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1e7cc28d-1fd0-4f0c-9b69-2f63f4af443f', N'k@gmail.com', 0, N'AM2CcyfgEmWC2NgaaSmA3jkwARhrELbKnTYTM7YcFFKnfgYPDIPb95JFTU2TSo3x0A==', N'8fe5ef65-fb21-4f54-b480-2a95b4b5c591', NULL, 0, 0, NULL, 1, 0, N'k@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'23c366e0-46d2-4918-910b-d6764ac07d44', N'KSh@gmail.com', 0, N'AMa8LmvJ2peMCuZmdij8RUzmpJe5wzgJize/1WNtZlNqQeMJ4QoJDLIonI52I8fgTA==', N'4d900abf-48e0-44df-bef1-334105f57350', NULL, 0, 0, NULL, 1, 0, N'KSh@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2B63B8AE-515C-4B55-9297-D0E5006D4D86', N'Keert12345@gmail.com', 0, N'嚾摒왇룩눟㓢䰇㍱押쨒趵楡ؼ䖾蟛ﻤ屸玉冀퉓ꀸ䒸⿍㼟㉢贖ᗥ귙⦘', NULL, N'2345678909', 0, 0, NULL, 1, 0, N'Keert12345')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3506e6c3-faf5-4bf4-b06a-2738d909e3f7', N'Keeshukla@gmail.com', 0, N'AKHLdswkhlki4AUaK6HnQFnNL+sg3L2LdDsVbuhB4E+GEwQ0rstHwtf6H8/PuREqyw==', N'7fb1e654-92ab-4c50-8e15-3a33a194c67c', NULL, 0, 0, NULL, 1, 0, N'Keeshukla')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'464c8469-2ec4-4dcf-9538-fb6c76414600', N'Keshukla@gmail.com', 0, N'AE4+o/0tmaZBqKy9cz+l0IqLeGsoFB3qAcLLnyA5nf1pAYis5L8y3HaLIM9y5SBJKw==', N'8b3e7ede-9e47-44bd-996d-4bb36def7564', NULL, 0, 0, NULL, 1, 0, N'Keshukla')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4f6838cd-cde8-4e4f-a11b-e24a1a8fa924', N'Puja@gmail.com', 0, N'AED/Tjo3eyqa3yr7uBWcn9ErYGBahjtqah261Dx1MBono2rg98fwiFvzE4GR59VPyA==', N'3876cba4-a8ec-4f72-b918-094f9fc40a41', NULL, 0, 0, NULL, 1, 0, N'Puja')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4FCFFCBD-AE3D-4B7A-BA07-CA64A54BA436', N'Keert123@gmail.com', 0, N'㊺蝓쉫䨭落옆蚭镁ᓭ땊盈똡㏂䢵闦ឌ엋礔흾폝吔몠Ꮄ', NULL, N'2345678909', 0, 0, NULL, 1, 0, N'Keert123456')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'58ccf493-fd1e-4e7b-ab80-6b1acdd032ee', N'Keerti@gmail.com', 0, N'AOU9dH954Xu1cYOREtcq6fEZuUkEApU+0UxmrYg+yj/09XuOGPf7HEAOkcead7fZEw==', N'63496d22-90ec-464d-90ee-2be6279b5ffc', NULL, 0, 0, NULL, 1, 0, N'Keerti@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'61e70572-68f2-4e91-b951-178276e2619a', N'Kshukla123@gmail.com', 0, N'APy/r0OrNaeeQGzn0naYUv2Kf+H3g1N5/Cb92JjO4SidHzWjrzZQY2qqCIVZ+WCGBQ==', N'e8f78944-70a9-4701-a355-9fdd00b6e23d', NULL, 0, 0, NULL, 1, 0, N'Kshukla123')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'69674a83-e31a-4076-bc79-b0943efcfc45', N'Kirti@gmail.com', 0, N'ALyIzaRpI3c/eZaIdd85nT9rBEI4/3zsmQE96KPuXW1X2ZE+nOJyNqIwpjqTexvp5g==', N'8a7b2812-5b62-42a0-9ba0-496e813f25fb', NULL, 0, 0, NULL, 1, 0, N'Kirti')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7eb60a91-1602-45ba-a079-6edb94822c62', N'Keerti15@gmail.com', 0, N'AGxTwIKAofaamXw6gwbwgfJ3MTPbDtiWfmuW3kWe9HpU+9dmJMfTv3+WkAiH6ASvQw==', N'2c300acf-7677-4722-9956-62530ad1fa2c', NULL, 0, 0, NULL, 1, 0, N'Keerti15')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8043cb1f-fbd6-4973-8924-538cc658792c', N'Keerti.shukla15@gmail.com', 0, N'AIedGVZ1HE1xH4KMuXoLdPtmiXEhXsnPTtIvKPXaodbZS9KBENQUoss/z5/8OLDxfg==', N'7021a353-9cef-4795-b256-95cf677fc9e9', NULL, 0, 0, NULL, 1, 0, N'Keerti.shukla15')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'87EF20BD-E61D-4191-AAF2-C7C040439532', N'Keert@gmail.com', 0, N'꣪�햒桗驚ꦨ簜⣠퐁졡ᢶ떹뵉ుဤک쓷軏ﳪ雍៙䤜䦖ﲓ断謹䧸仪', NULL, N'2345678909', 0, 0, NULL, 1, 0, N'Keert')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'98de7949-a1e7-4b25-9499-d13e878a737c', N'Keerti123@gmail.com', 0, N'ANEsVcv/W/3m2BdR4laufZy/RJROUijzlI4xDBwoCrow9JByty7UPZmJtfRMQ2jWrA==', N'699668a1-0538-48e2-bb10-e520fb6da0d2', NULL, 0, 0, NULL, 1, 0, N'Keerti123')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bdafeb25-6cd4-4de7-9f88-39cf14e051e8', N'Keeshukla1@gmail.com', 0, N'AGavIBs3FY3dYLUxvZ7atzSfQ+dBhdlPyJeJrZrYU4k8qIRMHJbP4zUDdiC/6LmydQ==', N'077c91b5-0cad-488f-aed9-a72a33c2f86d', NULL, 0, 0, NULL, 1, 0, N'Keeshukla1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cc1c1cac-aa32-40d5-a4e3-349445fcdf51', N'shuklakeerti02@gmail.com', 0, N'AAUhgpLR47LnkgBxuAAWVWkjroj10ukOrJoWxrG+rjPqNQdQNlObZCcj4+zg2N1UsA==', N'4d8b16b3-cfa7-4c66-b25b-1c62665a5f86', NULL, 0, 0, NULL, 1, 0, N'shuklakeerti02')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'CFC45E31-A2B8-4DEB-A05F-698D08BFA56F', N'Keert12345@gmail.com', 0, N'姦穜ꮻ㜟㒺璪챤齠Ȋ陟꩑葮럖恸ﴜ캗概⟞獠㊃ѣ�癯ቈꃲ秵꬗嗕쁈', NULL, N'2345678909', 0, 0, NULL, 1, 0, N'Keert1234567')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e7d9ff3a-1024-427f-81b5-fb860bf8cb57', N'ShukKeerti@gmail.com', 0, N'AAYESp50M/K8qsf0AB1wtABuMWjX/UeD3VirJq9U/XC6jyUfYyJHaon0BEAg5xh3Og==', N'567c281b-b892-4644-8ca4-9d5f90bc0f2a', NULL, 0, 0, NULL, 1, 0, N'ShukKeerti@gmail.com')
GO
INSERT [dbo].[category] ([categoryId], [categoryName]) VALUES (1, N'Mobiles')
INSERT [dbo].[category] ([categoryId], [categoryName]) VALUES (2, N'TVs')
INSERT [dbo].[category] ([categoryId], [categoryName]) VALUES (3, N'Laptops')
GO
INSERT [dbo].[GuestResponses] ([Email], [FirstName], [LastName], [Phone], [Age], [WillAttend]) VALUES (N'shshshs@gmail.com', N'dwdw', N'sdsd', N'977112233', 25, 1)
GO
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (1, 1, N'Iphone')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (2, 1, N'Redmi')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (3, 1, N'samsung')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (4, 2, N'LG Tvs')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (5, 2, N'Sony Bravia Full HD')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (6, 2, N'TCL P6 Ultra HD LED')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (7, 3, N'HP')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (8, 3, N'Dell')
INSERT [dbo].[subcategories] ([subcatId], [Fk_CatId], [Subcategoryname]) VALUES (9, 3, N'iBall ')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Brand] ON 

INSERT [dbo].[Tbl_Brand] ([BrandId], [BrandName], [IsActive], [IsDelete]) VALUES (1, N'Allen Solly', 1, 0)
INSERT [dbo].[Tbl_Brand] ([BrandId], [BrandName], [IsActive], [IsDelete]) VALUES (2, N'Lakme', 1, 0)
INSERT [dbo].[Tbl_Brand] ([BrandId], [BrandName], [IsActive], [IsDelete]) VALUES (3, N' Royal Enfield', 1, 0)
INSERT [dbo].[Tbl_Brand] ([BrandId], [BrandName], [IsActive], [IsDelete]) VALUES (4, N'Micromax', 1, 0)
INSERT [dbo].[Tbl_Brand] ([BrandId], [BrandName], [IsActive], [IsDelete]) VALUES (5, N'Apple', 1, 0)
SET IDENTITY_INSERT [dbo].[Tbl_Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] ON 

INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (1, N'Electronic', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (2, N'Groceries', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (4, N'Clothes', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (1002, N'Books', 1, 0)
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (1003, N'Sports', 1, 0)
SET IDENTITY_INSERT [dbo].[Tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON 

INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price], [ProductImage2], [ProductImage3], [BrandId], [SubCategoryId]) VALUES (1, N'Nokia', 1, 1, 0, CAST(N'2021-06-10T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(2000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price], [ProductImage2], [ProductImage3], [BrandId], [SubCategoryId]) VALUES (2, N'samsung ', 1, 1, 0, CAST(N'2021-08-14T00:00:00.000' AS DateTime), NULL, NULL, 0, 4, CAST(4000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price], [ProductImage2], [ProductImage3], [BrandId], [SubCategoryId]) VALUES (3, N'Jacket', 4, 1, NULL, CAST(N'2021-10-06T17:46:11.647' AS DateTime), NULL, N'clothes.jpg', 1, 2, CAST(200 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [ProductImage], [IsFeatured], [Quantity], [Price], [ProductImage2], [ProductImage3], [BrandId], [SubCategoryId]) VALUES (1002, N'Novels', 1002, 1, NULL, CAST(N'2021-10-07T13:07:43.853' AS DateTime), NULL, N'Book.jpg', 1, 5, CAST(100 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_SubCategory] ON 

INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (1, 1, N'Mobile', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (2, 1, N'Laptop', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (3, 1, N'PenDrive', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (4, 4, N'T-Shirtd', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (5, 4, N'Jeans', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (6, 4, N'FormalWear', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (7, 1002, N'Novels', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (8, 1002, N'Academics', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (9, 1003, N'Cricket', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (10, 1003, N'football', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (11, 2, N'Turmeric powder', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (12, 2, N'Rice', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (13, 2, N'Maida ', 1, 0)
INSERT [dbo].[Tbl_SubCategory] ([SubCategoryId], [CategoryId], [SubCategoryName], [IsActive], [IsDelete]) VALUES (14, 2, N'chilli ', 1, 0)
SET IDENTITY_INSERT [dbo].[Tbl_SubCategory] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [Atul].[AspNetRolesOLD1]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [Atul].[AspNetUserClaimsOLD1]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [Atul].[AspNetUserLoginssOLD1]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [Atul].[AspNetUserRolesOLD1]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [Atul].[AspNetUsersOLD1]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [Atul].[AspNetUsersOLD1]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [Atul].[s]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/3/2022 5:56:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Bran__2206CE9B38EE3749]    Script Date: 3/3/2022 5:56:03 PM ******/
ALTER TABLE [dbo].[Tbl_Brand] ADD UNIQUE NONCLUSTERED 
(
	[BrandName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Cate__8517B2E07E8D53F1]    Script Date: 3/3/2022 5:56:03 PM ******/
ALTER TABLE [dbo].[Tbl_Category] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Memb__7449F39922C1467E]    Script Date: 3/3/2022 5:56:03 PM ******/
ALTER TABLE [dbo].[Tbl_Members] ADD UNIQUE NONCLUSTERED 
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Memb__7ED91ACEEF1E2266]    Script Date: 3/3/2022 5:56:03 PM ******/
ALTER TABLE [dbo].[Tbl_Members] ADD UNIQUE NONCLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_Prod__DD5A978A7EF0424F]    Script Date: 3/3/2022 5:56:03 PM ******/
ALTER TABLE [dbo].[Tbl_Product] ADD UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tbl_SubC__0BBDA28BDB47A92F]    Script Date: 3/3/2022 5:56:03 PM ******/
ALTER TABLE [dbo].[Tbl_SubCategory] ADD UNIQUE NONCLUSTERED 
(
	[SubCategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Atul].[AspNetUserClaimsOLD1]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Atul].[AspNetUsersOLD1] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Atul].[AspNetUserClaimsOLD1] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [Atul].[AspNetUserLoginssOLD1]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Atul].[AspNetUsersOLD1] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Atul].[AspNetUserLoginssOLD1] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [Atul].[AspNetUserRolesOLD1]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Atul].[AspNetRolesOLD1] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Atul].[AspNetUserRolesOLD1] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [Atul].[AspNetUserRolesOLD1]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Atul].[AspNetUsersOLD1] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Atul].[AspNetUserRolesOLD1] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [Atul].[AspNetUserTokensOLD1]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Atul].[AspNetUsersOLD1] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Atul].[AspNetUserTokensOLD1] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [Atul].[Cities]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [Atul].[States] ([StateId])
GO
ALTER TABLE [Atul].[city]  WITH CHECK ADD FOREIGN KEY([Sid])
REFERENCES [Atul].[state] ([Sid])
GO
ALTER TABLE [Atul].[s]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Atul].[AspNetRolesOLD1] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Atul].[s] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [Atul].[state]  WITH CHECK ADD FOREIGN KEY([Cid])
REFERENCES [Atul].[country] ([Cid])
GO
ALTER TABLE [Atul].[States]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [Atul].[Countries] ([CountryId])
GO
ALTER TABLE [Atul].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_TblCategory] FOREIGN KEY([CatID])
REFERENCES [Atul].[TblCategory] ([id])
GO
ALTER TABLE [Atul].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_TblCategory]
GO
ALTER TABLE [Atul].[tblProductDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [Atul].[tblProductMaster] ([ProductId])
GO
ALTER TABLE [Atul].[TblRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [Atul].[tblUsers] ([Id])
GO
ALTER TABLE [Atul].[tblSubCat]  WITH CHECK ADD  CONSTRAINT [FK_tblSubCat_tblSubCat] FOREIGN KEY([SubCatID])
REFERENCES [Atul].[tblSubCat] ([SubCatID])
GO
ALTER TABLE [Atul].[tblSubCat] CHECK CONSTRAINT [FK_tblSubCat_tblSubCat]
GO
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
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Tbl_Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[Tbl_SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Tbl_Members] ([MemberId])
GO
ALTER TABLE [dbo].[Tbl_SubCategory]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
/****** Object:  StoredProcedure [Atul].[AddOrEdit]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[AddOrEdit]
@BookId Int,
@AuthorName Varchar(50),
@price INT
AS
BEGIN
SET NOCOUNT ON;
IF @BookId=0
BEGIN
INSERT INTO Books(AuthorName,price)
values(@AuthorName,@price)
END
ELSE
BEGIN
UPDATE Books
SET
AuthorName=@AuthorName,
price=@price
WHERE BookId=@BookId
END
END
GO
/****** Object:  StoredProcedure [Atul].[booksaddOrEdit]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[booksaddOrEdit]
@BookId Int,
@AuthorName Varchar(50),
@price INT
AS
BEGIN
SET NOCOUNT ON;
IF @BookId=0
BEGIN
INSERT INTO Books(AuthorName,price)
values(@AuthorName,@price)
END
ELSE
BEGIN
UPDATE Books
SET
AuthorName=@AuthorName,
price=@price
WHERE BookId=@BookId
END
END
GO
/****** Object:  StoredProcedure [Atul].[BooksDeleteById]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[BooksDeleteById]
@BookId INT
AS
BEGIN
SET NOCOUNT ON;
DELETE Books
WHERE BookId=@BookId
END
GO
/****** Object:  StoredProcedure [Atul].[BooksViewAll]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[BooksViewAll]
AS
BEGIN
SET NOCOUNT ON;
SELECT * FROM Books
END
GO
/****** Object:  StoredProcedure [Atul].[BooksViewById]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[BooksViewById]
@BookId INT
AS
BEGIN
SET NOCOUNT ON;
SELECT * FROM Books
WHERE BookId=@BookId
END
GO
/****** Object:  StoredProcedure [Atul].[Get_Employee]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEdure [Atul].[Get_Employee] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SELECT ID, [FirstName], [LastNmae],[Phone],ImgUrl FROM EMPLOYEE
END
GO
/****** Object:  StoredProcedure [Atul].[GetBySearch]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Atul].[GetBySearch]
	@search nvarchar(max)=null
AS
BEGIN
	SELECT *from [dbo].[Tbl_Product] P
	left join [dbo].[Tbl_Category] C on p.CategoryId=c.CategoryId
	where
	P.ProductName LIKE CASE WHEN @search is not null then  '%'+@search+'%' else P.ProductName end
	OR
	C.CategoryName LIKE CASE WHEN @search is not null then  '%'+@search+'%' else C.CategoryName end
END
GO
/****** Object:  StoredProcedure [Atul].[GetVideos]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[GetVideos]
    @Keywords VARCHAR(max)='',
    @PageIndex int,
	@PageSize int
AS
BEGIN

	SELECT [Id]
      ,[FullPath]
      ,[Title]
      ,[Describtion]
      ,[Name]
      ,[Extention]
      ,[UploadedBy]
      ,[UploadedOn]
      ,[IsDeleted]
  FROM [Atul].[tbl_Videos] where IsDeleted=0 
  ORDER BY id OFFSET (@PageIndex -1) * @PageSize ROWS FETCH NEXT @PageSize ROWS ONLY
END
GO
/****** Object:  StoredProcedure [Atul].[Insert_Emplolyee]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[Insert_Emplolyee] 
@id  bigint,
@FirstName nvarchar (100),
@LastName  nvarchar(100),
@PhoneNumber bigint,
@Email nvarchar(100),
@URL varchar(100),
@Status int output

AS
BEGIN
if exists(select 1 from Employee where ID=@id)
Begin
update employee set firstName=@FirstName,LastNmae=@LastName,Phone=@PhoneNumber,Email=@Email,ImgUrl=@URL where ID=@id
set @status=1
end
else
begin
insert into Employee (FirstName ,LastNmae,Phone,Email,imgUrl)
values(@FirstName,@LastName,@PhoneNumber,@Email,@url)
set @Status=2
end
	
END
GO
/****** Object:  StoredProcedure [Atul].[InsertUpdateEmployeeDetails]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--EXEC [InsertUpdateEmployeeDetails] 1,'Raj',27,'1993-12-11',15000
-- =============================================
CREATE PROCEDURE [Atul].[InsertUpdateEmployeeDetails]
(
@EmployeeId		int=0,
@EmpName		nvarchar(64),
@EmpAge			int,
@DOB			date,
@EmpSal			numeric(9,2),
@R_Out			INT OUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if(@EmployeeId=0)
	BEGIN
	INSERT INTO EmployeeDetails
	( EmpName
	,EmpAge
	,DOB
	,EmpSal)

	SELECT 
	 @EmpName
	,@EmpAge	
	,@DOB	
	,@EmpSal	

	SET @R_Out=1 --FOR RECORD SAVE SUCCSESSFULLY
	END
	else
	BEGIN
	UPDATE EmployeeDetails SET
	EmpName	=	@EmpName,
	EmpAge	=	@EmpAge	,
	DOB		=	@DOB	,
	EmpSal	=	@EmpSal	
	WHERE EmployeeId=@EmployeeId
	SET @R_Out=2  -- FOR RECORD UPDATED SUSSCESSFULLY 
	END
    
END
GO
/****** Object:  StoredProcedure [Atul].[Proc_HelloWorld]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE Procedure [Atul].[Proc_HelloWorld]
  @Celcius real
  AS
  Begin
   --Select @Celcius*1.8+32
   Select CONCAT(Atul.HelloWorldFunction(0),',Welcome')
  End
GO
/****** Object:  StoredProcedure [Atul].[Rproc]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Atul].[Rproc] @Rtable RTABLETYPE READONLY,
                       @id     INT
AS
  BEGIN
      SELECT *
      FROM   @Rtable
      WHERE  ID = @id
  END

GO
/****** Object:  StoredProcedure [Atul].[RprocList]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Atul].[RprocList] @Rtable TableType READONLY,
                      @Text NVARCHAR(100) ,
					@CurrectAnswer NVARCHAR(100)
AS
  BEGIN
     
      BEGIN TRY
			  BEGIN TRAN
						 DECLARE @Q_Id int;
					   INSERT INTO QuizQuestion (Text, CurrectAnswer) 
					   VALUES(@Text,@CurrectAnswer)
					   set @Q_Id=SCOPE_IDENTITY();  
	 
	                  --insert into OptionTable1 @Option; 

					  DECLARE @Listid int;
					  set @Listid=1;
						 While (@Listid <=(select Count(*) from @Rtable))
					Begin
					 
						 INSERT INTO QuizQuestionOptions (QuestionID, Options) 
					     VALUES(@Q_Id,(select NAME from @Rtable where id=@Listid))
						set @Listid=@Listid+1;
					End

					  
			 COMMIT TRANSACTION


    END TRY
    BEGIN CATCH   
	       
              ROLLBACK TRANSACTION
       END CATCH
  END

GO
/****** Object:  StoredProcedure [Atul].[sp_Getdetails]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Atul].[sp_Getdetails]
@type varchar(50) = null,
@id	int =null
as
begin
	if(@type = 'Country')
		begin
			select 0 as id, 'Select Country' as CountryName
			union
			select id,CountryName from mst_Country
		end

	if(@type = 'State')
		begin
			select 0 as id, 'Select State' as State
			union
			select id,State from mst_State
			where CountryId =  @id
		end

	if(@type = 'City')
		begin
			select 0 as id, 'Select City' as City
			union
			select id,City from mst_City
			where StateID =  @id
		end
end
GO
/****** Object:  StoredProcedure [Atul].[SP_GetProduct]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Atul].[SP_GetProduct]
@PrdId int =0,
@BrandName varchar(50)='',
@PrdCount int out
AS 
Begin
     declare @Count int;

	 Select @Count=count(*) from tblProductMaster
	--Set @Count=(Select Count(*) from tblProductMaster)

     Select @Count AS TotalProduct,
	 PrdMst.ProductId,PrdMst.ProductName,PrdDtl.Price,PrdDtl.Brand,PrdDtl.Status 
	  from tblProductMaster AS PrdMst
	 Inner join tblProductDetail AS PrdDtl
	 On PrdMst.ProductId=PrdDtl.ProductId
	 where PrdDtl.Brand=@BrandName OR
     PrdDtl.Status='A'

	 Select @PrdCount=@@RowCount
	 if(@PrdCount > 0)
	 begin
	      print 'Product Count is greater than 0'
	 end

End
GO
/****** Object:  StoredProcedure [Atul].[sp_SaveDetails]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Atul].[sp_SaveDetails] 
@FirstName varchar(100) = null
,@LastName varchar(100) = null
,@Gender varchar(100) = null
,@Country varchar(100) = null
,@State varchar(100) = null
,@City varchar(100) = null
as

begin
	if exists(select * from tbl_UserDetails where FirstName = @FirstName and LastName = @LastName)
	begin
		update tbl_UserDetails set Country =@Country, State= @State, City=@city where FirstName = @FirstName and LastName = @LastName
		select 'Details Updated...'
	end
else
	begin
		insert into tbl_UserDetails (FirstName,LastName,Gender,Country,State,City)
							values (@FirstName,@LastName,@Gender,@Country,@State,@City)
		select 'Details Saved...'
	end
end
GO
/****** Object:  StoredProcedure [Atul].[spAspNetUserRolesById]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEdure [Atul].[spAspNetUserRolesById] 
@id      varchar(100) ='0'
AS
BEGIN


 select RoleId from AspNetUserRoles where UserId = @id;


END
GO
/****** Object:  StoredProcedure [Atul].[SpChangePassword]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Atul].[SpChangePassword] 
@Email nvarchar(100),
@Password varchar(100),
@ConfirmPassword varchar(100)

AS
BEGIN
if exists(select 1 from tblUser where Email=@Email)
Begin
update tblUser set Password=@Password where Email=@Email
end	
if exists(select 1 from AspNetUsers where Email=@Email)
Begin
update AspNetUsers set PasswordHash=@ConfirmPassword where Email=@Email
end	
END



GO
/****** Object:  StoredProcedure [Atul].[spDeleteAspNetUsers]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Atul].[spDeleteAspNetUsers]
(  @ID    int)
AS
 BEGIN
            DELETE FROM tblUser
            WHERE  id = @ID
        END
GO
/****** Object:  StoredProcedure [Atul].[spInsertAspNetUsers]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Atul].[spInsertAspNetUsers]
 (
										  @ID        int=0,
                                          @Name    VARCHAR(100),
                                          @Gender    VARCHAR(100),
                                          @Salary       int,
                                          @DeptName          VARCHAR(100),
                                          @Email VARCHAR(100),
										  @Password        VARCHAR(100),
                                          @PhoneNumber        VARCHAR(100),
                                          @Address VARCHAR(100)
)
AS
BEGIN
      IF NOT EXISTS(SELECT * FROM tblUser WHERE id=@ID)
        BEGIN
            INSERT INTO tblUser
                        (Name,
                         Gender,
                         Salary,
                         DeptName,
                         Email,
						 Password,
						 PhoneNumber,
						 Address)
            VALUES     ( @Name,
                         @Gender,
                         @Salary,
                         @DeptName,
                         @Email,
						 @Password,
						 @PhoneNumber,
						 @Address)
        END
    IF EXISTS(SELECT * FROM tblUser WHERE id=@ID)
        BEGIN
            UPDATE tblUser
            SET   
						 Name=@Name,
                         Gender=@Gender,
                         Salary=@Salary,
                         DeptName=@DeptName,
                         Email=@Email,
						 Password=@Password,
						 PhoneNumber=@PhoneNumber,
						 Address=@Address
			 
            WHERE  id = @ID
        END
      
  END


GO
/****** Object:  StoredProcedure [Atul].[spLastInsetedId]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [Atul].[spLastInsetedId]
AS

BEGIN

SELECT max(QuestionID) as QuestionId from QuizQuestion

End
GO
/****** Object:  StoredProcedure [Atul].[spOnlineQuiz]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [Atul].[spOnlineQuiz]
AS
Begin
      Select * from tbl_OnlineExam
End
GO
/****** Object:  StoredProcedure [Atul].[spQuizQuestion]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEdure [Atul].[spQuizQuestion] 
AS
BEGIN


    --Create Table #MyQuiz(QuestionID int, Text nvarchar(500),CurrectAnswer nvarchar(100),Options nvarchar(100) )

	

	select QuizQuestion.QuestionID,QuizQuestion.Text,QuizQuestion.CurrectAnswer,QuizQuestionOptions.Options from QuizQuestion inner join QuizQuestionOptions ON  (QuizQuestion.QuestionID=QuizQuestionOptions.QuestionID)




END
GO
/****** Object:  StoredProcedure [Atul].[spQuizQuestionUsingId]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEdure [Atul].[spQuizQuestionUsingId] 
@id      int=0
AS
BEGIN

			  if not EXISTS (select QuestionID from QuizQuestion where QuestionID=@id)
				  begin
					while((select QuestionID from QuizQuestion where QuestionID=@id)is null)
						begin	
							set @id=@id+1;
				   end
				  
			 end
	
    --Create Table #MyQuiz(QuestionID int, Text nvarchar(500),CurrectAnswer nvarchar(100),Options nvarchar(100) )

	

	select QuizQuestion.QuestionID,QuizQuestion.Text,QuizQuestion.CurrectAnswer,QuizQuestionOptions.Options from QuizQuestion
	 inner join QuizQuestionOptions ON  (QuizQuestion.QuestionID=QuizQuestionOptions.QuestionID)
	where QuizQuestion.QuestionID=@id



END
GO
/****** Object:  StoredProcedure [Atul].[spSelectAllAspNetUsers]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Atul].[spSelectAllAspNetUsers]
AS
SELECT * FROM tblUser
GO;
GO
/****** Object:  StoredProcedure [Atul].[spSelectAllUsersByGender]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Atul].[spSelectAllUsersByGender]
(@Gender    VARCHAR(100))
AS
SELECT * FROM tblUser where Gender=@Gender;
GO
/****** Object:  StoredProcedure [Atul].[spselectByIDAspNetUsers]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Atul].[spselectByIDAspNetUsers]
(  @id    int)
AS
 BEGIN
            select *from  tblUser
            WHERE  id = @id
        END
GO
/****** Object:  StoredProcedure [Atul].[spSelectUsersLogin]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Atul].[spSelectUsersLogin]
(@username    VARCHAR(100),
@password    VARCHAR(100))
AS
SELECT * FROM tblUser where Email=@username and Password=@password;
GO
/****** Object:  StoredProcedure [Atul].[spTransation]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--   exec [Atul].[spTransation]  'Keerti','Female',100000, 'HR', 'KeertiShukla@gmail.com','123456','9691871943','Rewa'

CREATE PROCEDURE [Atul].[spTransation]  
 (
                                          @Name    VARCHAR(100),
                                          @Gender    VARCHAR(100),
                                          @Salary       int,
                                          @DeptName          VARCHAR(100),
                                          @Email VARCHAR(100),
										  @Password        VARCHAR(100),
                                          @PhoneNumber        VARCHAR(100),
                                          @Address VARCHAR(100)
)
AS
BEGIN
  
        BEGIN TRY
			   BEGIN TRAN
			  
					BEGIN 
							INSERT INTO tblUser
										(Name,
										 Gender,
										 Salary,
										 DeptName,
										 Email,
										 Password,
										 PhoneNumber,
										 Address)
							VALUES     ( @Name,
										 @Gender,
										 @Salary,
										 @DeptName,
										 @Email,
										 @Password,
										 @PhoneNumber,
										 @Address)
                     END
					 
					 BEGIN
										DECLARE @salt UNIQUEIDENTIFIER=NEWID()
										DECLARE @Id UNIQUEIDENTIFIER=NEWID()

										 INSERT INTO AspNetUsers
										(id,UserName,
										 Email,EmailConfirmed,
										 PhoneNumber,PhoneNumberConfirmed,
										 PasswordHash,
										 TwoFactorEnabled,LockoutEnabled,AccessFailedCount)
							VALUES     ( @Id,@Name,
										 @Email,'0',
										
										 @PhoneNumber,'0',
										 PWDENCRYPT ( @Password) 
										 --HASHBYTES('SHA2_512', 'Kee@123456')
										-- HASHBYTES('SHA2_512', '123456'+CAST(@salt AS NVARCHAR(36)))
										 ,'0','1','0'
                                        )
					END
						
				 Select 'Inserted SuccessFully' as Msg 			  
              COMMIT TRANSACTION

       END TRY
       BEGIN CATCH   
	   Select 'Somthing Wrong' as ErrorMsg        
              ROLLBACK TRANSACTION
       END CATCH
      
  END
GO
/****** Object:  StoredProcedure [Atul].[spViewOrInsertEmpData]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from Employee;




CREATE procedure [Atul].[spViewOrInsertEmpData]
@mode int ,
@EmpId int = Null,
@FirstName nvarchar(Max) = null,
@LastName nvarchar(Max) =  Null,
@EmailId nvarchar(Max) = Null,
@PhoneNo Nvarchar(max) = Null,
@Salary decimal=null
AS
Begin

----------------------------For Select Eployee Data----------------------------------
      If(@mode=0)
	  begin
	        Select empId, FirstName,LastName,PhoneNumber,EmailAddress,Salary from Employee;
	  end
	  --------------------For Insert New Employee Data-----------------------------------
	  If(@mode=1)
	  begin
	        Insert into Employee(FirstName,LastName,PhoneNumber,EmailAddress,Salary)
			 Values(@FirstName,@LastName,@PhoneNo,@EmailId,@Salary);
	  end
	  --------------------------------For Get Employee By Id----------------------------
	   If(@mode=2)
	  begin
	       select empId,FirstName,LastName,PhoneNumber,Salary,EmailAddress from Employee where empId=@EmpId; 
	  end

	  ---------------------------For Update Employee Data By Id-----------------------------------
	   If(@mode=3)
	  begin
	         Update Employee set FirstName=@FirstName,LastName=@LastName,PhoneNumber=@PhoneNo,EmailAddress=@EmailId,Salary=@Salary
			 where empId=@EmpId
	  end

	   ---------------------------For Delete Employee Data By Id-----------------------------------
	   If(@mode=4)
	  begin
	         Delete from Employee where empId=@EmpId
	  end


End
GO
/****** Object:  StoredProcedure [Atul].[UploadVide]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Mithun Verma>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[UploadVide]
@FullPath nvarchar(max),
@Title nvarchar(500),
@Describtion nvarchar(500),
@Name nvarchar(50),
@Extention nvarchar(50),
@UploadedBy nvarchar(50),
@UploadedOn datetime,
@IsDeleted bit

AS
BEGIN
	INSERT INTO [Atul].[tbl_Videos]
           ([FullPath]
           ,[Title]
           ,[Describtion]
           ,[Name]
           ,[Extention]
           ,[UploadedBy]
           ,[UploadedOn]
           ,[IsDeleted])
		    VALUES(@FullPath,@Title,@Describtion,@Name,@Extention,@UploadedBy, getdate(),0)
			END
GO
/****** Object:  StoredProcedure [Atul].[UploadVideo]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Mithun Verma>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[UploadVideo]
@FullPath nvarchar(max),
@Title nvarchar(500),
@Describtion nvarchar(500),
@Name nvarchar(50),
@Extention nvarchar(50),
@UploadedBy nvarchar(50)


AS
BEGIN
	INSERT INTO [Atul].[tbl_Videos]
           ([FullPath]
           ,[Title]
           ,[Describtion]
           ,[Name]
           ,[Extention]
           ,[UploadedBy]
           ,[UploadedOn]
           ,[IsDeleted])
		    VALUES(@FullPath,@Title,@Describtion,@Name,@Extention,@UploadedBy, getdate(),0)
			END
GO
/****** Object:  StoredProcedure [Atul].[usp_GridViewExample]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[usp_GridViewExample] 
(
@EmpId int=0,
@FirstName varchar(50)=Null,
@LastName varchar(50)=Null,
@PhoneNumber nvarchar(15)=Null,  
@EmailAddress nvarchar(50)=Null,
@Salary decimal=Null,
@Event varchar(10)
)
AS
BEGIN
	IF(@Event='Select')  
    BEGIN  
    SELECT * FROM Employee ORDER BY empid;  
    END  
  
    ELSE IF(@Event='Add')  
    BEGIN  
    INSERT INTO Employee 
	(FirstName,LastName,PhoneNumber,EmailAddress,Salary) 
	VALUES
	(@FirstName,@LastName,@PhoneNumber,@EmailAddress,@Salary);
	
    END  
  
    ELSE IF(@Event='Update')  
    BEGIN  
    UPDATE Employee SET
		 FirstName=@FirstName,
		LastName=@LastName,
		PhoneNumber=@PhoneNumber,
		EmailAddress=@EmailAddress,
		Salary=@Salary
	 where empId=@EmpId;  
    END  
  
    ELSE  
    BEGIN  
    DELETE FROM Employee WHERE empId=@EmpId;  
    END  
END
GO
/****** Object:  StoredProcedure [Atul].[uspGetEmployeeRecordById]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Atul].[uspGetEmployeeRecordById] 
	-- Add the parameters for the stored procedure here
	(
	@EmployeeId int=0
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN
	SELECT EmpName,EmpAge,DOB,EmpSal
	FROM EmployeeDetails
	WHERE (EmployeeId=@EmployeeId OR 0=@EmployeeId)

	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewStudent]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddNewStudent]  
(  
   @Name nvarchar (50),  
   @City nvarchar (50),  
   @Address nvarchar (100)  
)  
as  
begin  
   Insert into StudentReg values(@Name,@City,@Address)  
End
GO
/****** Object:  StoredProcedure [dbo].[AddQuestions]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddQuestions]  
(  
   @Question nvarchar (50),  
   @option1 nvarchar (50), 
    @option2 nvarchar (50),  
	 @option3 nvarchar (50),  
	  @option4 nvarchar (50),  
   @CorrectAnswer nvarchar (100)  
)  
as  
begin  
   Insert into Atul.OnlineExam values(@Question,@option1,@option2,@option3,@option4,@CorrectAnswer)  
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteStudent]  
(  
   @StdId int  
)  
as   
begin  
   Delete from StudentReg where Id=@StdId  
End
GO
/****** Object:  StoredProcedure [dbo].[GetStudentDetails]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetStudentDetails]  
as  
begin  
   select * from Atul.OnlineExam
End
GO
/****** Object:  StoredProcedure [dbo].[GetStudentDetailss]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetStudentDetailss]  
as  
begin  
   select * from StudentReg
End
GO
/****** Object:  StoredProcedure [dbo].[SP_EnrollDetail]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
create procedure [dbo].[SP_EnrollDetail]  
(  
@FirstName varchar(50)=NULL,  
@LastName varchar(50)=NULL,  
@Password varchar(50)=NULL,  
@Gender varchar(10)=NULL,  
@Email nvarchar(50)=NULL,  
@Phone varchar(15)=NULL,  
@SecurityAnwser nvarchar(50)=NULL,  
@status varchar(15)  
)  
as  
begin  
if @status='Insert'  
begin  
insert into Enrollment(FirstName,LastName,Password,Gender,Email,Phone,SecurityAnwser)values(@FirstName,@LastName,@Password,@Gender,@Email,@Phone,@SecurityAnwser)  
end  
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEnrollmentDetails]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetEnrollmentDetails]  
(@Email nvarchar(50))  
as  
begin  
select * from Enrollment where Email=@Email  
end 
GO
/****** Object:  StoredProcedure [dbo].[spRegisterQuestion]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ALTER DATABASE delete2 SET COMPATIBILITY_LEVEL = 130

CREATE PROCEDURE [dbo].[spRegisterQuestion]
@Text NVARCHAR(1000) ,
@CurrectAnswer NVARCHAR(100) ,
@Options  NVARCHAR(MAX)
AS
BEGIN
			  
BEGIN TRAN
              BEGIN TRY
			      begin
						 DECLARE @Q_Id int;
					     INSERT INTO Atul.QuizQuestion (Text, CurrectAnswer) 
					     VALUES(@Text,@CurrectAnswer)
					     set @Q_Id=SCOPE_IDENTITY();  
	              end
	              Begin 
				       DECLARE @TempTable TABLE ( id int,opt VARCHAR(200))
				       insert into @TempTable select * from Atul.split_string(@Options,','); 


								
									DECLARE @idOption int=1;
									DECLARE @OptionValue NVARCHAR(100);
								
					   				 While (@idOption <=(select Count(*) from @TempTable))
								Begin
								    set @OptionValue=(select opt from @TempTable where id=@idOption); 

									INSERT INTO Atul.QuizQuestionOptions (QuestionID, Options) 
					                VALUES(@Q_Id,@OptionValue)

								    set @idOption=@idOption+1;

									 

								End
					
			       End

			             COMMIT TRANSACTION

              END TRY
    BEGIN CATCH   
	     
           ROLLBACK TRANSACTION
       END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentDetails]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateStudentDetails]  
(  
   @StdId int,  
   @Name nvarchar (50),  
   @City nvarchar (50),  
   @Address nvarchar (100)  
)  
as  
begin  
   Update StudentReg   
   set Name=@Name,  
   City=@City,  
   Address=@Address  
   where Id=@StdId  
End
GO
/****** Object:  StoredProcedure [dbo].[USP_Register]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Register]
@Statement varchar(40),
@Id int =null, 
@FirstName nvarchar(50)=null, 
@LastName nvarchar(50)=null,  
@Gender bit=null, 
@MailId varchar(50) =null, 
@CountryId int=null,
@StateId int=null,
@CityId int =null
AS  
BEGIN
IF @Statement='SELECT'
BEGIN
SELECT * FROM tbl_Register
END  

IF @Statement='INSERT'
BEGIN
BEGIN TRY                
			BEGIN TRANSACTION                
			DECLARE @Result BIGINT  
					if not exists (select * from tbl_Register where FirstName=@FirstName and LastName=@LastName ) 
			               
			BEGIN                 
					INSERT INTO tbl_Register (FirstName, LastName, Gender, MailId, CountryId, StateId, CityId)values(@FirstName, @LastName, @Gender, @MailId, @CountryId, @StateId, @CityId)
				SELECT 1                
			END                
			ELSE                
				SET @Result = -1                
				COMMIT TRANSACTION;                
				SELECT @Result 
		END TRY                
		BEGIN CATCH                
			ROLLBACK TRANSACTION;                
			SET @Result=-2                
			SELECT @Result                
		END CATCH                  	
			END

IF @Statement='UPDATE'
BEGIN
DECLARE @Result1 BIGINT
if not exists (select * from tbl_Register where FirstName=@FirstName and LastName=@LastName  and Id<>@Id)
BEGIN
UPDATE tbl_Register SET FirstName=@FirstName, LastName=@LastName, Gender=@Gender, MailId=@MailId, CountryId=@CountryId, StateId=@StateId, CityId=@CityId where Id=@Id
SELECT 1
SET @Result1=1
END
ELSE

SET @Result1=-1
END

IF @Statement='READ_BY_ID'
BEGIN
SELECT * FROM tbl_Register WHERE Id=@Id
END
IF @Statement='DELETE'
BEGIN
DELETE FROM tbl_Register WHERE Id=@Id
END
END  
GO
/****** Object:  Trigger [Atul].[trgAfterInsert]    Script Date: 3/3/2022 5:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [Atul].[trgAfterInsert] on [Atul].[tblProductMaster]
For Insert,Update,DELETE
AS
Declare @PrdId int;
declare @PrdName varchar(50);
declare @Audit_Action varchar(100);
Select @PrdId=i.ProductId from inserted  i;
Select @PrdName=i.ProductName from inserted  i;
set @audit_action='Inserted Record -- After Insert Trigger.';

Insert into Product_Test_Audit(PrdId,PrdName,Audit_Action,Audit_TimeStamp)
                           values(@PrdId,@PrdName,@Audit_Action,GETDATE())

  IF EXISTS ( SELECT 0 FROM deleted )
     Begin
	   IF EXISTS ( SELECT 0 FROM inserted )
          begin
             PRINT 'AFTER Update trigger fired.'  
		  end
		else
		    begin
             PRINT 'AFTER Delete trigger fired.'  
            end
     End
  Else
     Begin
		  PRINT 'AFTER Inserted trigger fired.'  
	 End
GO
ALTER TABLE [Atul].[tblProductMaster] ENABLE TRIGGER [trgAfterInsert]
GO
USE [master]
GO
ALTER DATABASE [delete2] SET  READ_WRITE 
GO
