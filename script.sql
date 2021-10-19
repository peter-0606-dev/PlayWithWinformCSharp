USE [master]
GO
/****** Object:  Database [FStore]    Script Date: 19-Oct-21 4:15:43 PM ******/
CREATE DATABASE [FStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FStore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FStore] SET  MULTI_USER 
GO
ALTER DATABASE [FStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FStore]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 19-Oct-21 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
 CONSTRAINT [PK__tblMembe__0CF04B38B3947E3E] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19-Oct-21 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 19-Oct-21 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 19-Oct-21 4:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [varchar](40) NOT NULL,
	[Weight] [varchar](20) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
 CONSTRAINT [PK__tblProdu__B40CC6ED2A49CCF4] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (12, N'phuong@fstore.com', N'FSoft', N'Phnom Penh', N'Myanmar', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (13, N'an@fstore.com', N'Ree', N'Dili', N'Brunei', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (14, N'dan@fstore.com', N'FTech', N'TPHCM', N'Campuchia', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (15, N'nam@fstore.com', N'FPTU', N'Vien Chan', N'Lao', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (16, N'nhut@fstore.com', N'FSoft', N'Dili', N'DongTimor', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (17, N'trung@fstore.com', N'Misa', N'Ha Noi', N'Viet Nam', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (18, N'tung@fstore.com', N'VNG', N'TPHCM', N'Viet Nam', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (19, N'trieumy@fstore.com', N'Samsung', N'TPHCM', N'Viet Nam', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (20, N'kieu@fstore.com', N'Google', N'Phu Quoc', N'VietNam', N'123')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (22, N'hihi@fstore.com', N'ahihi', N'TPHCM', N'Viet Nam', N'1')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (23, N'member@fstore.com', N'FPT University', N'Dili', N'Thailand', N'member@@')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (24, N'ahihi@gmail.com', N'FStore', N'TPHCM', N'Viet Nam', N'1')
SET IDENTITY_INSERT [dbo].[Member] OFF
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (2, 12, CAST(N'2021-10-17 22:29:17.493' AS DateTime), CAST(N'2021-10-17 22:29:17.493' AS DateTime), CAST(N'2021-10-17 22:29:17.493' AS DateTime), 92000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (3, 12, CAST(N'2021-10-19 11:13:02.543' AS DateTime), CAST(N'2021-10-19 11:13:02.543' AS DateTime), CAST(N'2021-10-19 11:13:02.543' AS DateTime), 12000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (4, 20, CAST(N'2021-10-18 17:03:28.410' AS DateTime), CAST(N'2021-10-18 17:03:28.410' AS DateTime), CAST(N'2021-10-18 17:03:28.410' AS DateTime), 25000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (5, 13, CAST(N'2021-10-18 17:11:19.357' AS DateTime), CAST(N'2021-10-18 17:11:19.357' AS DateTime), CAST(N'2021-10-18 17:11:19.357' AS DateTime), 10000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (6, 20, CAST(N'2021-10-18 17:13:31.047' AS DateTime), CAST(N'2021-10-18 17:13:31.047' AS DateTime), CAST(N'2021-10-18 17:13:31.047' AS DateTime), 3000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (7, 13, CAST(N'2021-10-18 19:50:07.717' AS DateTime), CAST(N'2021-10-18 19:50:07.717' AS DateTime), CAST(N'2021-10-18 19:50:07.717' AS DateTime), 15000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (8, 12, CAST(N'2021-10-18 20:05:17.253' AS DateTime), CAST(N'2021-10-18 20:05:17.253' AS DateTime), CAST(N'2021-10-18 20:05:17.253' AS DateTime), 12000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (9, 12, CAST(N'2021-10-18 20:07:22.087' AS DateTime), CAST(N'2021-10-18 20:07:22.087' AS DateTime), CAST(N'2021-10-18 20:07:22.087' AS DateTime), 32000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (10, 12, CAST(N'2021-10-18 20:08:11.647' AS DateTime), CAST(N'2021-10-18 20:08:11.647' AS DateTime), CAST(N'2021-10-18 20:08:11.647' AS DateTime), 32000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (11, 12, CAST(N'2021-10-18 20:10:06.307' AS DateTime), CAST(N'2021-10-18 20:10:06.307' AS DateTime), CAST(N'2021-10-18 20:10:06.307' AS DateTime), 10000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (12, 12, CAST(N'2021-10-18 20:11:40.973' AS DateTime), CAST(N'2021-10-18 20:11:40.973' AS DateTime), CAST(N'2021-10-18 20:11:40.973' AS DateTime), 10000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (13, 20, CAST(N'2021-10-18 20:14:46.970' AS DateTime), CAST(N'2021-10-18 20:14:46.970' AS DateTime), CAST(N'2021-10-18 20:14:46.970' AS DateTime), 20000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (14, 12, CAST(N'2021-10-18 20:23:47.933' AS DateTime), CAST(N'2021-10-18 20:23:47.933' AS DateTime), CAST(N'2021-10-18 20:23:47.933' AS DateTime), 12000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (15, 13, CAST(N'2021-10-18 20:27:09.217' AS DateTime), CAST(N'2021-10-18 20:27:09.217' AS DateTime), CAST(N'2021-10-18 20:27:09.217' AS DateTime), 12000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (16, 12, CAST(N'2021-10-18 20:29:34.967' AS DateTime), CAST(N'2021-10-18 20:29:34.967' AS DateTime), CAST(N'2021-10-18 20:29:34.967' AS DateTime), 30000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (17, 12, CAST(N'2021-10-18 20:31:03.940' AS DateTime), CAST(N'2021-10-18 20:31:03.940' AS DateTime), CAST(N'2021-10-18 20:31:03.940' AS DateTime), 30000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (18, 19, CAST(N'2021-10-18 20:35:44.070' AS DateTime), CAST(N'2021-10-18 20:35:44.070' AS DateTime), CAST(N'2021-10-18 20:35:44.070' AS DateTime), 12000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (19, 20, CAST(N'2021-10-18 20:37:05.760' AS DateTime), CAST(N'2021-10-18 20:37:05.760' AS DateTime), CAST(N'2021-10-18 20:37:05.760' AS DateTime), 12000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (20, 20, CAST(N'2021-10-18 20:39:47.940' AS DateTime), CAST(N'2021-10-18 20:39:47.940' AS DateTime), CAST(N'2021-10-18 20:39:47.940' AS DateTime), 20000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (21, 23, CAST(N'2021-10-18 22:36:27.220' AS DateTime), CAST(N'2021-10-18 22:36:27.220' AS DateTime), CAST(N'2021-10-18 22:36:27.220' AS DateTime), 120000.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (2, 3, 23000.0000, 1, 0.2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 1, 1000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 2, 14000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 3, 200000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 4, 32000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 1, 30000.0000, 4, 0.32)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 3, 23000.0000, 2, 0.32)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 3, 23000.0000, 1, 0.3222)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 2, 23000.0000, 1, 0.2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 3, 23000.0000, 1, 0.2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 2, 23000.0000, 12, 0.777)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 3, 23000.0000, 3, 0.777)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 1, 30000.0000, 1, 0.31)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 2, 23000.0000, 6, 0.31)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 3, 23000.0000, 4, 0.31)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 1, 30000.0000, 2, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 2, 23000.0000, 2, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 3, 23000.0000, 2, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 4, 20000.0000, 2, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 2, 23000.0000, 2, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 3, 23000.0000, 2, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 1, 30000.0000, 5, 0.2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 1, 30000.0000, 3, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 2, 23000.0000, 3, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 3, 23000.0000, 3, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 1, 30000.0000, 4, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 2, 23000.0000, 4, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 3, 23000.0000, 4, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 4, 20000.0000, 4, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 1, 30000.0000, 2, 0.33)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 2, 23000.0000, 2, 0.33)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 3, 23000.0000, 2, 0.33)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (15, 1, 30000.0000, 2, 0.33)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (15, 2, 23000.0000, 2, 0.33)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (15, 3, 23000.0000, 2, 0.33)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (15, 4, 20000.0000, 2, 0.33)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (16, 1, 30000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (16, 2, 23000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (16, 3, 23000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (16, 4, 20000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (17, 1, 30000.0000, 2, 0.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 1, 30000.0000, 2, 0.232)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 2, 23000.0000, 2, 0.232)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 3, 23000.0000, 2, 0.232)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 4, 20000.0000, 2, 0.232)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 5, 23000.0000, 2, 0.232)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (19, 1, 30000.0000, 3, 0.333)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (19, 2, 23000.0000, 3, 0.333)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (19, 3, 23000.0000, 3, 0.333)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (20, 2, 23000.0000, 32, 0.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 2, 23000.0000, 6, 0.4)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 3, 23000.0000, 3, 0.4)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 4, 20000.0000, 3, 0.4)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (1, 1, N'Banh keo', N'1', 1000.0000, 310)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (2, 2, N'Bia', N'5', 14000.0000, 185)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (3, 1, N'Cake', N'3', 200000.0000, 92)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (4, 1, N'Dau an', N'6', 32000.0000, 310)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (5, 1, N'Sua chua', N'4', 6000.0000, 5)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (7, 1, N'Banh Beo', N'1', 5000.0000, 210)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (8, 1, N'Nuoc ngot', N'2', 17000.0000, 230)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (10, 1, N'Ba Ba', N'33', 170000.0000, 320)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (11, 1, N'Tu tu', N'22', 500000.0000, 230)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (13, 3, N'Juice', N'2', 30000.0000, 320)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblMember] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_tblOrder_tblMember]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
USE [master]
GO
ALTER DATABASE [FStore] SET  READ_WRITE 
GO
