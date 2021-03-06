USE [master]
GO
/****** Object:  Database [PROJECT_PRN211_SHOES_APP]    Script Date: 22/07/2022 10:34:26 CH ******/
CREATE DATABASE [PROJECT_PRN211_SHOES_APP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROJECT_PRN211_SHOES_APP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PROJECT_PRN211_SHOES_APP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROJECT_PRN211_SHOES_APP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PROJECT_PRN211_SHOES_APP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROJECT_PRN211_SHOES_APP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET  MULTI_USER 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET QUERY_STORE = OFF
GO
USE [PROJECT_PRN211_SHOES_APP]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 22/07/2022 10:34:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OderDetail]    Script Date: 22/07/2022 10:34:26 CH ******/
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
/****** Object:  Table [dbo].[Oders]    Script Date: 22/07/2022 10:34:26 CH ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 22/07/2022 10:34:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[Image] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[BrandId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 22/07/2022 10:34:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[ProductId] [int] NOT NULL,
	[Size] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22/07/2022 10:34:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Role] [nvarchar](250) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (1, N'NIKE')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (2, N'PUMA')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (3, N'ADIDAS')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (4, N'VANS')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (5, N'SUPERME')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (6, N'CONVERSE')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
INSERT [dbo].[OderDetail] ([OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 2000)
INSERT [dbo].[OderDetail] ([OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (1, 4, 2, 4000)
INSERT [dbo].[OderDetail] ([OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (2, 1, 2, 4000)
INSERT [dbo].[OderDetail] ([OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (2, 2, 1, 2000)
GO
INSERT [dbo].[Oders] ([OrderId], [Quantity], [Total_Price], [OrderDate], [CustomerId]) VALUES (1, 3, 6000, CAST(N'2022-07-21' AS Date), 1)
INSERT [dbo].[Oders] ([OrderId], [Quantity], [Total_Price], [OrderDate], [CustomerId]) VALUES (2, 3, 6000, CAST(N'2022-07-21' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (1, N'Nike Air Force ', 2000, 0, N'1.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (2, N'Nike Air Force ', 2000, 0, N'1.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (3, N'Nike Jodan', 2000, 0, N'2.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (4, N'Puma Nitro Basketball', 2000, 0, N'3.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 3, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (5, N'VANS NEWAS', 2000, 0, N'4.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 4, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (6, N'SUPERMAN DO', 2000, 0, N'5.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 5, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (7, N'CONVERSE CHUCK', 2000, 0, N'6.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 6, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (10, N'Nike Jodan rep', 1999, 0, N'2.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (11, N'Puma Nitro Basketball rep', 2001, 0, N'3.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 3, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (12, N'Nike Air Force ', 1998, 0, N'1.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Discount], [Image], [Description], [BrandId], [CreatedDate], [ModifiedDate]) VALUES (13, N'Nike Air Force ', 1997, 0, N'1.png', N'The radiance lives on in the Nike Air Force 1 ''07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (1, 36, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (1, 37, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (1, 38, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (1, 39, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (1, 40, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (1, 41, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (2, 39, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (2, 40, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (2, 41, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (2, 42, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (3, 40, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (3, 41, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (3, 42, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (4, 38, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (4, 39, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (4, 40, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (5, 40, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (5, 41, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (6, 39, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (6, 40, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (6, 41, 5)
INSERT [dbo].[Size] ([ProductId], [Size], [Quantity]) VALUES (6, 42, 5)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Address], [Phone], [Role]) VALUES (1, N'admin', N'1234', N'ha noi', N'0123456789', N'admin')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Address], [Phone], [Role]) VALUES (2, N'user', N'123', N'ha noi', N'0123455666', N'customer')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Address], [Phone], [Role]) VALUES (3, N'mAOMAO', N'123456', N'HANOI', N'0904785350', N'customer')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Address], [Phone], [Role]) VALUES (4, N'truongtxhe153352', N'123456', N'HANOI', N'0904785350', N'customer')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Address], [Phone], [Role]) VALUES (5, N'truongtxhe1533523', N'123456', N'HANOI', N'0904785350', N'customer')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Address], [Phone], [Role]) VALUES (6, N'truongtxhe1533524', N'123', N'HANOI', N'0904785350', N'customer')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OderDetail_Oders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Oders] ([OrderId])
GO
ALTER TABLE [dbo].[OderDetail] CHECK CONSTRAINT [FK_OderDetail_Oders]
GO
ALTER TABLE [dbo].[OderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OderDetail] CHECK CONSTRAINT [FK_OderDetail_Product]
GO
ALTER TABLE [dbo].[Oders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Users] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Oders] CHECK CONSTRAINT [FK_Oders_Users]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
USE [master]
GO
ALTER DATABASE [PROJECT_PRN211_SHOES_APP] SET  READ_WRITE 
GO
