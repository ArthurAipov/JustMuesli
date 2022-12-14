USE [master]
GO
/****** Object:  Database [JustMuesli]    Script Date: 08.08.2022 19:21:11 ******/
CREATE DATABASE [JustMuesli]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JustMuesli', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JustMuesli.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JustMuesli_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JustMuesli_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JustMuesli] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JustMuesli].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JustMuesli] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JustMuesli] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JustMuesli] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JustMuesli] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JustMuesli] SET ARITHABORT OFF 
GO
ALTER DATABASE [JustMuesli] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JustMuesli] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JustMuesli] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JustMuesli] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JustMuesli] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JustMuesli] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JustMuesli] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JustMuesli] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JustMuesli] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JustMuesli] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JustMuesli] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JustMuesli] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JustMuesli] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JustMuesli] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JustMuesli] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JustMuesli] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JustMuesli] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JustMuesli] SET RECOVERY FULL 
GO
ALTER DATABASE [JustMuesli] SET  MULTI_USER 
GO
ALTER DATABASE [JustMuesli] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JustMuesli] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JustMuesli] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JustMuesli] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JustMuesli] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JustMuesli] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JustMuesli', N'ON'
GO
ALTER DATABASE [JustMuesli] SET QUERY_STORE = OFF
GO
USE [JustMuesli]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muesli]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muesli](
	[Id] [int] NOT NULL,
	[NameDE] [nvarchar](300) NOT NULL,
	[NameEN] [nvarchar](300) NOT NULL,
	[Protein] [float] NOT NULL,
	[Carbohydrate] [float] NOT NULL,
	[Fat] [float] NOT NULL,
	[TypeId] [int] NOT NULL,
	[PortionSize] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Muesli] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuesliIngredient]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuesliIngredient](
	[MuesliId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
 CONSTRAINT [PK_MuesliIngredient] PRIMARY KEY CLUSTERED 
(
	[MuesliId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuesliMix]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuesliMix](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[CreateDate] [date] NULL,
	[UserId] [int] NOT NULL,
	[Price] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MuesliMix] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuesliMixMuesli]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuesliMixMuesli](
	[MuesliMixId] [int] NOT NULL,
	[MuesliId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_MuesliMixMuesli_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMuesli]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMuesli](
	[MuesliId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Size] [bit] NULL,
	[Quantity] [nvarchar](max) NOT NULL,
	[TotalPrice] [nvarchar](120) NULL,
 CONSTRAINT [PK_OrderMuesli] PRIMARY KEY CLUSTERED 
(
	[MuesliId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08.08.2022 19:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Zip] [int] NOT NULL,
	[City] [nvarchar](200) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (1, N'Абхазия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (2, N'Австралия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (3, N'Австрия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (4, N'Азербайджан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (5, N'Албания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (6, N'Алжир')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (7, N'Ангола')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (8, N'Андорра')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (9, N'Антигуа и Барбуда')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (10, N'Аргентина')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (11, N'Армения')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (12, N'Афганистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (13, N'Багамские Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (14, N'Бангладеш')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (15, N'Барбадос')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (16, N'Бахрейн')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (17, N'Белиз')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (18, N'Белоруссия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (19, N'Бельгия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (20, N'Бенин')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (21, N'Болгария')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (22, N'Боливия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (23, N'Босния и Герцеговина')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (24, N'Ботсвана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (25, N'Бразилия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (26, N'Бруней')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (27, N'Буркина-Фасо')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (28, N'Бурунди')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (29, N'Бутан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (30, N'Вануату')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (31, N'Ватикан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (32, N'Великобритания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (33, N'Венгрия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (34, N'Венесуэла')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (35, N'Восточный Тимор')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (36, N'Вьетнам')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (37, N'Габон')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (38, N'Гаити')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (39, N'Гайана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (40, N'Гамбия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (41, N'Гана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (42, N'Гватемала')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (43, N'Гвинея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (44, N'Гвинея-Бисау')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (45, N'Германия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (46, N'Гондурас')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (47, N'Государство Палестина')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (48, N'Гренада')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (49, N'Греция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (50, N'Грузия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (51, N'Дания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (52, N'Джибути')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (53, N'Доминика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (54, N'Доминиканская Республика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (55, N'ДР Конго')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (56, N'Египет')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (57, N'Замбия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (58, N'Зимбабве')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (59, N'Израиль')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (60, N'Индия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (61, N'Индонезия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (62, N'Иордания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (63, N'Ирак')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (64, N'Иран')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (65, N'Ирландия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (66, N'Исландия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (67, N'Испания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (68, N'Италия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (69, N'Йемен')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (70, N'Кабо-Верде')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (71, N'Казахстан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (72, N'Камбоджа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (73, N'Камерун')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (74, N'Канада')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (75, N'Катар')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (76, N'Кения')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (77, N'Кипр')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (78, N'Киргизия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (79, N'Кирибати')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (80, N'Китай')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (81, N'КНДР')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (82, N'Колумбия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (83, N'Коморские Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (84, N'Коста-Рика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (85, N'Кот-д''Ивуар')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (86, N'Куба')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (87, N'Кувейт')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (88, N'Лаос')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (89, N'Латвия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (90, N'Лесото')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (91, N'Либерия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (92, N'Ливан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (93, N'Ливия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (94, N'Литва')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (95, N'Лихтенштейн')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (96, N'Люксембург')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (97, N'Маврикий')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (98, N'Мавритания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (99, N'Мадагаскар')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (100, N'Малави')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (101, N'Малайзия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (102, N'Мали')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (103, N'Мальдивские Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (104, N'Мальта')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (105, N'Марокко')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (106, N'Маршалловы Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (107, N'Мексика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (108, N'Мозамбик')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (109, N'Молдавия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (110, N'Монако')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (111, N'Монголия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (112, N'Мьянма')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (113, N'Намибия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (114, N'Науру')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (115, N'Непал')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (116, N'Нигер')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (117, N'Нигерия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (118, N'Нидерланды')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (119, N'Никарагуа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (120, N'Новая Зеландия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (121, N'Норвегия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (122, N'ОАЭ')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (123, N'Оман')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (124, N'Пакистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (125, N'Палау')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (126, N'Панама')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (127, N'Папуа - Новая Гвинея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (128, N'Парагвай')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (129, N'Перу')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (130, N'Польша')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (131, N'Португалия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (132, N'Республика Конго')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (133, N'Республика Корея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (134, N'Россия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (135, N'Руанда')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (136, N'Румыния')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (137, N'Сальвадор')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (138, N'Самоа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (139, N'Сан-Марино')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (140, N'Сан-Томе и Принсипи')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (141, N'Саудовская Аравия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (142, N'Северная Македония')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (143, N'Сейшельские Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (144, N'Сенегал')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (145, N'Сент-Винсент и Гренадины')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (146, N'Сент-Китс и Невис')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (147, N'Сент-Люсия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (148, N'Сербия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (149, N'Сингапур')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (150, N'Сирия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (151, N'Словакия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (152, N'Словения')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (153, N'Соломоновы Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (154, N'Сомали')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (155, N'Судан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (156, N'Суринам')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (157, N'США')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (158, N'Сьерра-Леоне')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (159, N'Таджикистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (160, N'Таиланд')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (161, N'Танзания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (162, N'Того')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (163, N'Тонга')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (164, N'Тринидад и Тобаго')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (165, N'Тувалу')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (166, N'Тунис')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (167, N'Туркмения')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (168, N'Турция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (169, N'Уганда')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (170, N'Узбекистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (171, N'Украина')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (172, N'Уругвай')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (173, N'Федеративные Штаты Микронезии')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (174, N'Фиджи')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (175, N'Филиппины')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (176, N'Финляндия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (177, N'Франция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (178, N'Хорватия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (179, N'ЦАР')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (180, N'Чад')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (181, N'Черногория')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (182, N'Чехия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (183, N'Чили')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (184, N'Швейцария')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (185, N'Швеция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (186, N'Шри-Ланка')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (187, N'Эквадор')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (188, N'Экваториальная Гвинея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (189, N'Эритрея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (190, N'Эсватини')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (191, N'Эстония')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (192, N'Эфиопия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (193, N'ЮАР')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (194, N'Южная Осетия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (195, N'Южный Судан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (196, N'Ямайка')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (197, N'Япония')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (198, N'Авдаленд')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (199, N'Азавад')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (200, N'Азад Джамму и Кашмир')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (201, N'Азания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (202, N'Вазиристан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (203, N'Галмудуг')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (204, N'Государство Ва')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (205, N'Государство Шан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (206, N'Джубаленд')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (207, N'Донецкая Народная Республика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (208, N'Китайская Республика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (209, N'Луганская Народная Республика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (210, N'Мальтийский орден')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (211, N'Нагорно-Карабахская Республика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (212, N'Приднестровская Молдавская Республика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (213, N'Пунтленд')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (214, N'Республика Косово')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (215, N'Сахарская Арабская Демократическая Республика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (216, N'Силенд')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (217, N'Сомалиленд')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (218, N'Турецкая Республика Северного Кипра')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (219, N'Химан и Хеб')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (220, N'Азорские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (221, N'Аландские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (222, N'Американское Самоа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (223, N'Ангилья')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (224, N'Антарктида')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (225, N'Аруба')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (226, N'Бермудские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (227, N'Бир-Тавиль')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (228, N'Бонэйр')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (229, N'Британская территория в Индийском океане')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (230, N'Британские Виргинские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (231, N'Виргинские острова США')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (232, N'Гавайи')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (233, N'Гваделупа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (234, N'Гвиана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (235, N'Гернси')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (236, N'Гибралтар')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (237, N'Голанские высоты')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (238, N'Гонконг')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (239, N'Гренландия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (240, N'Гуам')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (241, N'Джерси')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (242, N'Каймановы острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (243, N'Канарские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (244, N'Кокосовые острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (245, N'Кука острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (246, N'Кюрасао')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (247, N'Мадейра')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (248, N'Майотта')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (249, N'Макао')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (250, N'Мартиника')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (251, N'Мелилья')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (252, N'Монтсеррат')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (253, N'Ниуэ')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (254, N'Новая Каледония')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (255, N'Остров Мэн')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (256, N'Остров Норфолк')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (257, N'Остров Рождества')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (258, N'Острова Питкэрн')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (259, N'Острова Святой Елены')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (260, N'Пуэрто-Рико')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (261, N'Реюньон')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (262, N'Саба')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (263, N'Северные Марианские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (264, N'Сен-Бартелеми')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (265, N'Сен-Мартен')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (266, N'Сен-Пьер и Микелон')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (267, N'Сеута')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (268, N'Синт-Мартен')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (269, N'Синт-Эстатиус')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (270, N'Теркс и Кайкос')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (271, N'Токелау')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (272, N'Уоллис и Футуна')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (273, N'Фарерские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (274, N'Фолклендские острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (275, N'Французская Полинезия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (276, N'Французские Южные и Антарктические территории')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (277, N'Шпицберген')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (278, N'Южная Георгия и Южные Сандвичевы острова')
GO
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (1, N'spelt flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (2, N'porridge oats')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (3, N'corn')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (4, N'wheat flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (5, N'oatmeal')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (6, N'einkorn flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (7, N'rolled oats')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (8, N'amaranth')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (9, N'spelt')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (10, N'quinoa')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (11, N'wheat')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (12, N'buckwheat')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (13, N'soy flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (14, N'millet flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (15, N'rice pellets')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (16, N'wheat bran')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (17, N'oat bran')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (18, N'barley flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (19, N'banana chips')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (20, N'cranberries')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (21, N'papaya')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (22, N'mango')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (23, N'dates')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (24, N'figs')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (25, N'pineapple')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (26, N'melon')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (27, N'guava')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (28, N'coconut chips')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (29, N'coconut flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (30, N'apple')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (31, N'prune')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (32, N'redcurrant')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (33, N'sour cherry')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (34, N'apricot')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (35, N'currants')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (36, N'sultanas')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (37, N'grapes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (38, N'raspberries')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (39, N'strawberries')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (40, N'blackberries')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (41, N'aloe vera')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (42, N'goji berries')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (43, N'mulberries')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (44, N'almonds')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (45, N'hazelnuts')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (46, N'peanuts')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (47, N'pumpkin seeds')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (48, N'sunflower seeds')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (49, N'sesame')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (50, N'poppy seed')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (51, N'pine nuts')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (52, N'macadamia')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (53, N'flax seed')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (54, N'walnut')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (55, N'apricot kernels')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (56, N'pecan')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (57, N'para nut')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (58, N'cashews')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (59, N'cane sugar')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (60, N'sugar')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (61, N'raw cane sugar')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (62, N'rice flour')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (63, N'rice')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (64, N'peanut')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (65, N'raisins')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (66, N'cocoa')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (67, N'cinnamon')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (68, N'ginger')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (69, N'bee pollen')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (70, N'bourbon vanille')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (71, N'guarana')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (72, N'sugar cane')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (73, N'emmer')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (74, N'honey')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (75, N'whole milk powder')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (76, N'cocoa mass')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (77, N'cocoa butter')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (78, N'wheat flour')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (79, N'cardamom')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (80, N'salt')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (81, N'oat flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (82, N'palm oil')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (83, N'spelled flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (84, N'oats')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (85, N'sea salt')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (86, N'egg white')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (87, N'coconut oil')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (88, N'rice syrup')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (89, N'apple pieces')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (90, N'sunflower lecithin')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (91, N'barley')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (92, N'corn malt')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (93, N'milk powder')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (94, N'coffee')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (95, N'whole grain spelled flour')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (96, N'cocoa powder')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (97, N'milk sugar')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (98, N'sea salt.')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (99, N'coconut')
GO
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (100, N'rye flakes')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (101, N'soy lecithin')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (102, N'sodium bicarbonate')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (103, N'peanut oil')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (104, N'vitamins')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (105, N'malted barley')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (106, N'vanillin')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (107, N'ammonium bicarbonate')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (108, N'chocolate powder')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (109, N'gum arabic')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (110, N'aroma')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (111, N'sunflower oil')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (112, N'glucose syrup')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (113, N'lactose')
INSERT [dbo].[Ingredient] ([Id], [Name]) VALUES (114, N'skimmed milk powder')
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
GO
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (1, N'Dinkelflocken', N'Spelt Flakes', 14, 64, 2.6, 1, 600, 4.55)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (2, N'Haferflocken', N'Porridge Oats', 12, 58.7, 7.3, 1, 600, 4.55)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (3, N'Cornflakes', N'Cornflakes', 8, 83.3, 1.1, 1, 600, 4.55)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (4, N'Guten Morgen', N'Good Morning', 11, 61.3, 2.9, 1, 600, 4.55)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (5, N'Hafercrumble', N'Oat Crunchies', 11, 62.7, 10, 1, 600, 5.2)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (6, N'Dinkelcrumble', N'Spelt Crunchies', 13, 64.5, 6.6, 1, 600, 5.2)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (7, N'Rittermischung', N'Knights Blend', 12, 61.7, 2, 1, 600, 4.55)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (8, N'7-Korn', N'Seven Grains', 11, 61.7, 2.6, 1, 600, 4.55)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (9, N'Apfel-Zimt Crunch', N'Apple Cinnamon Crunch ', 10, 71, 5, 2, 50, 0.7)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (10, N'Amaranth', N'Amaranth', 9, 64, 4.5, 2, 10, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (11, N'Dinkelpuffer', N'Spelt Puffs', 11, 66, 5.5, 2, 20, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (12, N'Quinoa', N'Quinoa', 10, 60, 4, 2, 10, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (13, N'Dinkelflocken', N'Spelt Flakes', 14, 64, 2.6, 2, 25, 0.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (14, N'Haferflocken', N'Porridge Oats', 11, 58.7, 7.3, 2, 25, 0.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (15, N'Cornflakes', N'Cornflakes', 14, 64.6, 1.1, 2, 20, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (16, N'Hafercrumble', N'Oat Crunchies', 9, 64.5, 8, 2, 70, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (17, N'Dinkelcrumble', N'Spelt Crunchies', 11, 64.2, 3.8, 2, 75, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (18, N'Weizenpuffer', N'Wheat Puffs', 11, 64, 2.6, 2, 15, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (19, N'Weizenflakes', N'Wheat Flakes', 12, 64.2, 2.6, 2, 25, 0.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (20, N'Buchweizen', N'Buckwheat', 10, 64, 2.6, 2, 20, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (21, N'Sojaflocken', N'Soy Flakes', 25, 45, 9, 2, 25, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (22, N'Hirseflocken', N'Millet Flakes', 8, 65, 2.7, 2, 25, 0.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (23, N'Reiskugeln', N'Rice Pellets', 5, 67, 2.5, 2, 20, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (24, N'Weizenkleie', N'Wheat Bran', 8, 58, 2.7, 2, 15, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (25, N'Haferkleie', N'Oat Bran', 8, 64, 2.8, 2, 25, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (26, N'Gerstenflocken', N'Barley Flakes', 5, 64, 2.6, 2, 25, 0.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (27, N'Bananenchips', N'Banana Chips', 4, 63, 4.4, 5, 40, 0.5)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (28, N'Cranberries', N'Cranberries', 3.5, 65, 4.2, 5, 25, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (29, N'Papaya', N'Papaya', 2.5, 63, 2.5, 5, 40, 1.1)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (30, N'Mango', N'Mango', 3, 63, 2.6, 5, 35, 1)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (31, N'Datteln', N'Dates', 4.5, 65, 2.4, 5, 45, 0.6)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (32, N'Feigen', N'Figs', 2.3, 61, 2.6, 5, 40, 0.6)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (33, N'Ananas', N'Pineapple', 1.5, 64, 2.5, 5, 30, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (34, N'Melone', N'Melon', 1, 68, 2.5, 5, 40, 0.65)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (35, N'Guave', N'Guava', 2, 71, 2.4, 5, 40, 0.6)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (36, N'Kokoschips', N'Coconut Chips', 13, 48, 18, 5, 20, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (37, N'Kokosraspeln', N'Coconut Flakes', 13, 48, 18, 5, 20, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (38, N'Apfel', N'Apple', 2, 72, 2.5, 3, 30, 0.7)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (39, N'Pflaume', N'Prune', 2.4, 59, 2.5, 3, 40, 0.65)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (40, N'Johannisbeere', N'Redcurrant', 1.8, 62, 2.6, 3, 10, 1)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (41, N'Sauerkirschen', N'Sour Cherry', 2, 67, 2.5, 3, 25, 1.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (42, N'Aprikose', N'Apricot', 2.5, 55, 2.4, 3, 45, 0.6)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (43, N'Korinthen', N'Currants', 2, 63, 1, 3, 40, 0.5)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (44, N'Sultaninen', N'Sultanas', 2.5, 66, 0.6, 3, 50, 0.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (45, N'Weinbeeren', N'Grapes', 1.5, 67, 1, 3, 50, 0.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (46, N'Himbeeren', N'Raspberries', 1.8, 62, 1, 3, 12, 1.3)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (47, N'Erdbeeren', N'Strawberries', 2.5, 63, 0.5, 3, 10, 1.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (48, N'Brombeeren', N'Blackberries', 2.5, 57, 0.5, 3, 10, 1.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (49, N'Aloe-Vera', N'Aloe Vera', 0.5, 36, 0.1, 3, 30, 0.6)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (50, N'Gojibeere', N'Goji Berries', 10, 55, 5, 3, 20, 1.5)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (51, N'Maulbeeren', N'Mulberries', 7, 48, 0.1, 3, 30, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (52, N'Mandeln', N'Almonds', 18.7, 5.7, 54, 3, 30, 0.8)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (53, N'Haselnüsse', N'Hazelnuts', 16, 6, 63, 3, 30, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (54, N'Erdnüsse', N'Peanuts', 27, 9, 53, 3, 35, 0.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (55, N'Kürbiskerne', N'Pumpkin Seeds', 25, 18, 46, 3, 30, 0.5)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (56, N'Sonnenblumenkerne', N'Sunflower Seeds', 26, 34, 23, 3, 30, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (57, N'Sesam', N'Sesame', 17, 10, 50, 3, 25, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (58, N'Blaumohn', N'Poppy Seed', 20, 4, 42, 3, 25, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (59, N'Pinienkerne', N'Pine Nuts', 13, 20, 60, 3, 15, 1.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (60, N'Macadamia', N'Macadamia', 7.5, 13, 73, 3, 25, 1.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (61, N'Leinsamen', N'Flax Seed', 24, 5, 30, 3, 20, 0.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (62, N'Walnüsse', N'Walnut', 14, 10, 62, 3, 30, 0.7)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (63, N'Aprikosenkerne', N'Apricot Kernels', 25, 13, 50, 4, 30, 0.7)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (64, N'Pekannuss', N'Pecan', 10, 5, 72, 4, 25, 1.1)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (65, N'Paranuss', N'Para Nut', 14, 3, 67, 4, 40, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (66, N'Cashewkerne', N'Cashews', 21, 22, 47, 4, 30, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (67, N'Schokoherzen', N'Chocolate Hearts', 5, 61, 30, 4, 40, 0.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (68, N'Edelbitterschokolade', N'Dark Chocolate', 7, 33, 42, 4, 40, 0.8)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (69, N'Vollmilchschokolade', N'Milk Chocolate', 7, 55, 31, 4, 40, 0.65)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (70, N'Weisse Schokolade', N'White Chocolate', 4, 63, 29, 4, 30, 0.7)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (71, N'Nougat-Kissen', N'Nougat pillows', 5, 71, 17, 4, 35, 0.5)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (72, N'Schokopuffer', N'Chocolate Puffs', 4, 65, 15, 4, 25, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (73, N'Schoko-Flakes', N'Chocolate flakes', 4, 66, 15, 4, 30, 0.5)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (74, N'Erdnuss-Chocs', N'Peanut chocs', 9, 60, 25, 4, 40, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (75, N'Rosinen-Chocs', N'Raisin chocs', 2, 65, 18, 4, 40, 0.8)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (76, N'Espresso-Chocs', N'Espresso chocs', 2, 58, 20, 4, 30, 1.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (77, N'Kakaopulver', N'cocoa', 19, 9, 20, 4, 10, 0.25)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (78, N'Zimt-Kardamon', N'Cinnamon-Cardamom', 3, 56, 3, 6, 4, 0.35)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (79, N'Amarettini', N'Amarettini', 7, 77, 10, 6, 20, 0.4)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (80, N'Ingwer', N'Ginger', 1, 9, 1, 6, 20, 0.45)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (81, N'Blütenpollen', N'Bee Pollen', 24, 43.8, 4.8, 6, 20, 0.85)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (82, N'Bourbon-Vanille', N'Bourbon Vanille', 0, 0, 0, 6, 2, 0.5)
INSERT [dbo].[Muesli] ([Id], [NameDE], [NameEN], [Protein], [Carbohydrate], [Fat], [TypeId], [PortionSize], [Price]) VALUES (83, N'Guarana', N'Guarana', 0, 0, 0, 6, 3, 0.45)
GO
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (1, 1)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (2, 2)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (3, 3)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (3, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (4, 4)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (4, 18)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (5, 5)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (5, 61)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (5, 74)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (5, 87)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (5, 98)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (6, 1)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (6, 72)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (6, 85)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (6, 88)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (6, 95)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (6, 99)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (7, 4)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (7, 6)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (7, 73)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (7, 80)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (8, 4)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (8, 5)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (8, 6)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (8, 18)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (8, 73)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (8, 81)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (8, 100)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 4)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 7)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 8)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 67)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 74)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 82)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 85)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 89)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (9, 103)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (10, 8)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (10, 82)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (11, 9)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (11, 74)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (11, 83)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (12, 10)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (12, 83)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (13, 1)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (13, 61)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (14, 2)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (15, 3)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (15, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (16, 5)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (16, 61)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (16, 74)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (16, 87)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (16, 98)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (17, 1)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (17, 72)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (17, 85)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (17, 88)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (17, 95)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (17, 99)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (18, 11)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (18, 74)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (19, 3)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (19, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (19, 80)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (20, 12)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (20, 82)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (21, 13)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (21, 82)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (22, 14)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (23, 15)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (23, 80)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (24, 16)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (25, 17)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (26, 18)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (27, 19)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (28, 20)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (29, 21)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (30, 22)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (31, 23)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (32, 24)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (33, 25)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (34, 26)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (35, 27)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (36, 28)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (37, 29)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (38, 30)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (39, 31)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (40, 32)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (41, 33)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (42, 34)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (43, 35)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (44, 36)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (45, 37)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (46, 38)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (47, 39)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (48, 40)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (49, 41)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (50, 42)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (51, 43)
GO
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (52, 44)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (53, 45)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (54, 46)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (55, 47)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (56, 48)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (57, 49)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (58, 50)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (59, 51)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (60, 52)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (61, 53)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (62, 54)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (63, 55)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (64, 56)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (65, 57)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (66, 58)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (67, 59)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (67, 75)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (67, 77)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (68, 59)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (68, 75)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (68, 77)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (69, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (69, 76)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (69, 90)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (70, 61)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (70, 77)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 16)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 45)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 62)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 76)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 78)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 80)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 96)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 101)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 104)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 108)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 111)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 113)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (71, 114)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (72, 11)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (72, 63)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (72, 66)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (72, 72)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (72, 76)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (72, 91)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (72, 105)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (73, 3)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (73, 59)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (73, 75)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (73, 76)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (73, 77)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (73, 92)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (73, 109)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 64)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 75)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 77)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 93)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 101)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 106)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 109)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (74, 112)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 65)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 75)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 77)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 101)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 106)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 109)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (75, 112)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 76)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 77)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 84)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 94)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 101)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 106)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 109)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (76, 112)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (77, 66)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (77, 85)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (78, 67)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (78, 76)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (78, 79)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 55)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 60)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 76)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 78)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 97)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 102)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 107)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (79, 110)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (80, 68)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (80, 75)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (81, 69)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (82, 70)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (83, 71)
INSERT [dbo].[MuesliIngredient] ([MuesliId], [IngredientId]) VALUES (83, 86)
GO
SET IDENTITY_INSERT [dbo].[MuesliMix] ON 

INSERT [dbo].[MuesliMix] ([Id], [Name], [CreateDate], [UserId], [Price]) VALUES (12, N'asdf', CAST(N'2022-08-04' AS Date), 2, N'5,95')
INSERT [dbo].[MuesliMix] ([Id], [Name], [CreateDate], [UserId], [Price]) VALUES (13, N'zxc', CAST(N'2022-08-04' AS Date), 2, N'6,35')
SET IDENTITY_INSERT [dbo].[MuesliMix] OFF
GO
SET IDENTITY_INSERT [dbo].[MuesliMixMuesli] ON 

INSERT [dbo].[MuesliMixMuesli] ([MuesliMixId], [MuesliId], [Id]) VALUES (13, 1, 4)
INSERT [dbo].[MuesliMixMuesli] ([MuesliMixId], [MuesliId], [Id]) VALUES (13, 9, 5)
INSERT [dbo].[MuesliMixMuesli] ([MuesliMixId], [MuesliId], [Id]) VALUES (13, 9, 6)
INSERT [dbo].[MuesliMixMuesli] ([MuesliMixId], [MuesliId], [Id]) VALUES (13, 10, 7)
INSERT [dbo].[MuesliMixMuesli] ([MuesliMixId], [MuesliId], [Id]) VALUES (12, 1, 10)
INSERT [dbo].[MuesliMixMuesli] ([MuesliMixId], [MuesliId], [Id]) VALUES (12, 9, 11)
SET IDENTITY_INSERT [dbo].[MuesliMixMuesli] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Price], [UserId]) VALUES (5, N'18,6075', 2)
INSERT [dbo].[Order] ([Id], [Price], [UserId]) VALUES (6, N'50,43', 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderMuesli] ([MuesliId], [OrderId], [Size], [Quantity], [TotalPrice]) VALUES (12, 5, 0, N'1', NULL)
INSERT [dbo].[OrderMuesli] ([MuesliId], [OrderId], [Size], [Quantity], [TotalPrice]) VALUES (12, 6, 1, N'1', NULL)
INSERT [dbo].[OrderMuesli] ([MuesliId], [OrderId], [Size], [Quantity], [TotalPrice]) VALUES (13, 5, 0, N'1', NULL)
INSERT [dbo].[OrderMuesli] ([MuesliId], [OrderId], [Size], [Quantity], [TotalPrice]) VALUES (13, 6, 1, N'1', NULL)
GO
INSERT [dbo].[Type] ([Id], [Name]) VALUES (1, N'Basics')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (2, N'Cereal')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (3, N'Fruit')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (4, N'Nuts & Co')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (5, N'Choco')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (6, N'Specials')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Zip], [City], [CountryId], [Phone], [Email], [Password], [Address]) VALUES (2, N'123412341324', 1, N'1', 184, N'1', N'1', N'1', N'1')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Muesli]  WITH CHECK ADD  CONSTRAINT [FK_Muesli_Type1] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[Muesli] CHECK CONSTRAINT [FK_Muesli_Type1]
GO
ALTER TABLE [dbo].[MuesliIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MuesliIngredient_Ingredient] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([Id])
GO
ALTER TABLE [dbo].[MuesliIngredient] CHECK CONSTRAINT [FK_MuesliIngredient_Ingredient]
GO
ALTER TABLE [dbo].[MuesliIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MuesliIngredient_Muesli] FOREIGN KEY([MuesliId])
REFERENCES [dbo].[Muesli] ([Id])
GO
ALTER TABLE [dbo].[MuesliIngredient] CHECK CONSTRAINT [FK_MuesliIngredient_Muesli]
GO
ALTER TABLE [dbo].[MuesliMix]  WITH CHECK ADD  CONSTRAINT [FK_MuesliMix_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MuesliMix] CHECK CONSTRAINT [FK_MuesliMix_User]
GO
ALTER TABLE [dbo].[MuesliMixMuesli]  WITH CHECK ADD  CONSTRAINT [FK_MuesliMixMuesli_Muesli1] FOREIGN KEY([MuesliId])
REFERENCES [dbo].[Muesli] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MuesliMixMuesli] CHECK CONSTRAINT [FK_MuesliMixMuesli_Muesli1]
GO
ALTER TABLE [dbo].[MuesliMixMuesli]  WITH CHECK ADD  CONSTRAINT [FK_MuesliMixMuesli_MuesliMix1] FOREIGN KEY([MuesliMixId])
REFERENCES [dbo].[MuesliMix] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MuesliMixMuesli] CHECK CONSTRAINT [FK_MuesliMixMuesli_MuesliMix1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderMuesli]  WITH CHECK ADD  CONSTRAINT [FK_OrderMuesli_MuesliMix] FOREIGN KEY([MuesliId])
REFERENCES [dbo].[MuesliMix] ([Id])
GO
ALTER TABLE [dbo].[OrderMuesli] CHECK CONSTRAINT [FK_OrderMuesli_MuesliMix]
GO
ALTER TABLE [dbo].[OrderMuesli]  WITH CHECK ADD  CONSTRAINT [FK_OrderMuesli_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderMuesli] CHECK CONSTRAINT [FK_OrderMuesli_Order]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Country]
GO
USE [master]
GO
ALTER DATABASE [JustMuesli] SET  READ_WRITE 
GO
