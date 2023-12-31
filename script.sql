USE [master]
GO
/****** Object:  Database [BackendDb]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE DATABASE [BackendDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BackendDb', FILENAME = N'C:\Program Files\MSSQL15.SQLEXPRESS\MSSQL\DATA\BackendDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BackendDb_log', FILENAME = N'C:\Program Files\MSSQL15.SQLEXPRESS\MSSQL\DATA\BackendDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BackendDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BackendDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BackendDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BackendDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BackendDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BackendDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BackendDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BackendDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BackendDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BackendDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BackendDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BackendDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BackendDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BackendDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BackendDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BackendDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BackendDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BackendDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BackendDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BackendDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BackendDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BackendDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BackendDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BackendDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BackendDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BackendDb] SET  MULTI_USER 
GO
ALTER DATABASE [BackendDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BackendDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BackendDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BackendDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BackendDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BackendDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BackendDb] SET QUERY_STORE = OFF
GO
USE [BackendDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BanTypes]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BanTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarColors]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarColors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CarColors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsMain] [bit] NOT NULL,
	[CarId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CarImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NOT NULL,
	[Mileage] [float] NOT NULL,
	[Year] [datetime2](7) NOT NULL,
	[BrandId] [int] NOT NULL,
	[FuelTypeId] [int] NOT NULL,
	[TransmissionId] [int] NOT NULL,
	[BanTypeId] [int] NOT NULL,
	[GearBoxId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CityId] [int] NULL,
	[ModelId] [int] NULL,
	[AppUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarSituations]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarSituations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[SituationId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CarSituations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelTypes]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_FuelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GearBoxes]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GearBoxes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GearBoxes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[BrandId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[CarId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Situations]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Situations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Situations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transmissions]    Script Date: 7/11/2023 6:35:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transmissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Transmissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230618133502__initial', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230618153943_CreateCarTables', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230618154642_AddCategoryTable', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230709215341_ChangedCarTable', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230710142411_AddedReservationTable', N'6.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711011051_UpdateDataBaseTables', N'6.0.18')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2767d4be-afe7-477e-8b91-8ee7e2ed7e96', N'Admin', N'ADMIN', N'66cc34a4-5118-44ac-ae80-93290a6814a8')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4152f3fb-f6b3-4e02-b0d8-daba37e68652', N'SuperAdmin', N'SUPERADMIN', N'5f874827-f110-47b7-b5c2-e51115f40796')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'b7990310-4fc9-4745-860f-a846dddbc222', N'Member', N'MEMBER', N'191e41b8-a256-43b0-9137-4ce77ab0d5e2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8f2ff241-9c25-4a7b-8da9-d693b8d84276', N'b7990310-4fc9-4745-860f-a846dddbc222')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8f2ff241-9c25-4a7b-8da9-d693b8d84276', N'CavidIsmayilzada', N'Cavid551', N'CAVID551', N'javidismayilzada@gmail.com', N'JAVIDISMAYILZADA@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEIsUOJeUdMVXgODwsfH96J4BODRjTCHVIei3W78nQ4PFXS8cVIa8FhvrdRq2gdz/Rg==', N'EUHRXAYUS64UF4RGQFT73PU5YTHZAOCW', N'54db48a3-fcfc-4255-8d04-7f332b08116f', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[BanTypes] ON 

INSERT [dbo].[BanTypes] ([Id], [Name], [IsDeleted]) VALUES (2, N'Sedan', 0)
INSERT [dbo].[BanTypes] ([Id], [Name], [IsDeleted]) VALUES (3, N'Jeep', 0)
INSERT [dbo].[BanTypes] ([Id], [Name], [IsDeleted]) VALUES (4, N'Minivan', 0)
SET IDENTITY_INSERT [dbo].[BanTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted]) VALUES (3, N'Bmw', 0)
INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted]) VALUES (4, N'Kia', 0)
INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted]) VALUES (5, N'Mercedes', 0)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (25, N'b1.jpg', 1, 7, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (26, N'b2.jpg', 0, 7, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (27, N'b3.jpg', 0, 7, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (28, N'b4.jpg', 0, 7, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (29, N'b5.jpg', 0, 7, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (30, N'kia1.jpg', 1, 8, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (31, N'kia2.jpg', 0, 8, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (32, N'kia3.jpg', 0, 8, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (33, N'kia4.jpg', 0, 8, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (34, N'kia5.jpg', 0, 8, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (35, N'v1.jpg', 1, 9, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (36, N'v2.jpg', 0, 9, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (37, N'v3.jpg', 0, 9, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (38, N'v4.jpg', 0, 9, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (39, N'v5.jpg', 0, 9, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (40, N's1.jpg', 1, 10, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (41, N's2.jpg', 0, 10, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (42, N's3.jpg', 0, 10, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (43, N's4.jpg', 0, 10, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (44, N's5.jpg', 0, 10, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (50, N's2.jpg', 1, 12, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (51, N's1.jpg', 0, 12, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (52, N's3.jpg', 0, 12, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (53, N's4.jpg', 0, 12, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (54, N's5.jpg', 0, 12, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (55, N'bmw-main.jpg', 1, 13, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (56, N'b2.jpg', 0, 13, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (57, N'b3.jpg', 0, 13, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (58, N'b4.jpg', 0, 13, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (59, N'b5.jpg', 0, 13, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (60, N'12509_4GYXHe9Ef_FwqzkyAli3Og.jpg', 1, 14, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (61, N'10024_h_KVK9NlwvB6WdRnGECBgA.jpg', 0, 14, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (62, N'mb-vito-tourer-2020-side-front.jpg', 0, 14, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (63, N'MERCEDES-BENZ-Vito-Tourer-6781_28.jpg', 0, 14, 0)
INSERT [dbo].[CarImages] ([Id], [Name], [IsMain], [CarId], [IsDeleted]) VALUES (64, N'v3.jpg', 0, 14, 0)
SET IDENTITY_INSERT [dbo].[CarImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [Price], [Mileage], [Year], [BrandId], [FuelTypeId], [TransmissionId], [BanTypeId], [GearBoxId], [IsDeleted], [CategoryId], [CityId], [ModelId], [AppUserId]) VALUES (7, 300, 150.325, CAST(N'2023-07-10T15:29:00.0000000' AS DateTime2), 3, 2, 1, 2, 1, 0, 4, 2, 9, N'8f2ff241-9c25-4a7b-8da9-d693b8d84276')
INSERT [dbo].[Cars] ([Id], [Price], [Mileage], [Year], [BrandId], [FuelTypeId], [TransmissionId], [BanTypeId], [GearBoxId], [IsDeleted], [CategoryId], [CityId], [ModelId], [AppUserId]) VALUES (8, 220, 123.254, CAST(N'2023-06-27T15:39:00.0000000' AS DateTime2), 4, 2, 2, 2, 1, 0, 4, 2, 14, N'8f2ff241-9c25-4a7b-8da9-d693b8d84276')
INSERT [dbo].[Cars] ([Id], [Price], [Mileage], [Year], [BrandId], [FuelTypeId], [TransmissionId], [BanTypeId], [GearBoxId], [IsDeleted], [CategoryId], [CityId], [ModelId], [AppUserId]) VALUES (9, 400, 125.851, CAST(N'2023-07-02T15:41:00.0000000' AS DateTime2), 5, 3, 2, 4, 2, 0, 3, 4, 20, N'8f2ff241-9c25-4a7b-8da9-d693b8d84276')
INSERT [dbo].[Cars] ([Id], [Price], [Mileage], [Year], [BrandId], [FuelTypeId], [TransmissionId], [BanTypeId], [GearBoxId], [IsDeleted], [CategoryId], [CityId], [ModelId], [AppUserId]) VALUES (10, 600, 12, CAST(N'2023-07-11T15:47:00.0000000' AS DateTime2), 5, 2, 1, 2, 1, 0, 1, 2, 18, N'8f2ff241-9c25-4a7b-8da9-d693b8d84276')
INSERT [dbo].[Cars] ([Id], [Price], [Mileage], [Year], [BrandId], [FuelTypeId], [TransmissionId], [BanTypeId], [GearBoxId], [IsDeleted], [CategoryId], [CityId], [ModelId], [AppUserId]) VALUES (12, 1220, 55, CAST(N'2023-07-03T15:52:00.0000000' AS DateTime2), 5, 2, 1, 2, 1, 0, 1, 3, 18, N'8f2ff241-9c25-4a7b-8da9-d693b8d84276')
INSERT [dbo].[Cars] ([Id], [Price], [Mileage], [Year], [BrandId], [FuelTypeId], [TransmissionId], [BanTypeId], [GearBoxId], [IsDeleted], [CategoryId], [CityId], [ModelId], [AppUserId]) VALUES (13, 700, 123.254, CAST(N'2023-07-02T15:57:00.0000000' AS DateTime2), 3, 2, 1, 2, 1, 0, 1, 2, 9, N'8f2ff241-9c25-4a7b-8da9-d693b8d84276')
INSERT [dbo].[Cars] ([Id], [Price], [Mileage], [Year], [BrandId], [FuelTypeId], [TransmissionId], [BanTypeId], [GearBoxId], [IsDeleted], [CategoryId], [CityId], [ModelId], [AppUserId]) VALUES (14, 180, 120, CAST(N'2023-07-03T16:22:00.0000000' AS DateTime2), 5, 2, 1, 4, 1, 0, 3, 3, 20, N'8f2ff241-9c25-4a7b-8da9-d693b8d84276')
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (1, N'Wedding Cars', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (3, N'Mini Van', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (4, N'Sedan', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [IsDeleted]) VALUES (2, N'Baku', 0)
INSERT [dbo].[Cities] ([Id], [Name], [IsDeleted]) VALUES (3, N'Sumqayit', 0)
INSERT [dbo].[Cities] ([Id], [Name], [IsDeleted]) VALUES (4, N'Gence', 0)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[FuelTypes] ON 

INSERT [dbo].[FuelTypes] ([Id], [Name], [IsDeleted]) VALUES (2, N'Gas', 0)
INSERT [dbo].[FuelTypes] ([Id], [Name], [IsDeleted]) VALUES (3, N'Diesel', 0)
SET IDENTITY_INSERT [dbo].[FuelTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[GearBoxes] ON 

INSERT [dbo].[GearBoxes] ([Id], [Name], [IsDeleted]) VALUES (1, N'Automatic', 0)
INSERT [dbo].[GearBoxes] ([Id], [Name], [IsDeleted]) VALUES (2, N'Mechanic', 0)
SET IDENTITY_INSERT [dbo].[GearBoxes] OFF
GO
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (9, N'M5', 3, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (10, N'535', 3, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (11, N'750', 3, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (12, N'X5', 3, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (13, N'Rio', 4, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (14, N'Optima', 4, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (15, N'Sorento', 4, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (16, N'Cadenza', 4, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (18, N'S-Class', 5, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (19, N'E-Class', 5, 0)
INSERT [dbo].[Models] ([Id], [Name], [BrandId], [IsDeleted]) VALUES (20, N'Viano', 5, 0)
SET IDENTITY_INSERT [dbo].[Models] OFF
GO
SET IDENTITY_INSERT [dbo].[Transmissions] ON 

INSERT [dbo].[Transmissions] ([Id], [Name], [IsDeleted]) VALUES (1, N'Rear', 0)
INSERT [dbo].[Transmissions] ([Id], [Name], [IsDeleted]) VALUES (2, N'Front', 0)
INSERT [dbo].[Transmissions] ([Id], [Name], [IsDeleted]) VALUES (3, N'All', 0)
SET IDENTITY_INSERT [dbo].[Transmissions] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarColors_CarId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarColors_CarId] ON [dbo].[CarColors]
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarColors_ColorId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarColors_ColorId] ON [dbo].[CarColors]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarImages_CarId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarImages_CarId] ON [dbo].[CarImages]
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cars_AppUserId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_AppUserId] ON [dbo].[Cars]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_BanTypeId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_BanTypeId] ON [dbo].[Cars]
(
	[BanTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_BrandId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_BrandId] ON [dbo].[Cars]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_CategoryId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_CategoryId] ON [dbo].[Cars]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_CityId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_CityId] ON [dbo].[Cars]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_FuelTypeId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_FuelTypeId] ON [dbo].[Cars]
(
	[FuelTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_GearBoxId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_GearBoxId] ON [dbo].[Cars]
(
	[GearBoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_ModelId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_ModelId] ON [dbo].[Cars]
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_TransmissionId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cars_TransmissionId] ON [dbo].[Cars]
(
	[TransmissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarSituations_CarId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarSituations_CarId] ON [dbo].[CarSituations]
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarSituations_SituationId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_CarSituations_SituationId] ON [dbo].[CarSituations]
(
	[SituationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Models_BrandId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Models_BrandId] ON [dbo].[Models]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reservations_AppUserId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_AppUserId] ON [dbo].[Reservations]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_CarId]    Script Date: 7/11/2023 6:35:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_CarId] ON [dbo].[Reservations]
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cars] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CarColors]  WITH CHECK ADD  CONSTRAINT [FK_CarColors_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarColors] CHECK CONSTRAINT [FK_CarColors_Cars_CarId]
GO
ALTER TABLE [dbo].[CarColors]  WITH CHECK ADD  CONSTRAINT [FK_CarColors_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarColors] CHECK CONSTRAINT [FK_CarColors_Colors_ColorId]
GO
ALTER TABLE [dbo].[CarImages]  WITH CHECK ADD  CONSTRAINT [FK_CarImages_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarImages] CHECK CONSTRAINT [FK_CarImages_Cars_CarId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_BanTypes_BanTypeId] FOREIGN KEY([BanTypeId])
REFERENCES [dbo].[BanTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_BanTypes_BanTypeId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Brands_BrandId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Cities_CityId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_FuelTypes_FuelTypeId] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[FuelTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_FuelTypes_FuelTypeId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_GearBoxes_GearBoxId] FOREIGN KEY([GearBoxId])
REFERENCES [dbo].[GearBoxes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_GearBoxes_GearBoxId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Models_ModelId] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Models_ModelId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Transmissions_TransmissionId] FOREIGN KEY([TransmissionId])
REFERENCES [dbo].[Transmissions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Transmissions_TransmissionId]
GO
ALTER TABLE [dbo].[CarSituations]  WITH CHECK ADD  CONSTRAINT [FK_CarSituations_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarSituations] CHECK CONSTRAINT [FK_CarSituations_Cars_CarId]
GO
ALTER TABLE [dbo].[CarSituations]  WITH CHECK ADD  CONSTRAINT [FK_CarSituations_Situations_SituationId] FOREIGN KEY([SituationId])
REFERENCES [dbo].[Situations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarSituations] CHECK CONSTRAINT [FK_CarSituations_Situations_SituationId]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Brands_BrandId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Cars_CarId]
GO
USE [master]
GO
ALTER DATABASE [BackendDb] SET  READ_WRITE 
GO
