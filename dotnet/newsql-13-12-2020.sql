USE [master]
GO
/****** Object:  Database [TinTuc]    Script Date: 12/13/2020 6:01:59 PM ******/
CREATE DATABASE [TinTuc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TinTuc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TinTuc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TinTuc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TinTuc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TinTuc] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TinTuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TinTuc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TinTuc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TinTuc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TinTuc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TinTuc] SET ARITHABORT OFF 
GO
ALTER DATABASE [TinTuc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TinTuc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TinTuc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TinTuc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TinTuc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TinTuc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TinTuc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TinTuc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TinTuc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TinTuc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TinTuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TinTuc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TinTuc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TinTuc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TinTuc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TinTuc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TinTuc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TinTuc] SET RECOVERY FULL 
GO
ALTER DATABASE [TinTuc] SET  MULTI_USER 
GO
ALTER DATABASE [TinTuc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TinTuc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TinTuc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TinTuc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TinTuc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TinTuc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TinTuc', N'ON'
GO
ALTER DATABASE [TinTuc] SET QUERY_STORE = OFF
GO
USE [TinTuc]
GO
/****** Object:  Table [dbo].[AdvertisementPositions]    Script Date: 12/13/2020 6:01:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementPositions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[PageId] [int] NULL,
 CONSTRAINT [PK_AdvertisementPositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[PositionId] [int] NULL,
	[PageId] [int] NULL,
	[Image] [nvarchar](250) NULL,
	[Video] [nvarchar](250) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[ClickCount] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[ParentId] [int] NOT NULL,
	[SortOrder] [int] NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoKeyword] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[ShowInHome] [bit] NULL,
	[ShowInMenu] [bit] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Type] [tinyint] NULL,
	[TargetId] [bigint] NULL,
	[Status] [tinyint] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedUser] [bigint] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUser] [bigint] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Repost] [nchar](10) NULL,
	[PostId] [bigint] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Url] [varchar](250) NULL,
	[CssIcon] [nvarchar](250) NULL,
	[CssClass] [nvarchar](250) NULL,
	[ParentId] [int] NULL,
	[Type] [tinyint] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiteUrl] [varchar](50) NULL,
	[SiteName] [nvarchar](250) NULL,
	[SiteDescription] [nvarchar](500) NULL,
	[AdminMail] [varchar](50) NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoKeyword] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Title] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoKeyword] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageStatics]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageStatics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoKeyword] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_PageStatics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInCategories]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInCategories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_PostInCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInTags]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInTags](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TagsId] [bigint] NOT NULL,
	[PostId] [bigint] NOT NULL,
 CONSTRAINT [PK_PostInTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostRelations]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostRelations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](250) NULL,
	[PostId] [bigint] NULL,
	[PostRelationId] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_PostRelations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateUser] [bigint] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Video] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUser] [bigint] NULL,
	[Status] [tinyint] NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[SourceWeb] [nvarchar](250) NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoKeyword] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[Viewed] [int] NULL,
	[HotDate] [datetime] NULL,
	[NewDate] [datetime] NULL,
	[Author] [nvarchar](250) NULL,
	[PublishedDate] [datetime] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystermCodes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystermCodes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Text] [nvarchar](500) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_SystermCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slug] [nvarchar](250) NULL,
	[Name] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoKeyword] [nvarchar](250) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Password] [nchar](50) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[Type] [tinyint] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedUser] [bigint] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUser] [bigint] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Avatar], [Type], [CreatedTime], [CreatedUser], [UpdateTime], [UpdateUser], [Status]) VALUES (3, N'string                                            ', N'string', N'string', N'string', N'string', N'string                                            ', N'string', 0, CAST(N'2013-05-09T00:00:00.000' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Avatar], [Type], [CreatedTime], [CreatedUser], [UpdateTime], [UpdateUser], [Status]) VALUES (4, N'string                                            ', N'string', N'string', N'string', N'string', N'string                                            ', N'string', 0, CAST(N'2013-05-09T00:00:00.000' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Avatar], [Type], [CreatedTime], [CreatedUser], [UpdateTime], [UpdateUser], [Status]) VALUES (5, N'string                                            ', N'string', N'string', N'string', N'string', N'string                                            ', N'string', 0, CAST(N'2013-05-09T00:00:00.000' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Avatar], [Type], [CreatedTime], [CreatedUser], [UpdateTime], [UpdateUser], [Status]) VALUES (6, N'string                                            ', N'string', N'string', N'string', N'string', N'string                                            ', N'string', 0, CAST(N'2020-12-13T10:45:23.053' AS DateTime), 0, CAST(N'2020-12-13T10:45:23.053' AS DateTime), 0, 0)
INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Avatar], [Type], [CreatedTime], [CreatedUser], [UpdateTime], [UpdateUser], [Status]) VALUES (7, N's1tring                                           ', N'string', N'string', N'string', N'string', N'string                                            ', N'string', 0, CAST(N'2020-12-13T10:45:23.053' AS DateTime), 0, CAST(N'2020-12-13T10:45:23.053' AS DateTime), 0, 0)
INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Avatar], [Type], [CreatedTime], [CreatedUser], [UpdateTime], [UpdateUser], [Status]) VALUES (8, N'st2ring                                           ', N'string', N'string', N'string', N'string', N'string                                            ', N'string', 0, CAST(N'2020-12-13T10:58:16.917' AS DateTime), 0, CAST(N'2020-12-13T10:58:16.917' AS DateTime), 0, 0)
INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [Email], [Phone], [Password], [Avatar], [Type], [CreatedTime], [CreatedUser], [UpdateTime], [UpdateUser], [Status]) VALUES (9, N'string                                            ', N'string', N'string', N'string', N'string', N'string                                            ', N'string', 0, CAST(N'2013-05-09T00:00:00.000' AS DateTime), 0, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdvertisementPositions_Delete]
	@Id int
    
	AS

DELETE FROM AdvertisementPositions
WHERE 
	[AdvertisementPositions].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AdvertisementPositions_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM AdvertisementPositions OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END


GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AdvertisementPositions_GetAll]
AS

SELECT
	*
FROM [AdvertisementPositions] a

GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AdvertisementPositions_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [AdvertisementPositions] a

WHERE
	a.[Id] = @Id

GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdvertisementPositions_Insert]
@Code varchar(50)
	,@Name nvarchar(250)
	,@PageId int
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO AdvertisementPositions (
	[Code]
	,[Name]
	,[PageId]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
	@Code
	,@Name
	,@PageId
)
SELECT TOP 1 * FROM @IdSave


GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[AdvertisementPositions_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO AdvertisementPositions(
	[Code]
	,[Name]
	,[PageId]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
	[Code]
	,[Name]
	,[PageId]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
	Code varchar(50)
	,Name nvarchar(250)
	,PageId int
)
--select @@RowCount
SELECT Id FROM @resultTbl
END
GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AdvertisementPositions_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [AdvertisementPositions] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [AdvertisementPositions] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END



GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdvertisementPositions_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			AdvertisementPositions ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [AdvertisementPositions_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				AdvertisementPositions ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[AdvertisementPositions_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	
 
GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdvertisementPositions_Update]
	@Id int
	,@Code varchar(50)
	,@Name nvarchar(250)
	,@PageId int

AS

UPDATE AdvertisementPositions SET
	   [Code] = @Code
	   ,[Name] = @Name
	   ,[PageId] = @PageId
WHERE
    
	[AdvertisementPositions].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[AdvertisementPositions_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdvertisementPositions_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE AdvertisementPositions SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
GO
/****** Object:  StoredProcedure [dbo].[Advertisements_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Advertisements_Delete]
	@Id int
    
	AS

DELETE FROM Advertisements
WHERE 
	[Advertisements].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[Advertisements_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Advertisements_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Advertisements OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END


GO
/****** Object:  StoredProcedure [dbo].[Advertisements_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Advertisements_GetAll]
AS

SELECT
	*
FROM [Advertisements] a


GO
/****** Object:  StoredProcedure [dbo].[Advertisements_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Advertisements_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Advertisements] a

WHERE
	a.[Id] = @Id

GO
/****** Object:  StoredProcedure [dbo].[Advertisements_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Advertisements_Insert]
@Name nvarchar(250)
      ,@PositionId int	
      ,@PageId int
      ,@Image nvarchar(250)
      ,@Video nvarchar(250)
      ,@Width int
      ,@Height int
      ,@ClickCount int
      ,@FromDate datetime
      ,@ToDate datetime
      ,@Status tinyint
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Advertisements (
      [Name]
      ,[PositionId]
      ,[PageId]
      ,[Image]
      ,[Video]
      ,[Width]
      ,[Height]
      ,[ClickCount]
      ,[FromDate]
      ,[ToDate]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @Name 
      ,@PositionId 	
      ,@PageId 
      ,@Image 
      ,@Video 
      ,@Width 
      ,@Height 
      ,@ClickCount 
      ,@FromDate 
      ,@ToDate 
      ,@Status 
)
SELECT TOP 1 * FROM @IdSave


GO
/****** Object:  StoredProcedure [dbo].[Advertisements_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Advertisements_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Advertisements(
      [Name]
      ,[PositionId]
      ,[PageId]
      ,[Image]
      ,[Video]
      ,[Width]
      ,[Height]
      ,[ClickCount]
      ,[FromDate]
      ,[ToDate]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
      [Name]
      ,[PositionId]
      ,[PageId]
      ,[Image]
      ,[Video]
      ,[Width]
      ,[Height]
      ,[ClickCount]
      ,[FromDate]
      ,[ToDate]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
      Name nvarchar(250)
      ,PositionId int	
      ,PageId int
      ,Image nvarchar(250)
      ,Video nvarchar(250)
      ,Width int
      ,Height int
      ,ClickCount int
      ,FromDate datetime
      ,ToDate datetime
      ,Status tinyint
)
--select @@RowCount
SELECT Id FROM @resultTbl
END


GO
/****** Object:  StoredProcedure [dbo].[Advertisements_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Advertisements_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Advertisements] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Advertisements] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END


GO
/****** Object:  StoredProcedure [dbo].[Advertisements_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Advertisements_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Advertisements ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Advertisements_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Advertisements ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Advertisements_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	
 

GO
/****** Object:  StoredProcedure [dbo].[Advertisements_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Advertisements_Update]
	@Id int
      ,@Name nvarchar(250)
      ,@PositionId int	
      ,@PageId int
      ,@Image nvarchar(250)
      ,@Video nvarchar(250)
      ,@Width int
      ,@Height int
      ,@ClickCount int
      ,@FromDate datetime
      ,@ToDate datetime
      ,@Status tinyint

AS

UPDATE Advertisements SET
	   [Name] = @Name
	   ,[PositionId] = @PositionId 	
      ,[PageId] = @PageId 
      ,[Image] = @Image 
      ,[Video] = @Video 
      ,[Width] = @Width 
      ,[Height] = @Height 
      ,[ClickCount] = @ClickCount 
      ,[FromDate] = @FromDate 
      ,[ToDate] = @ToDate 
      ,[Status] = @Status 
WHERE
    
	[Advertisements].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Advertisements_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Advertisements_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Advertisements SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
GO
/****** Object:  StoredProcedure [dbo].[Categories_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Categories_Delete]
	@Id int
    
	AS

DELETE FROM Categories
WHERE 
	[Categories].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[Categories_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Categories_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Categories OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END
GO
/****** Object:  StoredProcedure [dbo].[Categories_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Categories_GetAll]
AS

SELECT
	*
FROM [Categories] a


GO
/****** Object:  StoredProcedure [dbo].[Categories_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Categories_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Categories] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[Categories_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Categories_Insert]
@Name nvarchar(250)
	  ,@Content nvarchar(MAX)
      ,@ParentId int	
      ,@SortOrder int
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
	  ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
      ,@ShowInHome bit
      ,@ShowInMenu bit
      ,@Status tinyint
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Categories (
      [Name]
           ,[Content]
           ,[ParentId]
           ,[SortOrder]
           ,[SeoAlias]
           ,[SeoTitle]
           ,[SeoKeyword]
           ,[SeoDescription]
           ,[ShowInHome]
           ,[ShowInMenu]
           ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @Name 
	  ,@Content 
      ,@ParentId 	
      ,@SortOrder 
      ,@SeoAlias 
      ,@SeoTitle 
	  ,@SeoKeyword 
      ,@SeoDescription 
      ,@ShowInHome 
      ,@ShowInMenu 
      ,@Status 
)
SELECT TOP 1 * FROM @IdSave

GO
/****** Object:  StoredProcedure [dbo].[Categories_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Categories_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Categories(
	[Name]
           ,[Content]
           ,[ParentId]
           ,[SortOrder]
           ,[SeoAlias]
           ,[SeoTitle]
           ,[SeoKeyword]
           ,[SeoDescription]
           ,[ShowInHome]
           ,[ShowInMenu]
           ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
	[Name]
           ,[Content]
           ,[ParentId]
           ,[SortOrder]
           ,[SeoAlias]
           ,[SeoTitle]
           ,[SeoKeyword]
           ,[SeoDescription]
           ,[ShowInHome]
           ,[ShowInMenu]
           ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
       Name nvarchar(250)
	  ,Content nvarchar(MAX)
      ,ParentId int	
      ,SortOrder int
      ,SeoAlias nvarchar(250)
      ,SeoTitle nvarchar(250)
	  ,SeoKeyword nvarchar(250)
      ,SeoDescription nvarchar(250)
      ,ShowInHome bit
      ,ShowInMenu bit
      ,Status tinyint
)
--select @@RowCount
SELECT Id FROM @resultTbl
END


GO
/****** Object:  StoredProcedure [dbo].[Categories_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Categories_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Categories] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Categories] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END


GO
/****** Object:  StoredProcedure [dbo].[Categories_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Categories_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Categories_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Categories ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Categories_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Categories ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Categories_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	
 

GO
/****** Object:  StoredProcedure [dbo].[Categories_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Categories_Update]
	@Id int
      ,@Name nvarchar(250)
	  ,@Content nvarchar(MAX)
      ,@ParentId int	
      ,@SortOrder int
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
	  ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
      ,@ShowInHome bit
      ,@ShowInMenu bit
      ,@Status tinyint

AS

UPDATE Categories SET
	   [Name]=  @Name 
	  ,[Content] = @Content 
      ,[ParentId] = @ParentId 	
      ,[SortOrder] = @SortOrder 
      ,[SeoAlias] = @SeoAlias 
      ,[SeoTitle] = @SeoTitle 
	  ,[SeoKeyword] = @SeoKeyword 
      ,[SeoDescription] = @SeoDescription 
      ,[ShowInHome] = @ShowInHome 
      ,[ShowInMenu] = @ShowInMenu 
      ,[Status] = @Status 
WHERE
    
	[Categories].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[Categories_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Categories_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Categories SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comments_Delete]
	@Id int
    
	AS

DELETE FROM Comments
WHERE 
	[Comments].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Comments_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Comments_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Comments OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END

GO
/****** Object:  StoredProcedure [dbo].[Comments_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Comments_GetAll]
AS

SELECT
	*
FROM [Comments] a

GO
/****** Object:  StoredProcedure [dbo].[Comments_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Comments_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Comments] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[Comments_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Comments_Insert]
@Name nvarchar(50)
	  ,@Content nvarchar(MAX)
	  ,@Type int	
      ,@TargetId int	
	  ,@Status tinyint
,@CreatedTime datetime
,@CreatedUser bigint
,@UpdateTime datetime
 ,@UpdateUser bigint
      ,@Email nvarchar(50)
      ,@Phone nvarchar(20)
	  ,@Repost nchar(10)
      ,@PostId bigint
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Comments (
      [Name]
      ,[Content]
      ,[Type]
      ,[TargetId]
      ,[Status]
      ,[CreatedTime]
      ,[CreatedUser]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Email]
      ,[Phone]
      ,[Repost]
      ,[PostId]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
       @Name 
	  ,@Content 
	  ,@Type 	
      ,@TargetId 	
	  ,@Status 
,@CreatedTime 
,@CreatedUser 
,@UpdateTime 
 ,@UpdateUser 
      ,@Email 
      ,@Phone 
	  ,@Repost 
      ,@PostId 
)
SELECT TOP 1 * FROM @IdSave

GO
/****** Object:  StoredProcedure [dbo].[Comments_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Comments_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Comments(
	[Name]
      ,[Content]
      ,[Type]
      ,[TargetId]
      ,[Status]
      ,[CreatedTime]
      ,[CreatedUser]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Email]
      ,[Phone]
      ,[Repost]
      ,[PostId]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
	[Name]
      ,[Content]
      ,[Type]
      ,[TargetId]
      ,[Status]
      ,[CreatedTime]
      ,[CreatedUser]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Email]
      ,[Phone]
      ,[Repost]
      ,[PostId]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
       Name nvarchar(50)
	  ,Content nvarchar(MAX)
	  ,Type int	
      ,TargetId int	
	  ,Status tinyint
,CreatedTime datetime
,CreatedUser bigint
,UpdateTime datetime
 ,UpdateUser bigint
      ,Email nvarchar(50)
      ,Phone nvarchar(20)
	  ,Repost nchar(10)
      ,PostId bigint
)
--select @@RowCount
SELECT Id FROM @resultTbl
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Comments_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Comments] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Comments] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Comments_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Comments_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Comments_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Comments ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Comments_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Comments ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Comments_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[Comments_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Comments_Update]
	@Id int
      ,@Name nvarchar(50)
	  ,@Content nvarchar(MAX)
	  ,@Type int	
      ,@TargetId int	
	  ,@Status tinyint
,@CreatedTime datetime
,@CreatedUser bigint
,@UpdateTime datetime
 ,@UpdateUser bigint
      ,@Email nvarchar(50)
      ,@Phone nvarchar(20)
	  ,@Repost nchar(10)
      ,@PostId bigint

AS

UPDATE Comments SET
      [Name] = @Name 
	  ,[Content] = @Content 
	  ,[Type] = @Type 
      ,[TargetId] = @TargetId 	
	  ,[Status] = @Status 
,[CreatedTime] = @CreatedTime 
,[CreatedUser] = @CreatedUser 
,[UpdateTime] = @UpdateTime 
 ,[UpdateUser] = @UpdateUser 
      ,[Email] = @Email 
      ,[Phone] = @Phone 
	  ,[Repost] = @Repost 
      ,[PostId] = @PostId 
WHERE
    
	[Comments].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Comments_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Comments_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Comments SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 



GO
/****** Object:  StoredProcedure [dbo].[Menus_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Menus_Delete]
	@Id int
    
	AS

DELETE FROM Menus
WHERE 
	[Menus].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Menus_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Menus_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Menus OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END


GO
/****** Object:  StoredProcedure [dbo].[Menus_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Menus_GetAll]
AS

SELECT
	*
FROM [Menus] a
GO
/****** Object:  StoredProcedure [dbo].[Menus_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[Menus_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Menus] a

WHERE
	a.[Id] = @Id



GO
/****** Object:  StoredProcedure [dbo].[Menus_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Menus_Insert]
@Name nvarchar(250)

,@Url varchar(250)
,@CssIcon nvarchar(250)
,@CssClass nvarchar(250)
,@ParentId int
	  ,@Type tinyint	
	  ,@Status tinyint

	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Menus (
     [Name]
      ,[Url]
      ,[CssIcon]
      ,[CssClass]
      ,[ParentId]
      ,[Type]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
        @Name 

,@Url 
,@CssIcon 
,@CssClass 
,@ParentId 
	  ,@Type 	
	  ,@Status 
)
SELECT TOP 1 * FROM @IdSave

GO
/****** Object:  StoredProcedure [dbo].[Menus_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Menus_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Menus(
	[Name]
      ,[Url]
      ,[CssIcon]
      ,[CssClass]
      ,[ParentId]
      ,[Type]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
	[Name]
      ,[Url]
      ,[CssIcon]
      ,[CssClass]
      ,[ParentId]
      ,[Type]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
      Name nvarchar(250)

,Url varchar(250)
,CssIcon nvarchar(250)
,CssClass nvarchar(250)
,ParentId int
	  ,Type tinyint	
	  ,Status tinyint
)
--select @@RowCount
SELECT Id FROM @resultTbl
END

GO
/****** Object:  StoredProcedure [dbo].[Menus_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Menus_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Menus] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Menus] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Menus_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- Menus_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Menus_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Menus ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Menus_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Menus ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Menus_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	
GO
/****** Object:  StoredProcedure [dbo].[Menus_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Menus_Update]
	@Id int
      ,@Name nvarchar(250)

,@Url varchar(250)
,@CssIcon nvarchar(250)
,@CssClass nvarchar(250)
,@ParentId int
	  ,@Type tinyint	
	  ,@Status tinyint


AS

UPDATE Menus SET
     [Name] = @Name
      ,[Url] = @Url
      ,[CssIcon] = @CssIcon
      ,[CssClass] = @CssClass
      ,[ParentId] = @ParentId
      ,[Type] = @Type
      ,[Status] =@Status
WHERE
    
	[Menus].[Id] = @Id
SELECT @@RowCount
GO
/****** Object:  StoredProcedure [dbo].[Menus_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Menus_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Menus SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 
GO
/****** Object:  StoredProcedure [dbo].[Options_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Options_Delete]
	@Id int
    
	AS

DELETE FROM Options
WHERE 
	[Options].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Options_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Options_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Options OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END

GO
/****** Object:  StoredProcedure [dbo].[Options_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Options_GetAll]
AS

SELECT
	*
FROM [Options] a

GO
/****** Object:  StoredProcedure [dbo].[Options_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Options_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Options] a

WHERE
	a.[Id] = @Id

GO
/****** Object:  StoredProcedure [dbo].[Options_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Options_Insert]
@SiteUrl varchar(50)
      ,@SiteName nvarchar(250)
      ,@SiteDescription nvarchar(500)
      ,@AdminMail varchar(50)
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
      ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
	  ,@Status tinyint

	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Options (
    [SiteUrl]
      ,[SiteName]
      ,[SiteDescription]
      ,[AdminMail]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
        @SiteUrl 
      ,@SiteName 
      ,@SiteDescription 
      ,@AdminMail 
      ,@SeoAlias 
      ,@SeoTitle 
      ,@SeoKeyword 
      ,@SeoDescription 
	  ,@Status 
)
SELECT TOP 1 * FROM @IdSave
GO
/****** Object:  StoredProcedure [dbo].[Options_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Options_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Options(
	[SiteUrl]
      ,[SiteName]
      ,[SiteDescription]
      ,[AdminMail]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
	[SiteUrl]
      ,[SiteName]
      ,[SiteDescription]
      ,[AdminMail]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
      SiteUrl varchar(50)
      ,SiteName nvarchar(250)
      ,SiteDescription nvarchar(500)
      ,AdminMail varchar(50)
      ,SeoAlias nvarchar(250)
      ,SeoTitle nvarchar(250)
      ,SeoKeyword nvarchar(250)
      ,SeoDescription nvarchar(250)
	  ,Status tinyint
)
--select @@RowCount
SELECT Id FROM @resultTbl
END
GO
/****** Object:  StoredProcedure [dbo].[Options_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Options_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Options] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Options] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END


GO
/****** Object:  StoredProcedure [dbo].[Options_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Options_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Options_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Options ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Options_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Options ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Options_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[Options_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Options_Update]
	@Id int
      ,@SiteUrl varchar(50)
      ,@SiteName nvarchar(250)
      ,@SiteDescription nvarchar(500)
      ,@AdminMail varchar(50)
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
      ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
	  ,@Status tinyint


AS

UPDATE Options SET
     [SiteUrl] = @SiteUrl
      ,[SiteName] = @SiteName
      ,[SiteDescription] = @SiteDescription
      ,[AdminMail] = @AdminMail
      ,[SeoAlias] = @SeoAlias
      ,[SeoTitle] = @SeoTitle
      ,[SeoKeyword] = @SeoKeyword
      ,[SeoDescription] = @SeoDescription
      ,[Status] = @Status
WHERE
    
	[Options].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Options_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Options_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Options SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 
GO
/****** Object:  StoredProcedure [dbo].[Pages_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pages_Delete]
	@Id int
    
	AS

DELETE FROM Pages
WHERE 
	[Pages].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Pages_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Pages_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Pages OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END
GO
/****** Object:  StoredProcedure [dbo].[Pages_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Pages_GetAll]
AS

SELECT
	*
FROM [Pages] a



GO
/****** Object:  StoredProcedure [dbo].[Pages_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Pages_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Pages] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[Pages_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Pages_Insert]
@Code varchar(50)
      ,@Title nvarchar(250)
      ,@Content nvarchar(MAX)
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
      ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
      ,@Status tinyint
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Pages (
    [Code]
      ,[Title]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
       @Code 
      ,@Title 
      ,@Content 
      ,@SeoAlias 
      ,@SeoTitle 
      ,@SeoKeyword 
      ,@SeoDescription 
      ,@Status 
)
SELECT TOP 1 * FROM @IdSave


GO
/****** Object:  StoredProcedure [dbo].[Pages_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Pages_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Pages(
	[Code]
      ,[Title]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
	[Code]
      ,[Title]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
      Code varchar(50)
      ,Title nvarchar(250)
      ,Content nvarchar(MAX)
      ,SeoAlias nvarchar(250)
      ,SeoTitle nvarchar(250)
      ,SeoKeyword nvarchar(250)
      ,SeoDescription nvarchar(250)
      ,Status tinyint
)
--select @@RowCount
SELECT Id FROM @resultTbl
END
GO
/****** Object:  StoredProcedure [dbo].[Pages_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Pages_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Pages] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Pages] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Pages_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Pages_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Pages_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Pages ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Pages_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Pages ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Pages_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[Pages_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Pages_Update]
	@Id int
,@Code varchar(50)
      ,@Title nvarchar(250)
      ,@Content nvarchar(MAX)
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
      ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
      ,@Status tinyint


AS

UPDATE Pages SET
   [Code] = @Code
      ,[Title] = @Title
      ,[Content] = @Content
      ,[SeoAlias] = @SeoAlias
      ,[SeoTitle] = @SeoTitle
      ,[SeoKeyword] = @SeoKeyword
      ,[SeoDescription] = @SeoDescription
      ,[Status] = @Status
WHERE
    
	[Pages].[Id] = @Id
SELECT @@RowCount




GO
/****** Object:  StoredProcedure [dbo].[Pages_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Pages_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Pages SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 

GO
/****** Object:  StoredProcedure [dbo].[PageStatics_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PageStatics_Delete]
	@Id int
    
	AS

DELETE FROM PageStatics
WHERE 
	[PageStatics].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[PageStatics_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PageStatics_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM PageStatics OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END
GO
/****** Object:  StoredProcedure [dbo].[PageStatics_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PageStatics_GetAll]
AS

SELECT
	*
FROM [PageStatics] a



GO
/****** Object:  StoredProcedure [dbo].[PageStatics_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PageStatics_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [PageStatics] a

WHERE
	a.[Id] = @Id

GO
/****** Object:  StoredProcedure [dbo].[PageStatics_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[PageStatics_Insert]
@Title nvarchar(250)
      ,@Content nvarchar(MAX)
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
      ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
      ,@Status tinyint
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO PageStatics (
      [Title]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @Title 
      ,@Content 
      ,@SeoAlias 
      ,@SeoTitle 
      ,@SeoKeyword 
      ,@SeoDescription 
      ,@Status 
)
SELECT TOP 1 * FROM @IdSave




GO
/****** Object:  StoredProcedure [dbo].[PageStatics_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PageStatics_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO PageStatics(
      [Title]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
      [Title]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
      Title nvarchar(250)
      ,Content nvarchar(MAX)
      ,SeoAlias nvarchar(250)
      ,SeoTitle nvarchar(250)
      ,SeoKeyword nvarchar(250)
      ,SeoDescription nvarchar(250)
      ,Status tinyint
)
--select @@RowCount
SELECT Id FROM @resultTbl
END

GO
/****** Object:  StoredProcedure [dbo].[PageStatics_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PageStatics_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [PageStatics] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [PageStatics] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[PageStatics_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- PageStatics_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[PageStatics_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			PageStatics ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [PageStatics_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				PageStatics ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[PageStatics_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[PageStatics_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[PageStatics_Update]
	@Id int
      ,@Title nvarchar(250)
      ,@Content nvarchar(MAX)
      ,@SeoAlias nvarchar(250)
      ,@SeoTitle nvarchar(250)
      ,@SeoKeyword nvarchar(250)
      ,@SeoDescription nvarchar(250)
      ,@Status tinyint


AS

UPDATE PageStatics SET
      [Title] = @Title
      ,[Content] = @Content
      ,[SeoAlias] = @SeoAlias
      ,[SeoTitle] = @SeoTitle
      ,[SeoKeyword] = @SeoKeyword
      ,[SeoDescription] = @SeoDescription
      ,[Status] = @Status
WHERE
    
	[PageStatics].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[PageStatics_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PageStatics_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE PageStatics SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 

GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PostInCategories_Delete]
	@Id int
    
	AS

DELETE FROM PostInCategories
WHERE 
	[PostInCategories].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostInCategories_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM PostInCategories OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END
GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostInCategories_GetAll]
AS

SELECT
	*
FROM [PostInCategories] a



GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PostInCategories_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [PostInCategories] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostInCategories_Insert]
@PostId bigint
	  ,@CategoryId bigint
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO PostInCategories (
      [PostId]
      ,[CategoryId]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @PostId 
      ,@CategoryId 
     
)
SELECT TOP 1 * FROM @IdSave

GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostInCategories_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO PostInCategories(
       [PostId]
      ,[CategoryId]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
     [PostId]
      ,[CategoryId]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
 PostId bigint
	  ,CategoryId bigint
      
)
--select @@RowCount
SELECT Id FROM @resultTbl
END

GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[PostInCategories_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [PostInCategories] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [PostInCategories] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END


GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- PostInCategories_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[PostInCategories_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			PostInCategories ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [PostInCategories_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				PostInCategories ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[PostInCategories_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[PostInCategories_Update]
@Id bigint
      ,@PostId bigint
	  ,@CategoryId bigint


AS

UPDATE PostInCategories SET
      [PostId] = @PostId
      ,[CategoryId] = @CategoryId
     
WHERE
    
	[PostInCategories].[Id] = @Id
SELECT @@RowCount





GO
/****** Object:  StoredProcedure [dbo].[PostInCategories_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostInCategories_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE PostInCategories SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 

GO
/****** Object:  StoredProcedure [dbo].[PostInTags_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PostInTags_Delete]
	@Id int
    
	AS

DELETE FROM PostInTags
WHERE 
	[PostInTags].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[PostInTags_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostInTags_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM PostInTags OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END

GO
/****** Object:  StoredProcedure [dbo].[PostInTags_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostInTags_GetAll]
AS

SELECT
	*
FROM [PostInTags] a


GO
/****** Object:  StoredProcedure [dbo].[PostInTags_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostInTags_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [PostInTags] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[PostInTags_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostInTags_Insert]
@PostId bigint
	  ,@TagsId bigint
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO PostInTags (
      [PostId]
      ,[TagsId]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @PostId 
      ,@TagsId 
     
)
SELECT TOP 1 * FROM @IdSave

GO
/****** Object:  StoredProcedure [dbo].[PostInTags_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostInTags_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO PostInTags(
       [PostId]
      ,[TagsId]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
     [PostId]
      ,[TagsId]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
 PostId bigint
	  ,TagsId bigint
      
)
--select @@RowCount
SELECT Id FROM @resultTbl
END


GO
/****** Object:  StoredProcedure [dbo].[PostInTags_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostInTags_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [PostInTags] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [PostInTags] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[PostInTags_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- PostInTags_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[PostInTags_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			PostInTags ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [PostInTags_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				PostInTags ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[PostInTags_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[PostInTags_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostInTags_Update]
@Id bigint
      ,@PostId bigint
	  ,@TagsId bigint


AS

UPDATE PostInTags SET
      [PostId] = @PostId
      ,[TagsId] = @TagsId
     
WHERE
    
	[PostInTags].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[PostInTags_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostInTags_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE PostInTags SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 
GO
/****** Object:  StoredProcedure [dbo].[PostRelations_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PostRelations_Delete]
	@Id int
    
	AS

DELETE FROM PostRelations
WHERE 
	[PostRelations].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[PostRelations_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostRelations_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM PostRelations OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END

GO
/****** Object:  StoredProcedure [dbo].[PostRelations_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostRelations_GetAll]
AS

SELECT
	*
FROM [PostRelations] a


GO
/****** Object:  StoredProcedure [dbo].[PostRelations_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostRelations_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [PostRelations] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[PostRelations_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostRelations_Insert]
@Title nvarchar(250)
,@Thumbnail nvarchar(250)
,@Description nvarchar(250)
,@Url nvarchar(250)
      ,@PostId bigint
	  ,@PostRelationId bigint
	  ,@Status bit
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO PostRelations (
      [Title]
      ,[Thumbnail]
      ,[Description]
      ,[Url]
      ,[PostId]
      ,[PostRelationId]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @Title 
,@Thumbnail 
,@Description 
,@Url 
      ,@PostId 
	  ,@PostRelationId 
	  ,@Status 
     
)
SELECT TOP 1 * FROM @IdSave


GO
/****** Object:  StoredProcedure [dbo].[PostRelations_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostRelations_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO PostRelations(
       [Title]
      ,[Thumbnail]
      ,[Description]
      ,[Url]
      ,[PostId]
      ,[PostRelationId]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
      [Title]
      ,[Thumbnail]
      ,[Description]
      ,[Url]
      ,[PostId]
      ,[PostRelationId]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
 Title nvarchar(250)
,Thumbnail nvarchar(250)
,Description nvarchar(250)
,Url nvarchar(250)
      ,PostId bigint
	  ,PostRelationId bigint
	  ,Status bit
      
)
--select @@RowCount
SELECT Id FROM @resultTbl
END

GO
/****** Object:  StoredProcedure [dbo].[PostRelations_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PostRelations_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [PostRelations] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [PostRelations] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PostRelations_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- PostRelations_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[PostRelations_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			PostRelations ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [PostRelations_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				PostRelations ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[PostRelations_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[PostRelations_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[PostRelations_Update]
@Id bigint
,@Title nvarchar(250)
,@Thumbnail nvarchar(250)
,@Description nvarchar(250)
,@Url nvarchar(250)
      ,@PostId bigint
	  ,@PostRelationId bigint
	  ,@Status bit


AS

UPDATE PostRelations SET
      [Title] = @Title
      ,[Thumbnail] = @Thumbnail
      ,[Description] = @Description
      ,[Url] = @Url
      ,[PostId] = @PostId
      ,[PostRelationId] = @PostRelationId
      ,[Status] = @Status
     
WHERE
    
	[PostRelations].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[PostRelations_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PostRelations_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE PostRelations SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 




GO
/****** Object:  StoredProcedure [dbo].[Posts_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Posts_Delete]
	@Id int
    
	AS

DELETE FROM Posts
WHERE 
	[Posts].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Posts_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Posts_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Posts OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END

GO
/****** Object:  StoredProcedure [dbo].[Posts_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Posts_GetAll]
AS

SELECT
	*
FROM [Posts] a


GO
/****** Object:  StoredProcedure [dbo].[Posts_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Posts_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Posts] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[Posts_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Posts_Insert]
@CreateUser bigint
,@Type tinyint
,@Title nvarchar(250)
,@Description nvarchar(500)
,@Content nvarchar(MAX)
,@Tags nvarchar(MAX)
,@Image nvarchar(MAX)
,@Video nvarchar(MAX)
,@CreatedTime datetime
,@UpdateTime datetime
,@UpdateUser bigint
 ,@Status tinyint
,@Thumbnail nvarchar(250)
,@SourceWeb nvarchar(250)
,@SeoAlias nvarchar(250)
,@SeoTitle nvarchar(250)
,@SeoKeyword nvarchar(250)
,@SeoDescription nvarchar(250)
,@Viewed int
,@HotDate datetime
,@NewDate datetime
,@Author nvarchar(250)
,@PublishedDate datetime
	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Posts (
      [CreateUser]
      ,[Type]
      ,[Title]
      ,[Description]
      ,[Content]
      ,[Tags]
      ,[Image]
      ,[Video]
      ,[CreatedTime]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Status]
      ,[Thumbnail]
      ,[SourceWeb]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Viewed]
      ,[HotDate]
      ,[NewDate]
      ,[Author]
      ,[PublishedDate]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @CreateUser 
,@Type 
,@Title 
,@Description 
,@Content 
,@Tags
,@Image 
,@Video 
,@CreatedTime 
,@UpdateTime 
,@UpdateUser 
 ,@Status 
,@Thumbnail 
,@SourceWeb 
,@SeoAlias 
,@SeoTitle 
,@SeoKeyword 
,@SeoDescription 
,@Viewed 
,@HotDate 
,@NewDate 
,@Author 
,@PublishedDate 
     
)
SELECT TOP 1 * FROM @IdSave



GO
/****** Object:  StoredProcedure [dbo].[Posts_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Posts_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Posts(
      [CreateUser]
      ,[Type]
      ,[Title]
      ,[Description]
      ,[Content]
      ,[Tags]
      ,[Image]
      ,[Video]
      ,[CreatedTime]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Status]
      ,[Thumbnail]
      ,[SourceWeb]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Viewed]
      ,[HotDate]
      ,[NewDate]
      ,[Author]
      ,[PublishedDate]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
      [CreateUser]
      ,[Type]
      ,[Title]
      ,[Description]
      ,[Content]
      ,[Tags]
      ,[Image]
      ,[Video]
      ,[CreatedTime]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Status]
      ,[Thumbnail]
      ,[SourceWeb]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Viewed]
      ,[HotDate]
      ,[NewDate]
      ,[Author]
      ,[PublishedDate]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
 CreateUser bigint
,Type tinyint
,Title nvarchar(250)
,Description nvarchar(500)
,Content nvarchar(MAX)
,Tags nvarchar(MAX)
,Image nvarchar(MAX)
,Video nvarchar(MAX)
,CreatedTime datetime
,UpdateTime datetime
,UpdateUser bigint
 ,Status tinyint
,Thumbnail nvarchar(250)
,SourceWeb nvarchar(250)
,SeoAlias nvarchar(250)
,SeoTitle nvarchar(250)
,SeoKeyword nvarchar(250)
,SeoDescription nvarchar(250)
,Viewed int
,HotDate datetime
,NewDate datetime
,Author nvarchar(250)
,PublishedDate datetime
      
)
--select @@RowCount
SELECT Id FROM @resultTbl
END

GO
/****** Object:  StoredProcedure [dbo].[Posts_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Posts_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Posts] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Posts] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Posts_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Posts_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Posts_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Posts ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Posts_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Posts ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Posts_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[Posts_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Posts_Update]
@Id bigint
,@CreateUser bigint
,@Type tinyint
,@Title nvarchar(250)
,@Description nvarchar(500)
,@Content nvarchar(MAX)
,@Tags nvarchar(MAX)
,@Image nvarchar(MAX)
,@Video nvarchar(MAX)
,@CreatedTime datetime
,@UpdateTime datetime
,@UpdateUser bigint
 ,@Status tinyint
,@Thumbnail nvarchar(250)
,@SourceWeb nvarchar(250)
,@SeoAlias nvarchar(250)
,@SeoTitle nvarchar(250)
,@SeoKeyword nvarchar(250)
,@SeoDescription nvarchar(250)
,@Viewed int
,@HotDate datetime
,@NewDate datetime
,@Author nvarchar(250)
,@PublishedDate datetime


AS

UPDATE Posts SET
       [CreateUser] = @CreateUser
      ,[Type] =  @Type
      ,[Title] = @Title
      ,[Description] = @Description
      ,[Content] = @Content
      ,[Tags] =@Tags
      ,[Image] = @Image
      ,[Video] = @Video
      ,[CreatedTime] =@CreatedTime
      ,[UpdateTime] = @UpdateTime
      ,[UpdateUser] = @UpdateUser
      ,[Status] = @Status
      ,[Thumbnail] =@Thumbnail
      ,[SourceWeb] = @SourceWeb
      ,[SeoAlias] = @SeoAlias
      ,[SeoTitle] = @SeoTitle
      ,[SeoKeyword] = @SeoKeyword
      ,[SeoDescription] = @SeoDescription
      ,[Viewed] = @Viewed
      ,[HotDate] = @HotDate
      ,[NewDate] = @NewDate
      ,[Author] = @Author
      ,[PublishedDate] = @PublishedDate
     
WHERE
    
	[Posts].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[Posts_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Posts_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Posts SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 

GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SystermCodes_Delete]
	@Id int
    
	AS

DELETE FROM SystermCodes
WHERE 
	[SystermCodes].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SystermCodes_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM SystermCodes OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END

GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SystermCodes_GetAll]
AS

SELECT
	*
FROM [SystermCodes] a


GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SystermCodes_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [SystermCodes] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SystermCodes_Insert]
@Type nvarchar(50)
,@Value nvarchar(50)
,@Text nvarchar(500)
,@Note nvarchar(MAX)
 ,@Status tinyint

	
AS
DECLARE @IdSave table (Id int)
INSERT INTO SystermCodes (
     [Type]
      ,[Value]
      ,[Text]
      ,[Note]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
      @Type 
,@Value 
,@Text 
,@Note 
 ,@Status 
     
)
SELECT TOP 1 * FROM @IdSave

GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SystermCodes_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO SystermCodes(
     [Type]
      ,[Value]
      ,[Text]
      ,[Note]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
      [Type]
      ,[Value]
      ,[Text]
      ,[Note]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
 Type nvarchar(50)
,Value nvarchar(50)
,Text nvarchar(500)
,Note nvarchar(MAX)
 ,Status tinyint
      
)
--select @@RowCount
SELECT Id FROM @resultTbl
END

GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SystermCodes_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [SystermCodes] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [SystermCodes] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SystermCodes_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[SystermCodes_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			SystermCodes ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [SystermCodes_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				SystermCodes ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[SystermCodes_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	
GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SystermCodes_Update]
@Id bigint
,@Type nvarchar(50)
,@Value nvarchar(50)
,@Text nvarchar(500)
,@Note nvarchar(MAX)
 ,@Status tinyint


AS

UPDATE SystermCodes SET
      [Type] = @Type
      ,[Value] = @Value
      ,[Text] = @Text
      ,[Note] = @Note
      ,[Status] = @Status
WHERE
    
	[SystermCodes].[Id] = @Id
SELECT @@RowCount



GO
/****** Object:  StoredProcedure [dbo].[SystermCodes_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SystermCodes_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE SystermCodes SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 

GO
/****** Object:  StoredProcedure [dbo].[Tags_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tags_Delete]
	@Id int
    
	AS

DELETE FROM Tags
WHERE 
	[Tags].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Tags_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tags_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Tags OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END
GO
/****** Object:  StoredProcedure [dbo].[Tags_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Tags_GetAll]
AS

SELECT
	*
FROM [Tags] a


GO
/****** Object:  StoredProcedure [dbo].[Tags_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tags_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Tags] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[Tags_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Tags_Insert]
@Slug nvarchar(250)
,@Name nvarchar(500)
,@Content nvarchar(MAX)
,@SeoAlias nvarchar(250)
,@SeoTitle nvarchar(250)
,@SeoKeyword nvarchar(250)
,@SeoDescription nvarchar(250)
 ,@Status tinyint


	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Tags (
     [Slug]
      ,[Name]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
     @Slug 
,@Name 
,@Content 
,@SeoAlias 
,@SeoTitle 
,@SeoKeyword 
,@SeoDescription 
 ,@Status 
     
)
SELECT TOP 1 * FROM @IdSave


GO
/****** Object:  StoredProcedure [dbo].[Tags_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Tags_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Tags(
    [Slug]
      ,[Name]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
     [Slug]
      ,[Name]
      ,[Content]
      ,[SeoAlias]
      ,[SeoTitle]
      ,[SeoKeyword]
      ,[SeoDescription]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
 Slug nvarchar(250)
,Name nvarchar(500)
,Content nvarchar(MAX)
,SeoAlias nvarchar(250)
,SeoTitle nvarchar(250)
,SeoKeyword nvarchar(250)
,SeoDescription nvarchar(250)
 ,Status tinyint
      
)
--select @@RowCount
SELECT Id FROM @resultTbl
END
GO
/****** Object:  StoredProcedure [dbo].[Tags_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Tags_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Tags] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Tags] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Tags_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Tags_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Tags_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Tags ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Tags_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Tags ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Tags_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	

GO
/****** Object:  StoredProcedure [dbo].[Tags_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[Tags_Update]
@Id int
,@Slug nvarchar(250)
,@Name nvarchar(500)
,@Content nvarchar(MAX)
,@SeoAlias nvarchar(250)
,@SeoTitle nvarchar(250)
,@SeoKeyword nvarchar(250)
,@SeoDescription nvarchar(250)
 ,@Status tinyint



AS

UPDATE Tags SET
      [Slug] = @Slug
      ,[Name] = @Name
      ,[Content] = @Content
      ,[SeoAlias] = @SeoAlias
      ,[SeoTitle] = @SeoTitle
      ,[SeoKeyword] = @SeoKeyword
      ,[SeoDescription] = @SeoDescription
      ,[Status] = @Status
WHERE
    
	[Tags].[Id] = @Id
SELECT @@RowCount



GO
/****** Object:  StoredProcedure [dbo].[Tags_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Tags_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Tags SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 




GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_Delete]
	@Id int
    
	AS

DELETE FROM Users
WHERE 
	[Users].[Id] = @Id
SELECT @@RowCount

GO
/****** Object:  StoredProcedure [dbo].[Users_Deletes]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_Deletes]
	@sWhere nvarchar(max)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = '
DECLARE @resultTbl TABLE (Id int)
DELETE FROM Users OUTPUT Deleted.Id INTO @resultTbl WHERE ' + @sWhere
+' SELECT Id FROM @resultTbl'
--print @sSQL
EXECUTE sp_executesql @sSQL;
--SELECT @@RowCount

END

GO
/****** Object:  StoredProcedure [dbo].[Users_GetAll]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_GetAll]
AS

SELECT
	*
FROM [Users] a

GO
/****** Object:  StoredProcedure [dbo].[Users_GetById]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_GetById]
	@Id int
	
AS

SELECT
	a.*
FROM [Users] a

WHERE
	a.[Id] = @Id


GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_Insert]
@UserName nchar(50)
,@FirstName nvarchar(50)
,@LastName nvarchar(50)
,@Email nvarchar(50)
,@Phone nvarchar(20)
,@Password nchar(50)
,@Avatar  nvarchar(max)
,@Type tinyint
,@CreatedTime datetime
,@CreatedUser bigint
,@UpdateTime datetime
,@UpdateUser bigint
 ,@Status tinyint


	
AS
DECLARE @IdSave table (Id int)
INSERT INTO Users (
     [UserName]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
      ,[Password]
      ,[Avatar]
      ,[Type]
      ,[CreatedTime]
      ,[CreatedUser]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Status]
)
OUTPUT  INSERTED.[Id] into @IdSave
VALUES (
    @UserName 
,@FirstName 
,@LastName
,@Email 
,@Phone 
,@Password 
,@Avatar  
,@Type 
,@CreatedTime 
,@CreatedUser 
,@UpdateTime 
,@UpdateUser 
 ,@Status 
     
)
SELECT TOP 1 * FROM @IdSave

GO
/****** Object:  StoredProcedure [dbo].[Users_Inserts]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Users_Inserts]
@XMLDOC nvarchar(max)
AS
declare @xml_hndl int
DECLARE @resultTbl TABLE (Id int)
BEGIN

exec sp_xml_preparedocument @xml_hndl OUTPUT, @XMLDOC
INSERT INTO Users(
   [UserName]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
      ,[Password]
      ,[Avatar]
      ,[Type]
      ,[CreatedTime]
      ,[CreatedUser]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Status]
) 
OUTPUT inserted.Id INTO @resultTbl
Select 
    [UserName]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
      ,[Password]
      ,[Avatar]
      ,[Type]
      ,[CreatedTime]
      ,[CreatedUser]
      ,[UpdateTime]
      ,[UpdateUser]
      ,[Status]
From
OPENXML(@xml_hndl, '/items/item', 1)
With(
UserName nchar(50)
,FirstName nvarchar(50)
,LastName nvarchar(50)
,Email nvarchar(50)
,Phone nvarchar(20)
,Password nchar(50)
,Avatar  nvarchar(max)
,Type tinyint
,CreatedTime datetime
,CreatedUser bigint
,UpdateTime datetime
,UpdateUser bigint
 ,Status tinyint
      
)
--select @@RowCount
SELECT Id FROM @resultTbl
END

GO
/****** Object:  StoredProcedure [dbo].[Users_List]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Users_List]
	  
	
	@sWhere nvarchar(1000) ,
	@sOrder nvarchar(1000),
	@fromRow int ,
	@toRow int
AS
DECLARE @SQL NVARCHAR(4000)
BEGIN
IF (@sWhere IS NULL OR @sWhere='')  SET @sWhere=' '
ELSE SET @sWhere = ' WHERE ' + @sWhere+' '

IF (@sOrder IS NULL OR @sOrder='')  SET @sOrder=' '
ELSE SET @sOrder = ' ORDER BY ' + @sOrder+' '

IF @toRow <= 0
	BEGIN
		SET @SQL = 'SELECT a.* FROM [Users] a '+ @sWhere+ @sOrder;
		EXECUTE sp_executesql @SQL;
	END
ELSE
	BEGIN
		IF (@sOrder IS NULL OR @sOrder='') SET @sOrder='ORDER BY a.Id'
		SET @SQL = 'WITH PagingTable AS
			(SELECT a.*,ROW_NUMBER() OVER('+@sOrder+') AS RowNumber
			FROM [Users] a '+@sWhere+')
			SELECT * FROM PagingTable WHERE RowNumber BETWEEN '+CONVERT(Nvarchar,@fromRow)+' AND '+CONVERT(Nvarchar,@toRow)+';'
		EXECUTE sp_executesql @SQL;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Users_Paging]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Users_Paging null,null,0,20,null,0

CREATE PROCEDURE [dbo].[Users_Paging]  
	@currentPage int=NULL,
	@RowsInPage int=NULL,
	@TotalRows int output
	
AS 
	
	
	SELECT
		@TotalRows = COUNT(1)
		
	FROM 
			Users ST WITH (NOLOCK)
			
			
			
	DECLARE @StartRowIndex int
	SET @StartRowIndex = (@currentPage-1 )* @RowsInPage + 1;
	
	WITH [Users_Paging] AS
	(
		  SELECT 
				ROW_NUMBER() OVER (ORDER BY ST.Id DESC) AS [STT], 
				ST.*
		  FROM 
				Users ST WITH (NOLOCK)
	)
			
	SELECT 
		PSFS.*
	FROM 
		[Users_Paging] PSFS WITH (NOLOCK) 
	WHERE 
		PSFS.[STT] BETWEEN @StartRowIndex AND @StartRowIndex + @RowsInPage - 1 
	ORDER BY PSFS.[STT] 
	
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[Users_Update]
@Id bigint
,@UserName nchar(50)
,@FirstName nvarchar(50)
,@LastName nvarchar(50)
,@Email nvarchar(50)
,@Phone nvarchar(20)
,@Password nchar(50)
,@Avatar  nvarchar(max)
,@Type tinyint
,@CreatedTime datetime
,@CreatedUser bigint
,@UpdateTime datetime
,@UpdateUser bigint
 ,@Status tinyint




AS

UPDATE Users SET
      [UserName] = @UserName
      ,[FirstName] =@FirstName
      ,[LastName] = @LastName
      ,[Email] = @Email
      ,[Phone] = @Phone
      ,[Password] = @Password
      ,[Avatar] = @Avatar
      ,[Type] = @Type
      ,[CreatedTime] = @CreatedTime
      ,[CreatedUser] = @CreatedUser
      ,[UpdateTime] = @UpdateTime
      ,[UpdateUser] = @UpdateUser
      ,[Status] = @Status
WHERE
    
	[Users].[Id] = @Id
SELECT @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[Users_Updates]    Script Date: 12/13/2020 6:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Users_Updates]
	@sSet nvarchar(4000),
	@sWhere nvarchar(4000)
AS
DECLARE @sSQL nvarchar(max)
BEGIN
SET @sSQL = 'UPDATE Users SET ' + 	@sSet + ' WHERE ' + @sWhere
EXECUTE sp_executesql @sSQL;
SELECT @@RowCount
END
 
GO
USE [master]
GO
ALTER DATABASE [TinTuc] SET  READ_WRITE 
GO
