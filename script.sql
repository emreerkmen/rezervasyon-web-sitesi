USE [master]
GO
/****** Object:  Database [EatMe]    Script Date: 3.6.2016 09:56:35 ******/
CREATE DATABASE [EatMe] ON  PRIMARY 
( NAME = N'EatMe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\EatMe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EatMe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\EatMe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EatMe] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EatMe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EatMe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EatMe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EatMe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EatMe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EatMe] SET ARITHABORT OFF 
GO
ALTER DATABASE [EatMe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EatMe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EatMe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EatMe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EatMe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EatMe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EatMe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EatMe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EatMe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EatMe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EatMe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EatMe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EatMe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EatMe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EatMe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EatMe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EatMe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EatMe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EatMe] SET  MULTI_USER 
GO
ALTER DATABASE [EatMe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EatMe] SET DB_CHAINING OFF 
GO
USE [EatMe]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[Isim] [nvarchar](20) NOT NULL,
	[Soyisim] [nvarchar](20) NOT NULL,
	[TelefonNo] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Masa]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masa](
	[No] [int] NOT NULL,
	[RestoranID] [int] NOT NULL,
	[Bos] [bit] NOT NULL,
	[Kapasite] [int] NOT NULL,
	[Saat] [int] NULL,
 CONSTRAINT [PK_Masa] PRIMARY KEY CLUSTERED 
(
	[No] ASC,
	[RestoranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Restoran]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restoran](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
	[Isim] [nvarchar](50) NOT NULL,
	[Tur] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](255) NOT NULL,
	[Kapasite] [int] NOT NULL,
	[AnlikKapasite] [int] NOT NULL,
 CONSTRAINT [PK_Restoran] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rezervasyon]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervasyon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RestoranID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[KisiSayisi] [int] NOT NULL,
	[Tarih] [date] NOT NULL,
	[MasaNo] [int] NOT NULL,
 CONSTRAINT [PK_Rezervasyon_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[RezervasyonID] [int] NOT NULL,
	[RestoranID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[UrunID] [int] NOT NULL,
	[Adet] [int] NOT NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[RezervasyonID] ASC,
	[RestoranID] ASC,
	[MusteriID] ASC,
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urun]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[ID] [int] NOT NULL,
	[RestoranID] [int] NOT NULL,
	[Isim] [nvarchar](50) NOT NULL,
	[MenuTuru] [nvarchar](20) NOT NULL,
	[Icerik] [nvarchar](50) NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[RestoranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([ID], [KullaniciAdi], [Sifre], [Isim], [Soyisim], [TelefonNo]) VALUES (1, N'cagriyildiz', N'.c', N'Çağrı', N'Yıldız', N'5385471938')
INSERT [dbo].[Kullanici] ([ID], [KullaniciAdi], [Sifre], [Isim], [Soyisim], [TelefonNo]) VALUES (7, N'tolgahan', N'ok', N'tolga', N'han', N'02109')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (1, 1, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (1, 2, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (1, 4, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (2, 1, 1, 8, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (2, 2, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (2, 4, 1, 8, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (3, 1, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (3, 2, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (3, 4, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (4, 1, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (4, 2, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (4, 4, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (5, 1, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (5, 2, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (5, 4, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (6, 1, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (6, 2, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (6, 4, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (7, 1, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (7, 4, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (8, 1, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (8, 4, 1, 2, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (9, 1, 1, 8, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (10, 1, 1, 8, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (11, 1, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (12, 1, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (13, 1, 1, 4, NULL)
INSERT [dbo].[Masa] ([No], [RestoranID], [Bos], [Kapasite], [Saat]) VALUES (14, 1, 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Restoran] ON 

INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (1, NULL, NULL, N'Tavacı Recep Usta', N'Et Yemekleri', N'Ataturk Caddesi No:364 Alsancak, İzmir 35220, Türkiye', 60, 60)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (2, NULL, NULL, N'Ristorente Pizzeria Venedik', N'Pizza', N'1382 sokak No 10/B, İzmir 35220, Türkiye', 20, 20)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (4, NULL, NULL, N'Maxwell Burger', N'Cafe', N'Cumhuriyet Bulv. Fransız Kültür Merkezi No:152 | Alsancak', 30, 30)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (8, NULL, NULL, N'Köşebaşı Kordon', N'Et Yemekleri', N'Atatürk Cad. No:174/B | 1.Kordon, izmir, İzmir, Türkiye', 20, 20)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (9, NULL, NULL, N'Cafe Del Mundo', N'Cafe', N'1482 Muzaffer Izgu sok. No;13, İzmir, Türkiye', 20, 20)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (10, NULL, NULL, N'Ciğerci Zarif', N'Et Yemekleri', N'Şehit Fethi Bey Cad. No:61 | Pasaport, Konak, İzmir, Türkiye', 30, 30)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (11, NULL, NULL, N'Deniz Restaurant', N'Et Yemekleri', N'Atatürk Caddesi, No:188/B | İzmir Palas Oteli, Alsancancak', 50, 50)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (12, NULL, NULL, N'Reyhan Pastanesi', N'Pastane', N'Mustafabey Caddesi No:24 Alsancak, İzmir 35220, Türkiye', 40, 40)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (13, NULL, NULL, N'Kaplan Dağ Restaurant', N'Et Yemekleri', N'Kaplan Köyü Tire Merkez, İzmir, Türkiye', 30, 30)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (14, NULL, NULL, N'Bisquitte', N'Cafe', N'Cengiz Topel Caddesi Bostanli, İzmir 35540, Türkiye', 40, 40)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (15, NULL, NULL, N'Mavi Yengec', N'Et Yemekleri', N'Cumhuriyet Bulv. No:26/D | Konak Merkez, Konak, İzmir', 50, 50)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (16, NULL, NULL, N'Peperino Pizza Italiana', N'Pizza', N'Narlidere Quartiere Yenikale Via Sehit Onur Akarsu', 20, 20)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (17, NULL, NULL, N'Antepli Ramazan Usta', N'Kebap', N'Mansuroglu mah. 286/6 no:7 | manavkuyu bayraklı, İzmir', 30, 30)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (18, NULL, NULL, N'Pizza Venedik Express', N'Pizza', N'1379 Sok. No:53/B | Alsancak, Konak, İzmir, Türkiye', 30, 30)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (19, NULL, NULL, N'Doyuran Manisa Kebap Salonu', N'Kebap', N'Kemeralti Mah. 866 Sok. No:14 | Konak Merkez, Konak, İzmir', 40, 40)
INSERT [dbo].[Restoran] ([ID], [KullaniciAdi], [Sifre], [Isim], [Tur], [Adres], [Kapasite], [AnlikKapasite]) VALUES (20, NULL, NULL, N'Sasalı Tuzla Balık', N'Et Yemekleri', N'Ahmet Priştina cad., İzmir 35640, Türkiye', 30, 70)
SET IDENTITY_INSERT [dbo].[Restoran] OFF
SET IDENTITY_INSERT [dbo].[Rezervasyon] ON 

INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (3, 1, 1, 3, CAST(N'2016-05-30' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (4, 1, 1, 3, CAST(N'2016-05-30' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (5, 1, 1, 3, CAST(N'2016-05-30' AS Date), 4)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (6, 1, 1, 3, CAST(N'2016-05-30' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (7, 1, 1, 3, CAST(N'2016-05-30' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (8, 1, 1, 3, CAST(N'2016-05-30' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (9, 1, 1, 6, CAST(N'2016-05-30' AS Date), 2)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (10, 1, 1, 2, CAST(N'2016-05-30' AS Date), 5)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (11, 1, 1, 2, CAST(N'2016-05-30' AS Date), 7)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (12, 2, 1, 3, CAST(N'2016-05-30' AS Date), 2)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (13, 1, 1, 2, CAST(N'2016-05-30' AS Date), 6)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (14, 1, 1, 2, CAST(N'2016-05-30' AS Date), 8)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (15, 1, 1, 2, CAST(N'2016-05-30' AS Date), 14)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (16, 1, 1, 2, CAST(N'2016-05-30' AS Date), 7)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (17, 1, 1, 3, CAST(N'2016-05-30' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (18, 1, 1, 3, CAST(N'2016-05-30' AS Date), 4)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (19, 1, 1, 3, CAST(N'2016-05-31' AS Date), 1)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (20, 2, 1, 3, CAST(N'2016-05-31' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (21, 1, 1, 3, CAST(N'2016-05-31' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (22, 1, 1, 4, CAST(N'2016-05-31' AS Date), 1)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (23, 1, 1, 3, CAST(N'2016-05-31' AS Date), 1)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (24, 1, 1, 3, CAST(N'2016-05-31' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (25, 1, 1, 3, CAST(N'2016-05-31' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (26, 1, 1, 3, CAST(N'2016-05-31' AS Date), 3)
INSERT [dbo].[Rezervasyon] ([ID], [RestoranID], [MusteriID], [KisiSayisi], [Tarih], [MasaNo]) VALUES (27, 1, 1, 2, CAST(N'2016-05-31' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Rezervasyon] OFF
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (4, 1, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (4, 1, 1, 2, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (5, 1, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (5, 1, 1, 2, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (6, 1, 1, 1, 3)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (6, 1, 1, 2, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (7, 1, 1, 1, 3)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (7, 1, 1, 2, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (8, 1, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (8, 1, 1, 2, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (9, 1, 1, 1, 3)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (9, 1, 1, 2, 3)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (10, 1, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (10, 1, 1, 2, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (11, 1, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (11, 1, 1, 2, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (12, 2, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (12, 2, 1, 2, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (19, 1, 1, 1, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (19, 1, 1, 2, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (20, 2, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (20, 2, 1, 2, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (21, 1, 1, 1, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (21, 1, 1, 2, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (22, 1, 1, 1, 3)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (23, 1, 1, 1, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (23, 1, 1, 2, 1)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (24, 1, 1, 1, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (25, 1, 1, 1, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (26, 1, 1, 1, 2)
INSERT [dbo].[Siparis] ([RezervasyonID], [RestoranID], [MusteriID], [UrunID], [Adet]) VALUES (27, 1, 1, 1, 1)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (1, 1, N'Sac Tava', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (1, 2, N'Pizza Margherita', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (1, 4, N'Classic Burger', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (2, 1, N'Pirzola Tava', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (2, 2, N'Pizza Al Funghi', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (2, 4, N'Cheeseburger', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (3, 1, N'Mumbar Dolması', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (3, 2, N'Pizza Con Pepperoni', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (3, 4, N'BBQ Burger', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (4, 1, N'Ekşili Dolma', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (4, 2, N'Pizza Alla Mediterranea', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (4, 4, N'Mushroom Burger', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (5, 1, N'Pilav', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (5, 2, N'Pizza Al Basilico', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (5, 4, N'Cheese & Bacon Burger', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (6, 1, N'Güveç', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (6, 2, N'Pizza Con Carciofi E Funghi', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (6, 4, N'Jack Daniel''s Burger', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (7, 1, N'Tavuk Tava', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (7, 2, N'Pizza Alla Romana', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (7, 4, N'Maxwell Burger', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (8, 1, N'Lahmacun', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (8, 2, N'Pizza Ai Quattro Stagioni', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (8, 4, N'Mushroom Soslu Tavuk', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (9, 1, N'Kuşbaşılı Pide', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (9, 2, N'Pizza Con Prosciutto', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (9, 4, N'Teriyaki Soslu Tavuk', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (10, 1, N'Karışık Pide', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (10, 2, N'Pizza Mario', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (10, 4, N'Susamlı Jack Daniel''s Tavuk', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (11, 1, N'Kıymalı Pide', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (11, 2, N'Kola', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (11, 4, N'Sezar Soslu Wrap', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (12, 1, N'Kaşarlı Pide', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (12, 2, N'Sprite', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (12, 4, N'Penne Arabbiatta', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (13, 1, N'Ayran', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (13, 2, N'Fanta', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (13, 4, N'Napoliten Spaghetti', N'Yiyecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (14, 1, N'Kola', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (14, 2, N'Ayran', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (14, 4, N'Kola', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (15, 1, N'Su', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (15, 2, N'Soda', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (15, 4, N'Ayran', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (16, 1, N'Soda', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (16, 2, N'Su', N'İçecek', NULL)
INSERT [dbo].[Urun] ([ID], [RestoranID], [Isim], [MenuTuru], [Icerik]) VALUES (16, 4, N'Su', N'İçecek', NULL)
ALTER TABLE [dbo].[Masa]  WITH CHECK ADD  CONSTRAINT [FK_Masa_Restoran] FOREIGN KEY([RestoranID])
REFERENCES [dbo].[Restoran] ([ID])
GO
ALTER TABLE [dbo].[Masa] CHECK CONSTRAINT [FK_Masa_Restoran]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyon_Kullanici] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Kullanici] ([ID])
GO
ALTER TABLE [dbo].[Rezervasyon] CHECK CONSTRAINT [FK_Rezervasyon_Kullanici]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyon_Restoran] FOREIGN KEY([RestoranID])
REFERENCES [dbo].[Restoran] ([ID])
GO
ALTER TABLE [dbo].[Rezervasyon] CHECK CONSTRAINT [FK_Rezervasyon_Restoran]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Kullanici] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Kullanici] ([ID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Kullanici]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Restoran] FOREIGN KEY([RestoranID])
REFERENCES [dbo].[Restoran] ([ID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Restoran]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Rezervasyon] FOREIGN KEY([RezervasyonID])
REFERENCES [dbo].[Rezervasyon] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Rezervasyon]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Urun] FOREIGN KEY([UrunID], [RestoranID])
REFERENCES [dbo].[Urun] ([ID], [RestoranID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Urun]
GO
/****** Object:  StoredProcedure [dbo].[sp_anlikKapasiteAyarla]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_anlikKapasiteAyarla]
@restoranID int,
@kapasite int,
@ekle bit
AS
BEGIN
	if @ekle = 0
		update dbo.Restoran set AnlikKapasite = AnlikKapasite - @kapasite where Restoran.ID = @restoranID
	else
		update dbo.Restoran set AnlikKapasite = AnlikKapasite + @kapasite where Restoran.ID = @restoranID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getKullaniciBilgisi]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getKullaniciBilgisi]
@id int
AS
BEGIN
	select * from dbo.Kullanici where @id = Kullanici.ID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getKullaniciRezervasyonlari]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getKullaniciRezervasyonlari]
@musteriID int
as
begin
	select * from dbo.Rezervasyon where @musteriID = Rezervasyon.MusteriID
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getMasa]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getMasa]
@restoranID int
AS
BEGIN
	select * from dbo.Masa where @restoranID = RestoranID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getMenu]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getMenu]
@restoranID int
AS
BEGIN
	select * from dbo.Urun where @restoranID = dbo.Urun.RestoranID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getRestoran]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getRestoran]
AS
BEGIN
	select * from dbo.Restoran
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getRestoranAdi]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_getRestoranAdi]
@restoranID int
as
begin
	select Restoran.Isim from dbo.Restoran where @restoranID = Restoran.ID
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getRezervasyonID]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getRezervasyonID]
as
begin
	select top 1 Rezervasyon.ID from dbo.Rezervasyon order by Rezervasyon.ID desc
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getTekRestoran]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getTekRestoran]
@restoranID int
AS
BEGIN
	select * from dbo.Restoran where @restoranID = Restoran.ID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_girisYap]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_girisYap]
@kullaniciAdi nvarchar(50),
@sifre nvarchar(50)
AS
BEGIN
	select * from dbo.Kullanici where @kullaniciAdi = KullaniciAdi and @sifre = Sifre
END

GO
/****** Object:  StoredProcedure [dbo].[sp_kullaniciAdiKontrol]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kullaniciAdiKontrol]
@kullaniciAdi nvarchar(50)
AS
BEGIN
	select KullaniciAdi from dbo.Kullanici where @kullaniciAdi = KullaniciAdi
END

GO
/****** Object:  StoredProcedure [dbo].[sp_masaAyarla]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_masaAyarla]
@masaNo int,
@restoranID int,
@uygunluk bit,
@saat int
AS
BEGIN
	if @saat is null
		update dbo.Masa set Bos = @uygunluk, Saat = null 
		where @restoranID = Masa.RestoranID and Masa.No = @masaNo
	else
		update dbo.Masa set Bos = @uygunluk, Saat = @saat 
		where @restoranID = Masa.RestoranID and Masa.No = @masaNo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_masalariGetir]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_masalariGetir]
(@resID int)

as begin
select No, Kapasite from Masa where Masa.RestoranID=@resID and Masa.Bos=1
end

GO
/****** Object:  StoredProcedure [dbo].[sp_rezervasyonIptal]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_rezervasyonIptal]
@rezervasyonID int
AS
BEGIN
	delete from dbo.Rezervasyon where @rezervasyonID = Rezervasyon.ID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_rezervasyonYap]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_rezervasyonYap]
@restoranID int,
@musteriID int,
@kisiSayisi int,
@tarih date,
@masaNo int
as
begin
	insert into dbo.Rezervasyon values(@restoranID, @musteriID, @kisiSayisi, @tarih, @masaNo)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_siparisAl]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_siparisAl]
@rezervasyonID int,
@restoranID int,
@musteriID int,
@urunID int,
@adet int
as
begin
	insert into dbo.Siparis values(@rezervasyonID,@restoranID,@musteriID,@urunID,@adet)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_urunGetir]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_urunGetir]
as
begin
select * from Urun
end

GO
/****** Object:  StoredProcedure [dbo].[sp_yeniKullanici]    Script Date: 3.6.2016 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_yeniKullanici]
@kullaniciAdi nvarchar(50),
@sifre nvarchar(50),
@isim nvarchar(20),
@soyisim nvarchar(20),
@telefon nvarchar(20)
AS
BEGIN
	insert into dbo.Kullanici values(@kullaniciAdi, @sifre, @isim, @soyisim, @telefon)
END

GO
USE [master]
GO
ALTER DATABASE [EatMe] SET  READ_WRITE 
GO
