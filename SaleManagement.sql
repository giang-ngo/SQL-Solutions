USE [master]
GO
/****** Object:  Database [SaleManagement]    Script Date: 26/04/2023 21:32:39 ******/
CREATE DATABASE [SaleManagement]
GO
ALTER DATABASE [SaleManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaleManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SaleManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaleManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SaleManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaleManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SaleManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SaleManagement] SET QUERY_STORE = OFF
GO
USE [SaleManagement]
GO
/****** Object:  Table [dbo].[tblBillProducts]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillProducts](
	[PK_BillProducts] [int] IDENTITY(1,100) NOT NULL,
	[FK_BillProducts_Bills] [int] NOT NULL,
	[FK_BillProducts_Products] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_SelectedItems] PRIMARY KEY CLUSTERED 
(
	[PK_BillProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBills]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBills](
	[PK_Bills] [int] NOT NULL,
	[FK_Bills_Customers] [nvarchar](50) NULL,
	[FK_Bills_Stores] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[DiscountAmount] [int] NULL,
	[TotalPayment] [int] NULL,
	[Staff] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[PK_Bills] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[PK_Customers] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[PK_Customers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscounts]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscounts](
	[PK_Discounts] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Amount] [float] NULL,
	[StartAt] [datetime] NULL,
	[EndAt] [datetime] NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[PK_Discounts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductProviders]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductProviders](
	[PK_ProductProviders] [int] NOT NULL,
	[FK_ProductProviders_Products] [nvarchar](50) NULL,
	[FK_ProductProviders_Providers] [nvarchar](50) NULL,
 CONSTRAINT [PK_Providing] PRIMARY KEY CLUSTERED 
(
	[PK_ProductProviders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[PK_Products] [nvarchar](50) NOT NULL,
	[FK_Products_Discounts] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[ManufacturingDate] [datetime] NULL,
	[Weight] [float] NULL,
	[Color] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PK_Products] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProviders]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProviders](
	[PK_Providers] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[DateOfIncorporation] [date] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[TaxCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[PK_Providers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStoreProducts]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStoreProducts](
	[PK_StoreProducts] [int] NOT NULL,
	[FK_StoreProducts_Stores] [nvarchar](50) NULL,
	[FK_StoreProducts_Products] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Storing] PRIMARY KEY CLUSTERED 
(
	[PK_StoreProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStores]    Script Date: 07/08/2022 11:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStores](
	[PK_Stores] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[TaxCode] [nvarchar](50) NULL,
	[Revenue] [int] NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[PK_Stores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C100', N'Nguyễn Văn Hưng', N'Hà Nội', N'0978123654', CAST(N'2000-10-20' AS Date), N'hungvan@xmail.com')
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C101', N'Nguyễn Thanh Thúy', N'Hà Nội', N'0978123650', CAST(N'2000-05-14' AS Date), N'thanhthuy@xmail.com')
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C102', N'Trần Quốc Doanh', N'Hà Nội', N'0978123660', CAST(N'2000-05-16' AS Date), N'doanhquoc@xmail.com')
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C103', N'Ngô Văn Chính', N'Hà Nội', N'0978123661', CAST(N'2000-11-19' AS Date), N'chinhngo@xmail.com')
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C104', N'Lê Văn Nam', N'Hà Nội', N'0978123662', CAST(N'2000-02-17' AS Date), N'namle@xmail.com')
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C105', N'Hoàng Thanh Mai', N'Hà Nội', N'0978123664', CAST(N'2001-05-18' AS Date), N'thanhmai@xmail.com')
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C106', N'Lương Trần Đạt', N'Hà Nội', N'0978123665', CAST(N'2001-11-13' AS Date), N'trandat@xmail.com')
INSERT [dbo].[tblCustomers] ([PK_Customers], [Name], [Address], [PhoneNumber], [BirthDate], [Email]) VALUES (N'C107', N'Vũ Đức Mạnh', N'Hà Nội', N'0978123666', CAST(N'2000-03-15' AS Date), N'manhducvu@xmail.com')
GO
ALTER TABLE [dbo].[tblBillProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblBillProducts_tblBillProducts] FOREIGN KEY([FK_BillProducts_Products])
REFERENCES [dbo].[tblProducts] ([PK_Products])
GO
ALTER TABLE [dbo].[tblBillProducts] CHECK CONSTRAINT [FK_tblBillProducts_tblBillProducts]
GO
ALTER TABLE [dbo].[tblBillProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblBillProducts_tblBills] FOREIGN KEY([FK_BillProducts_Bills])
REFERENCES [dbo].[tblBills] ([PK_Bills])
GO
ALTER TABLE [dbo].[tblBillProducts] CHECK CONSTRAINT [FK_tblBillProducts_tblBills]
GO
ALTER TABLE [dbo].[tblBills]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Store] FOREIGN KEY([FK_Bills_Stores])
REFERENCES [dbo].[tblStores] ([PK_Stores])
GO
ALTER TABLE [dbo].[tblBills] CHECK CONSTRAINT [FK_Bill_Store]
GO
ALTER TABLE [dbo].[tblBills]  WITH CHECK ADD  CONSTRAINT [FK_tblBills_tblCustomers] FOREIGN KEY([FK_Bills_Customers])
REFERENCES [dbo].[tblCustomers] ([PK_Customers])
GO
ALTER TABLE [dbo].[tblBills] CHECK CONSTRAINT [FK_tblBills_tblCustomers]
GO
ALTER TABLE [dbo].[tblProductProviders]  WITH CHECK ADD  CONSTRAINT [FK_Providing_Product] FOREIGN KEY([FK_ProductProviders_Products])
REFERENCES [dbo].[tblProducts] ([PK_Products])
GO
ALTER TABLE [dbo].[tblProductProviders] CHECK CONSTRAINT [FK_Providing_Product]
GO
ALTER TABLE [dbo].[tblProductProviders]  WITH CHECK ADD  CONSTRAINT [FK_Providing_Provider] FOREIGN KEY([FK_ProductProviders_Providers])
REFERENCES [dbo].[tblProviders] ([PK_Providers])
GO
ALTER TABLE [dbo].[tblProductProviders] CHECK CONSTRAINT [FK_Providing_Provider]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblDiscounts] FOREIGN KEY([FK_Products_Discounts])
REFERENCES [dbo].[tblDiscounts] ([PK_Discounts])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblDiscounts]
GO
ALTER TABLE [dbo].[tblStoreProducts]  WITH CHECK ADD  CONSTRAINT [FK_Storing_Product] FOREIGN KEY([FK_StoreProducts_Products])
REFERENCES [dbo].[tblProducts] ([PK_Products])
GO
ALTER TABLE [dbo].[tblStoreProducts] CHECK CONSTRAINT [FK_Storing_Product]
GO
ALTER TABLE [dbo].[tblStoreProducts]  WITH CHECK ADD  CONSTRAINT [FK_Storing_Store] FOREIGN KEY([FK_StoreProducts_Stores])
REFERENCES [dbo].[tblStores] ([PK_Stores])
GO
ALTER TABLE [dbo].[tblStoreProducts] CHECK CONSTRAINT [FK_Storing_Store]
GO
USE [master]
GO
ALTER DATABASE [SaleManagement] SET  READ_WRITE 
GO
