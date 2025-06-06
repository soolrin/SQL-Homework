USE [master]
GO
/****** Object:  Database [Product]    Script Date: 22.03.2025 6:13:20 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 22.03.2025 6:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
	[price] [float] NULL,
	[discount] [float] NULL,
	[quantity] [int] NULL,
	[measurement] [nvarchar](50) NULL,
	[producer] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[supplier] [nvarchar](50) NULL,
	[date_of_delivery] [date] NULL,
	[expire_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (15, N'Яблоки Голден', N'Фрукты', 31.5, 11, 120, N'кг', N'Сады Украины', N'Украина', N'АгроТрейд', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (16, N'Яблоки Фуджи', N'Фрукты', 32.2, 5, 100, N'кг', N'FreshGarden', N'Украина', N'FreshLine', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (17, N'Бананы Кавендиш', N'Фрукты', 35.75, 9, 250, N'кг', N'Dole', N'Эквадор', N'ФруктЭксп', CAST(N'2025-03-01' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (18, N'Апельсины Навел', N'Фрукты', 68.9, 1, 180, N'кг', N'SunFruits', N'Испания', N'CitrusTrade', CAST(N'2025-02-28' AS Date), CAST(N'2025-03-14' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (19, N'Апельсины Валенсия', N'Фрукты', 69.5, 3, 140, N'кг', N'OrangeFarm', N'Марокко', N'FruitWorld', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (20, N'Груши Конференция', N'Фрукты', 29.8, 4, 130, N'кг', N'ГринАгро', N'Украина', N'FreshLine', CAST(N'2025-03-05' AS Date), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (21, N'Груши Вильямс', N'Фрукты', 30.25, 6, 110, N'кг', N'PearLand', N'Аргентина', N'AgriImport', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (22, N'Клубника импортная', N'Фрукты', 145.6, 2, 90, N'кг', N'BerryWorld', N'Испания', N'ExoticFruit', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (23, N'Виноград Кишмиш', N'Фрукты', 74.3, 3, 85, N'кг', N'SunnyGrapes', N'Турция', N'VinImport', CAST(N'2025-03-01' AS Date), CAST(N'2025-03-14' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (24, N'Виноград Изабелла', N'Фрукты', 73.9, 5, 95, N'кг', N'ВинАгро', N'Украина', N'LocalFruits', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (25, N'Персики Красные', N'Фрукты', 82.75, 7, 75, N'кг', N'PeachValley', N'Грузия', N'CaucasusFruit', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (26, N'Сливы Венгерка', N'Фрукты', 52.4, 4, 110, N'кг', N'PlumGarden', N'Украина', N'FreshTrade', CAST(N'2025-03-05' AS Date), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (27, N'Ананасы Голд', N'Фрукты', 128.5, 6, 60, N'кг', N'TropicFarms', N'Коста-Рика', N'ExoticImport', CAST(N'2025-03-01' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (28, N'Манго Кент', N'Фрукты', 155.8, 7, 50, N'кг', N'MangoWorld', N'Перу', N'TropicFruit', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (29, N'Авокадо Хасс', N'Фрукты', 138.9, 3, 55, N'кг', N'AvocadoFarm', N'Мексика', N'GreenTrade', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (30, N'Картофель молодой', N'Овощи', 18.75, 14, 300, N'кг', N'АгроФарм', N'Украина', N'АгроТрейд', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (31, N'Картофель розовый', N'Овощи', 19.3, 15, 280, N'кг', N'ЭкоАгро', N'Украина', N'FreshLine', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (32, N'Морковь столовая', N'Овощи', 14.5, 1, 250, N'кг', N'АгроФарм', N'Украина', N'LocalFarms', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (33, N'Лук репчатый белый', N'Овощи', 12.75, 5, 220, N'кг', N'GreenLand', N'Украина', N'FreshTrade', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (34, N'Лук красный', N'Овощи', 15.2, 7, 200, N'кг', N'АгроФарм', N'Украина', N'FreshLine', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (35, N'Свекла бордо', N'Овощи', 13.4, 32, 210, N'кг', N'EcoGarden', N'Украина', N'АгроТрейд', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (36, N'Огурцы гладкие', N'Овощи', 62.9, 6, 180, N'кг', N'FreshGreen', N'Украина', N'GreenTrade', CAST(N'2025-03-01' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (37, N'Огурцы колючие', N'Овощи', 64.5, 3, 170, N'кг', N'FreshLand', N'Украина', N'LocalFarms', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (38, N'Помидоры черри', N'Овощи', 89.3, 11, 160, N'кг', N'TomatoFarm', N'Украина', N'FreshLine', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (39, N'Помидоры розовые', N'Овощи', 78.9, 2, 150, N'кг', N'GreenHouse', N'Турция', N'VinImport', CAST(N'2025-03-01' AS Date), CAST(N'2025-03-14' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (40, N'Кабачки молодые', N'Овощи', 48.7, 16, 140, N'кг', N'AgroEco', N'Украина', N'AgroTrade', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (41, N'Перец сладкий красный', N'Овощи', 95.6, 2, 130, N'кг', N'SunnyFarm', N'Испания', N'ExoticFruit', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (42, N'Перец желтый', N'Овощи', 98.4, 7, 120, N'кг', N'GreenFarm', N'Нидерланды', N'FreshTrade', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (43, N'Баклажаны', N'Овощи', 72.25, 8, 110, N'кг', N'SunHarvest', N'Турция', N'LocalFarms', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (44, N'	Капуста белокочанная', N'Овощи', 22.8, 5, 300, N'кг', N'AgroLand', N'Украина', N'GreenTrade', CAST(N'2025-03-01' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (45, N'Капуста пекинская', N'Овощи', 41.3, 9, 200, N'кг', N'FreshHarvest', N'Китай', N'VinImport', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (46, N'Капуста цветная', N'Овощи', 79.9, 10, 180, N'кг', N'GreenFarm', N'Украина', N'AgroTrade', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (47, N'Молоко Простонаше 1%', N'Молочная продукция', 52.42, 2, 100, N'л', N'Простоквашино', N'Украина', N'Metro', CAST(N'2025-03-05' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (48, N'Молоко Яготинское 2,6%', N'Молочная продукция', 55.35, 9, 120, N'л', N'Яготинский молочный комбинат', N'Украина', N'Auchan', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (49, N'Кефир Селянский 2,5%', N'Молочная продукция', 58.18, 12, 150, N'л', N'Селянський', N'Украина', N'Megamarket', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (50, N'Масло сливочное Селянське 72,5%', N'Молочная продукция', 108.93, 3, 50, N'кг', N'Селянський', N'Украина', N'Metro', CAST(N'2025-03-02' AS Date), CAST(N'2025-05-07' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (51, N'Сметана Президент 15%', N'Молочная продукция', 53.99, 7, 70, N'кг', N'Президент', N'Украина', N'Novus', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (52, N'Сыр твердый Звени Гора голландский 45%', N'Молочная продукция', 592.73, 1, 130, N'кг', N'Звени Гора', N'Украина', N'Metro', CAST(N'2025-03-10' AS Date), CAST(N'2025-06-14' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (53, N'Сыр твердый Комо традиционный 50%', N'Молочная продукция', 548.5, 4, 120, N'кг', N'Комо', N'Украина', N'Auchan', CAST(N'2025-03-14' AS Date), CAST(N'2025-06-10' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (54, N'Творог Простонаше 9%', N'Молочная продукция', 91.85, 5, 100, N'кг', N'Простоквашино', N'Украина', N'Megamarket', CAST(N'2025-03-02' AS Date), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (55, N'Йогурт Активиа Классический 1,5%', N'Молочная продукция', 35.3, 3, 130, N'л', N'Данон', N'Украина', N'Novus', CAST(N'2025-03-03' AS Date), CAST(N'2025-03-26' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (56, N'Яйца куриные (10 шт.)', N'Молочная продукция', 34.11, 2, 140, N'шт', N'Курочка Ряба', N'Украина', N'Auchan', CAST(N'2025-03-09' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (57, N'Курица целая', N'Мясные продукты', 150, 1, 80, N'кг', N'Мясокомбинат "Перемога"', N'Украина', N'Novus', CAST(N'2025-03-10' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (58, N'Куриные грудки', N'Мясные продукты', 80, 4, 150, N'кг', N'Мясокомбинат "Глобино"', N'Украина', N'Megamarket', CAST(N'2025-03-12' AS Date), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (59, N'Свинина', N'Мясные продукты', 135, 6, 100, N'кг', N'Мясокомбинат "Киевский"', N'Украина', N'Auchan', CAST(N'2025-03-14' AS Date), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (60, N'Котлеты из говядины', N'Мясные продукты', 95, 2, 120, N'кг', N'Мясокомбинат "Смарт"', N'Украина', N'Metro', CAST(N'2025-03-09' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (61, N'Говядина', N'Мясные продукты', 170, 8, 90, N'кг', N'Мясокомбинат "Прогресс"', N'Украина', N'Novus', CAST(N'2025-03-11' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (62, N'Хлеб белый нарезной', N'Хлебобулочные изделия', 22, 1, 150, N'шт', N'Хлебозавод "Киевский"', N'Украина', N'Metro', CAST(N'2025-03-09' AS Date), CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (63, N'Хлеб ржано-пшеничный нарезной', N'Хлебобулочные изделия', 25.5, 3, 130, N'шт', N'Хлебозавод "Хороший хлеб"', N'Украина', N'Auchan', CAST(N'2025-03-11' AS Date), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (64, N'Батон пшеничный', N'Хлебобулочные изделия', 18.3, 5, 200, N'шт', N'Хлебозавод "Киевский"', N'Украина', N'Novus', CAST(N'2025-03-12' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (65, N'Батон с отрубями', N'Хлебобулочные изделия', 21, 2, 180, N'шт', N'Хлебозавод "Малинка"', N'Украина', N'Metro', CAST(N'2025-03-13' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (66, N'Булочки с маком', N'Хлебобулочные изделия', 15, 6, 150, N'шт', N'Хлебозавод "Львівський"', N'Украина', N'Auchan', CAST(N'2025-03-10' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (67, N'Булочки с корицей', N'Хлебобулочные изделия', 16.5, 3, 140, N'шт', N'Хлебозавод "Хороший хлеб"', N'Украина', N'Novus', CAST(N'2025-03-14' AS Date), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (68, N'Хлеб с семечками', N'Хлебобулочные изделия', 28, 7, 130, N'шт', N'Хлебозавод "Гроза"', N'Украина', N'Metro', CAST(N'2025-03-08' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (69, N'Французский багет', N'Хлебобулочные изделия', 22.3, 8, 180, N'шт', N'Хлебозавод "Вік"', N'Украина', N'Megamarket', CAST(N'2025-03-07' AS Date), CAST(N'2025-03-14' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (70, N'Замороженные куриные бедра', N'Замороженные продукты', 118.25, 5, 100, N'шт', N'Mowi', N'Норвегия', N'Metro', CAST(N'2025-03-10' AS Date), CAST(N'2026-03-10' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (71, N'Замороженные креветки (неочищенные)', N'Замороженные продукты', 210.5, 4, 80, N'шт', N'Stavis', N'Латвия', N'Auchan', CAST(N'2025-03-12' AS Date), CAST(N'2026-03-12' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (72, N'Замороженные картофельные пюре', N'Замороженные продукты', 75.8, 7, 150, N'шт', N'McCain', N'Германия', N'Fozzy Group', CAST(N'2025-03-08' AS Date), CAST(N'2026-03-08' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (73, N'Замороженная малина', N'Замороженные продукты', 180, 9, 30, N'шт', N'Driscoll''s', N'США', N'MegaMarket', CAST(N'2025-03-11' AS Date), CAST(N'2026-03-11' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
USE [master]
GO
ALTER DATABASE [Product] SET  READ_WRITE 
GO
