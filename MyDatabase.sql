USE master
GO
CREATE DATABASE MyDatabase
GO
USE MyDatabase
GO
CREATE SCHEMA product
GO
/****** Object:  Table [product].[ProductProviders]    Script Date: 11/03/2024 22:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [product].[ProductProviders](
	[PK_ProductProvides] [int] IDENTITY(100,1) NOT NULL,
	[FK_Products] [int] NULL,
	[FK_Providers] [varchar](20) NULL,
	[ProvideAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ProductProvides] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [product].[Products]    Script Date: 07/13/2022 17:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [product].[Products](
	[PK_Products] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Products] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [product].[Providers]    Script Date: 07/13/2022 17:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [product].[Providers](
	[PK_Providers] [varchar](20) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[TaxCode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Providers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [product].[ProductProviders] ON 

INSERT [product].[ProductProviders] ([PK_ProductProvides], [FK_Products], [FK_Providers], [ProvideAt]) VALUES (101, 1008, N'AP100', CAST(N'2022-07-10T16:53:57.823' AS DateTime))
INSERT [product].[ProductProviders] ([PK_ProductProvides], [FK_Products], [FK_Providers], [ProvideAt]) VALUES (102, 1002, N'Ap100', CAST(N'2022-07-10T16:53:57.823' AS DateTime))
INSERT [product].[ProductProviders] ([PK_ProductProvides], [FK_Products], [FK_Providers], [ProvideAt]) VALUES (103, 1003, N'SAM100', CAST(N'2022-07-10T16:53:57.823' AS DateTime))
INSERT [product].[ProductProviders] ([PK_ProductProvides], [FK_Products], [FK_Providers], [ProvideAt]) VALUES (107, 1008, N'AP100', CAST(N'2022-07-10T16:58:09.610' AS DateTime))
SET IDENTITY_INSERT [product].[ProductProviders] OFF
GO
INSERT [product].[Products] ([PK_Products], [Name], [Quantity], [Price]) VALUES (1002, N'iPhone 15', 150, 28500000)
INSERT [product].[Products] ([PK_Products], [Name], [Quantity], [Price]) VALUES (1003, N'Samsung Galaxy S24', 150, 35000000)
INSERT [product].[Products] ([PK_Products], [Name], [Quantity], [Price]) VALUES (1008, N'iPhone 15 Pro', 100, 33500000)
GO
INSERT [product].[Providers] ([PK_Providers], [Name], [Address], [PhoneNumber], [TaxCode]) VALUES (N'AP100', N'Apple Inc', N'Cupertino California USA', N'+14089961010', N'0313510827')
INSERT [product].[Providers] ([PK_Providers], [Name], [Address], [PhoneNumber], [TaxCode]) VALUES (N'OPP100', N'Oppo', N'448A Nguyễn Tất Thành, Phường 18, Quận 4, Thành phố Hồ Chí Minh', N'1800577776', N'0312059023')
INSERT [product].[Providers] ([PK_Providers], [Name], [Address], [PhoneNumber], [TaxCode]) VALUES (N'SAM100', N'Samsung ELECTRONICS', N'416, Maetan 3-Dong, Yeongtong-Gu, Suwon, Gyeonggi-Do, South Korea', N'1800 588 889', N'2300325764')
GO
ALTER TABLE [product].[ProductProviders] ADD  DEFAULT (getdate()) FOR [ProvideAt]
GO
ALTER TABLE [product].[Products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [product].[Products] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [product].[ProductProviders]  WITH CHECK ADD  CONSTRAINT [FK_products] FOREIGN KEY([FK_Products])
REFERENCES [product].[Products] ([PK_Products])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [product].[ProductProviders] CHECK CONSTRAINT [FK_products]
GO
ALTER TABLE [product].[ProductProviders]  WITH CHECK ADD  CONSTRAINT [FK_providers] FOREIGN KEY([FK_Providers])
REFERENCES [product].[Providers] ([PK_Providers])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [product].[ProductProviders] CHECK CONSTRAINT [FK_providers]
GO
