USE [master]
GO
/****** Object:  Database [footballdb]    Script Date: 5/19/2020 5:53:36 PM ******/
CREATE DATABASE [footballdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'footballdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MAHIN\MSSQL\DATA\footballdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'footballdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MAHIN\MSSQL\DATA\footballdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [footballdb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [footballdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [footballdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [footballdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [footballdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [footballdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [footballdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [footballdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [footballdb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [footballdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [footballdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [footballdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [footballdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [footballdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [footballdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [footballdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [footballdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [footballdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [footballdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [footballdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [footballdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [footballdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [footballdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [footballdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [footballdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [footballdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [footballdb] SET  MULTI_USER 
GO
ALTER DATABASE [footballdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [footballdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [footballdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [footballdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [footballdb]
GO
/****** Object:  Table [dbo].[coach]    Script Date: 5/19/2020 5:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[coach](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
	[position] [varchar](50) NULL,
	[fitness] [numeric](18, 0) NULL,
	[lastmatchrating] [numeric](18, 1) NULL,
	[ovrating] [numeric](18, 0) NULL,
 CONSTRAINT [PK_coach] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 5/19/2020 5:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[employeeid] [nchar](10) NULL,
	[password] [nchar](10) NULL,
	[name] [nchar](10) NULL,
	[designation] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[manager]    Script Date: 5/19/2020 5:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager](
	[employeeid] [nchar](10) NOT NULL,
	[name] [nchar](10) NULL,
	[designation] [nchar](10) NULL,
	[salary] [float] NULL,
 CONSTRAINT [PK_manager] PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[managerfixture]    Script Date: 5/19/2020 5:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managerfixture](
	[matchid] [nchar](10) NOT NULL,
	[venue] [nchar](10) NULL,
	[opponent] [nchar](10) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_managerfixture] PRIMARY KEY CLUSTERED 
(
	[matchid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[physioo]    Script Date: 5/19/2020 5:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[physioo](
	[playerid] [varchar](max) NULL,
	[name] [varchar](max) NULL,
	[injury] [varchar](max) NULL,
	[fitness] [varchar](max) NULL,
	[needs] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[player]    Script Date: 5/19/2020 5:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[player](
	[id] [nchar](10) NOT NULL,
	[name] [nchar](10) NULL,
	[nationality] [nchar](10) NULL,
	[salary] [float] NULL,
	[fitness(%)] [nchar](10) NULL,
	[contractyear] [float] NULL,
 CONSTRAINT [PK_player] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[playerrqst]    Script Date: 5/19/2020 5:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[playerrqst](
	[id] [varchar](50) NULL,
	[cause] [varchar](50) NULL,
	[datefrom] [varchar](50) NULL,
	[dateto] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e04', N'Courtois  ', N'Goalkeeper', CAST(99 AS Numeric(18, 0)), CAST(8.5 AS Numeric(18, 1)), CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e05', N'Areola    ', N'Goalkeeper', CAST(80 AS Numeric(18, 0)), CAST(0.0 AS Numeric(18, 1)), CAST(83 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e06', N'Marcelo   ', N'Defender', CAST(98 AS Numeric(18, 0)), CAST(8.4 AS Numeric(18, 1)), CAST(87 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e07', N'Ramos     ', N'Defender', CAST(99 AS Numeric(18, 0)), CAST(9.0 AS Numeric(18, 1)), CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e08', N'Varane    ', N'Defender', CAST(87 AS Numeric(18, 0)), CAST(9.2 AS Numeric(18, 1)), CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e09', N'Carvajal  ', N'Defender', CAST(90 AS Numeric(18, 0)), CAST(7.5 AS Numeric(18, 1)), CAST(86 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e10', N'Nacho     ', N'Defender', CAST(95 AS Numeric(18, 0)), CAST(6.7 AS Numeric(18, 1)), CAST(83 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e11', N'Modric    ', N'Midfielder', CAST(90 AS Numeric(18, 0)), CAST(8.2 AS Numeric(18, 1)), CAST(91 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e12', N'Casemiro  ', N'Midfielder', CAST(90 AS Numeric(18, 0)), CAST(9.3 AS Numeric(18, 1)), CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e13', N'Kroos     ', N'Midfielder', CAST(95 AS Numeric(18, 0)), CAST(9.8 AS Numeric(18, 1)), CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e14', N'Valvarde  ', N'Midfielder', CAST(80 AS Numeric(18, 0)), CAST(7.8 AS Numeric(18, 1)), CAST(84 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e15', N'Bale      ', N'Forward', CAST(40 AS Numeric(18, 0)), CAST(0.0 AS Numeric(18, 1)), CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e16', N'Benzama   ', N'Forward', CAST(95 AS Numeric(18, 0)), CAST(7.2 AS Numeric(18, 1)), CAST(91 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e17', N'Isco      ', N'Winger', CAST(55 AS Numeric(18, 0)), CAST(7.1 AS Numeric(18, 1)), CAST(88 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e18', N'Asensio   ', N'Winger', CAST(70 AS Numeric(18, 0)), CAST(8.0 AS Numeric(18, 1)), CAST(87 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e19', N'Gomez', N'Forward', CAST(72 AS Numeric(18, 0)), CAST(0.0 AS Numeric(18, 1)), CAST(81 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e25', N'nazim', NULL, NULL, NULL, NULL)
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e44', N'asas', NULL, NULL, NULL, CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[coach] ([id], [name], [position], [fitness], [lastmatchrating], [ovrating]) VALUES (N'e50', N'messi', NULL, NULL, NULL, NULL)
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e01       ', N'001       ', N'Perez     ', N'manager   ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e02       ', N'002       ', N'Zidane    ', N'coach     ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e03       ', N'003       ', N'Daniel    ', N'physio    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e04       ', N'004       ', N'Courtois  ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e05       ', N'005       ', N'Areola    ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e06       ', N'006       ', N'Marcelo   ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e07       ', N'007       ', N'Ramos     ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e08       ', N'008       ', N'Varane    ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e09       ', N'009       ', N'Carvajal  ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e10       ', N'010       ', N'Nacho     ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e11       ', N'011       ', N'Modric    ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e12       ', N'012       ', N'Casemiro  ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e13       ', N'013       ', N'Kroos     ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e14       ', N'014       ', N'Valvarde  ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e15       ', N'015       ', N'Bale      ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e16       ', N'016       ', N'Benzama   ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e17       ', N'017       ', N'Isco      ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e18       ', N'018       ', N'Asensio   ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e19       ', N'019       ', N'Gomez     ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e33       ', N'780174    ', N'nazim     ', N'player    ')
INSERT [dbo].[login] ([employeeid], [password], [name], [designation]) VALUES (N'e34       ', N'374650    ', N'mahin     ', N'player    ')
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e01       ', N'Perez     ', N'manager   ', 1000000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e02       ', N'Zidane    ', N'coach     ', 800000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e03       ', N'Daniel    ', N'physio    ', 500000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e04       ', N'Courtois  ', N'player    ', 700000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e05       ', N'Areola    ', N'player    ', 400000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e06       ', N'Marcelo   ', N'player    ', 6000000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e07       ', N'Ramos     ', N'player    ', 700000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e08       ', N'Varane    ', N'player    ', 600000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e09       ', N'Carvajal  ', N'player    ', 500000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e10       ', N'Nacho     ', N'player    ', 400000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e11       ', N'Modric    ', N'player    ', 700000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e12       ', N'Casemiro  ', N'player    ', 650000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e13       ', N'Kroos     ', N'player    ', 600000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e14       ', N'Valvarde  ', N'player    ', 400000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e15       ', N'Bale      ', N'player    ', 70000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e16       ', N'Benzama   ', N'player    ', 700000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e17       ', N'Isco      ', N'player    ', 500000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e18       ', N'Asensio   ', N'player    ', 500000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e19       ', N'Gomez     ', N'player    ', 300000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e20       ', N'Peter     ', N'groundsman', 50000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e21       ', N'Barry     ', N'groundsman', 50000)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e33       ', N'nazim     ', N'player    ', 12)
INSERT [dbo].[manager] ([employeeid], [name], [designation], [salary]) VALUES (N'e34       ', N'mahin     ', N'player    ', 10)
INSERT [dbo].[managerfixture] ([matchid], [venue], [opponent], [date]) VALUES (N'm01       ', N'home      ', N'sevilla   ', CAST(0x0000AB3600000000 AS DateTime))
INSERT [dbo].[managerfixture] ([matchid], [venue], [opponent], [date]) VALUES (N'm02       ', N'away      ', N'barcelona ', CAST(0x0000AB3E00000000 AS DateTime))
INSERT [dbo].[managerfixture] ([matchid], [venue], [opponent], [date]) VALUES (N'm03       ', N'home      ', N'athetico  ', CAST(0x0000AB5000000000 AS DateTime))
INSERT [dbo].[managerfixture] ([matchid], [venue], [opponent], [date]) VALUES (N'm04       ', N'away      ', N'chelsea   ', CAST(0x0000AB5700000000 AS DateTime))
INSERT [dbo].[managerfixture] ([matchid], [venue], [opponent], [date]) VALUES (N'm05       ', N'away      ', N'bayern    ', CAST(0x0000AB6700000000 AS DateTime))
INSERT [dbo].[managerfixture] ([matchid], [venue], [opponent], [date]) VALUES (N'm06       ', N'Away      ', N'manu      ', CAST(0x0000ABBF017E27A4 AS DateTime))
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e04', N'Courtois', NULL, N'99', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e05', N'Areola    ', N'', N'85', N'2 Weeks rest')
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e06', N'Marcelo   ', NULL, N'98', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e07', N'Ramos     ', NULL, N'99', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e08', N'Varane    ', NULL, N'97', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e09', N'Carvajal  ', NULL, N'90', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e10', N'Nacho     ', N'', N'70', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e11', N'Modric    ', NULL, N'90', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e12', N'Casemiro  ', NULL, N'90', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e13', N'Kroos     ', NULL, N'95', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e14', N'Valvarde  ', NULL, N'80', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e15', N'Bale      ', N'Kneecap bursitis', N'40', N'Major Surgery')
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e16', N'Benzama   ', NULL, N'95', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e17', N'Isco      ', NULL, N'55', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e18', N'Asensio   ', NULL, N'70', NULL)
INSERT [dbo].[physioo] ([playerid], [name], [injury], [fitness], [needs]) VALUES (N'e19', N'Gomez', N'Hamstring', N'40', NULL)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e04       ', N'Courtois  ', N'Belgium   ', 700000, N'99        ', 4)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e05       ', N'Areola    ', N'France    ', 400000, N'80        ', 3)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e06       ', N'Marcelo   ', N'Brazil    ', 6000000, N'98        ', 2)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e07       ', N'Ramos     ', N'Spain     ', 700000, N'99        ', 3)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e08       ', N'Varane    ', N'France    ', 600000, N'97        ', 4)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e09       ', N'Carvajal  ', N'Spain     ', 500000, N'90        ', 2)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e10       ', N'Nacho     ', N'Spain     ', 400000, N'85        ', 3)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e11       ', N'Modric    ', N'Croatia   ', 700000, N'90        ', 4)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e12       ', N'Casemiro  ', N'Brazil    ', 650000, N'90        ', 2)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e13       ', N'Kroos     ', N'Germany   ', 600000, N'95        ', 1)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e14       ', N'Valvarde  ', N'Spain     ', 400000, N'80        ', 3)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e15       ', N'Bale      ', N'Welsh     ', 700000, N'40        ', 4)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e16       ', N'Benzama   ', N'France    ', 700000, N'95        ', 2)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e17       ', N'Isco      ', N'Spain     ', 500000, N'55        ', 3)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e18       ', N'Asensio   ', N'Spain     ', 500000, N'70        ', 4)
INSERT [dbo].[player] ([id], [name], [nationality], [salary], [fitness(%)], [contractyear]) VALUES (N'e19       ', N'Gomez     ', N'Argentina ', 300000, N'72        ', 1)
INSERT [dbo].[playerrqst] ([id], [cause], [datefrom], [dateto]) VALUES (N'e15', N'Injury', N'2-4-2020', N'2-5-2020')
INSERT [dbo].[playerrqst] ([id], [cause], [datefrom], [dateto]) VALUES (N'e04', N'Not Interested', N'5/18/2020 9:53:41 PM', N'5/19/2020 9:53:41 PM')
USE [master]
GO
ALTER DATABASE [footballdb] SET  READ_WRITE 
GO
