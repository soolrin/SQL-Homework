USE [master]
GO
/****** Object:  Database [Product]    Script Date: 05.04.2025 23:08:42 ******/
CREATE DATABASE [Product]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Product', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Product.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Product_log', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Product_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Product] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Product].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Product] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Product] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Product] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Product] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Product] SET ARITHABORT OFF 
GO
ALTER DATABASE [Product] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Product] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Product] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Product] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Product] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Product] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Product] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Product] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Product] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Product] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Product] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Product] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Product] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Product] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Product] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Product] SET RECOVERY FULL 
GO
ALTER DATABASE [Product] SET  MULTI_USER 
GO
ALTER DATABASE [Product] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Product] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Product] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Product] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Product] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Product] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Product', N'ON'
GO
ALTER DATABASE [Product] SET QUERY_STORE = ON
GO
ALTER DATABASE [Product] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Product]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
	[id_product] [int] NULL,
	[id_supplier] [int] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percent] [int] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_category] [int] NULL,
	[id_markup] [int] NULL,
	[id_measurement] [int] NULL,
	[id_producer] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
	[id_product] [int] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 05.04.2025 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (2, N'ул. Крещатик, 12', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'ул. Шевченко, 5', 2)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [name]) VALUES (1, N'Молочные продукты')
INSERT [dbo].[Category] ([Id], [name]) VALUES (2, N'Фрукты')
INSERT [dbo].[Category] ([Id], [name]) VALUES (3, N'Мясо')
INSERT [dbo].[Category] ([Id], [name]) VALUES (4, N'Овощи')
INSERT [dbo].[Category] ([Id], [name]) VALUES (5, N'Хлебобулочные')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (1, N'Киев', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'Львов', 2)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Украина')
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [price], [quantity], [date_of_delivery], [id_product], [id_supplier]) VALUES (1, 30, 80, CAST(N'2025-03-01' AS Date), 1, 2)
INSERT [dbo].[Delivery] ([id], [price], [quantity], [date_of_delivery], [id_product], [id_supplier]) VALUES (2, 28, 100, CAST(N'2025-03-01' AS Date), 2, 3)
INSERT [dbo].[Delivery] ([id], [price], [quantity], [date_of_delivery], [id_product], [id_supplier]) VALUES (3, 135, 50, CAST(N'2025-03-04' AS Date), 3, 2)
INSERT [dbo].[Delivery] ([id], [price], [quantity], [date_of_delivery], [id_product], [id_supplier]) VALUES (4, 35, 90, CAST(N'2025-03-04' AS Date), 4, 3)
INSERT [dbo].[Delivery] ([id], [price], [quantity], [date_of_delivery], [id_product], [id_supplier]) VALUES (5, 18, 150, CAST(N'2025-03-05' AS Date), 5, 2)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Markup] ON 

INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (1, N'Розница', 20)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (2, N'Опт', 10)
SET IDENTITY_INSERT [dbo].[Markup] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurement] ON 

INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (1, N'кг', N'Килограмм')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (2, N'л', N'Литр')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (3, N'шт', N'Штука')
SET IDENTITY_INSERT [dbo].[Measurement] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (1, N'ООО "Молочный мир"', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (2, N'ФХ "Сады Украины"', 3)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (3, N'ТМ "Мясной эксперт"', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (4, N'	ЧП "Овощная свежесть"', 3)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (5, N'Пекарня "Золотой колос"', 2)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [quantity], [id_category], [id_markup], [id_measurement], [id_producer]) VALUES (1, N'Молоко 2.5%', 38, 100, 1, 1, 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [id_category], [id_markup], [id_measurement], [id_producer]) VALUES (2, N'Яблоки Гала', 34, 150, 2, 2, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [id_category], [id_markup], [id_measurement], [id_producer]) VALUES (3, N'Куриное филе', 162, 80, 3, 1, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [id_category], [id_markup], [id_measurement], [id_producer]) VALUES (4, N'Огурцы свежие', 45, 120, 4, 2, 1, 4)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [id_category], [id_markup], [id_measurement], [id_producer]) VALUES (5, N'Батон нарезной', 24, 200, 5, 1, 1, 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Киевская', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Львовская', 1)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [price], [quantity], [date_of_sale], [id_product]) VALUES (1, 38, 5, CAST(N'2025-03-08' AS Date), 1)
INSERT [dbo].[Sale] ([id], [price], [quantity], [date_of_sale], [id_product]) VALUES (2, 34, 10, CAST(N'2025-03-08' AS Date), 2)
INSERT [dbo].[Sale] ([id], [price], [quantity], [date_of_sale], [id_product]) VALUES (3, 162, 13, CAST(N'2025-03-08' AS Date), 3)
INSERT [dbo].[Sale] ([id], [price], [quantity], [date_of_sale], [id_product]) VALUES (4, 45, 33, CAST(N'2025-03-08' AS Date), 4)
INSERT [dbo].[Sale] ([id], [price], [quantity], [date_of_sale], [id_product]) VALUES (5, 24, 19, CAST(N'2025-03-08' AS Date), 5)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (2, N'	ТОВ "Дистрибуція Плюс"', 2)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (3, N'ФОП "Агропоставка Захід"', 3)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurement] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurement]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Product] SET  READ_WRITE 
GO
