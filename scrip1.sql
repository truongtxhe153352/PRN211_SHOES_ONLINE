USE [master]
GO
/****** Object:  Database [Pjorect_PRN211_SHOES_APP]    Script Date: 20/06/2022 12:01:39 SA ******/
CREATE DATABASE [Pjorect_PRN211_SHOES_APP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pjorect_PRN211_SHOES_APP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pjorect_PRN211_SHOES_APP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pjorect_PRN211_SHOES_APP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pjorect_PRN211_SHOES_APP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pjorect_PRN211_SHOES_APP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET  MULTI_USER 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET QUERY_STORE = OFF
GO
USE [Pjorect_PRN211_SHOES_APP]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 20/06/2022 12:01:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] NOT NULL,
	[BrandName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/06/2022 12:01:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OderDetail]    Script Date: 20/06/2022 12:01:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
 CONSTRAINT [PK_OderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oders]    Script Date: 20/06/2022 12:01:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oders](
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Total_Price] [float] NULL,
	[OrderDate] [date] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Oders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/06/2022 12:01:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[Size] [int] NULL,
	[Image] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[BrandId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/06/2022 12:01:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Role] [nvarchar](250) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Pjorect_PRN211_SHOES_APP] SET  READ_WRITE 
GO
