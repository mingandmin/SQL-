USE [master]
GO
/****** Object:  Database [zmceshi]    Script Date: 09/21/2017 18:07:07 ******/
CREATE DATABASE [zmceshi] ON  PRIMARY 
( NAME = N'zmceshi', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL10.SA\MSSQL\DATA\zmceshi.mdf' , SIZE = 6400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'zmceshi_log', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL10.SA\MSSQL\DATA\zmceshi_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [zmceshi] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zmceshi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zmceshi] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [zmceshi] SET ANSI_NULLS OFF
GO
ALTER DATABASE [zmceshi] SET ANSI_PADDING OFF
GO
ALTER DATABASE [zmceshi] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [zmceshi] SET ARITHABORT OFF
GO
ALTER DATABASE [zmceshi] SET AUTO_CLOSE ON
GO
ALTER DATABASE [zmceshi] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [zmceshi] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [zmceshi] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [zmceshi] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [zmceshi] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [zmceshi] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [zmceshi] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [zmceshi] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [zmceshi] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [zmceshi] SET  ENABLE_BROKER
GO
ALTER DATABASE [zmceshi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [zmceshi] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [zmceshi] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [zmceshi] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [zmceshi] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [zmceshi] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [zmceshi] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [zmceshi] SET  READ_WRITE
GO
ALTER DATABASE [zmceshi] SET RECOVERY SIMPLE
GO
ALTER DATABASE [zmceshi] SET  MULTI_USER
GO
ALTER DATABASE [zmceshi] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [zmceshi] SET DB_CHAINING OFF
GO
USE [zmceshi]
GO
/****** Object:  Table [dbo].[bb]    Script Date: 09/21/2017 18:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bb](
	[岗位类别] [nvarchar](255) NULL,
	[开课单位] [nvarchar](255) NULL,
	[工资号] [nvarchar](255) NULL,
	[姓名] [nvarchar](255) NULL,
	[身份证号] [nvarchar](255) NULL,
	[所属单位] [nvarchar](255) NULL,
	[课时周数] [int] NULL,
	[折合系数课时量] [int] NULL,
	[本次二次分配] [int] NULL,
	[累积应发二次分配] [int] NULL,
	[本次应发] [int] NULL,
	[累计已发] [int] NULL,
	[累计应发] [int] NULL,
	[课时标准] [int] NULL,
	[外聘应发] [int] NULL,
	[累计期末应发] [int] NULL,
	[实发课时费] [int] NULL,
	[周序号] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aa]    Script Date: 09/21/2017 18:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aa](
	[岗位类别] [nvarchar](255) NULL,
	[开课单位] [nvarchar](255) NULL,
	[工资号] [nvarchar](255) NULL,
	[姓名] [nvarchar](255) NULL,
	[身份证号] [nvarchar](255) NULL,
	[所属单位] [nvarchar](255) NULL,
	[折合系数课时量] [float] NULL,
	[课时周数] [float] NULL,
	[周序号] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'人文与艺术学院', N'20170164', N'代喜', N'360403198911120345', N'人文与艺术学院', 65, 4, 1)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'人文与艺术学院', N'20170164', N'代喜', N'360403198911120345', N'人文与艺术学院', 44, 4, 2)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'人文与艺术学院', N'20170164', N'代喜', N'360403198911120345', N'人文与艺术学院', 52, 4, 3)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'人文与艺术学院', N'20170164', N'代喜', N'360403198911120345', N'人文与艺术学院', 67, 4, 4)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'人文与艺术学院', N'20170163', N'郑梦瑶', N'361102199511244042', N'人文与艺术学院', 56, 4, 1)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'人文与艺术学院', N'20170163', N'郑梦瑶', N'361102199511244042', N'人文与艺术学院', 68, 4, 2)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'人文与艺术学院', N'20170163', N'郑梦瑶', N'361102199511244042', N'人文与艺术学院', 54, 4, 3)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'图书馆', N'20170167', N'刘星', N'411330199110121560', N'图书馆', 57, 4, 1)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'图书馆', N'20170167', N'刘星', N'411330199110121560', N'图书馆', 57, 4, 2)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'图书馆', N'20170167', N'刘星', N'411330199110121560', N'图书馆', 57, 4, 3)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'机械与车辆工程学院', N'20170090', N'李爽', N'420116199210285928', N'机械与车辆工程学院', 51, 4, 1)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'机械与车辆工程学院', N'20170090', N'李爽', N'420116199210285928', N'机械与车辆工程学院', 51, 4, 2)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'专职教师', N'机械与车辆工程学院', N'20170090', N'李爽', N'420116199210285928', N'机械与车辆工程学院', 51, 4, 3)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'外聘教师', N'经济管理学院', N'20170133', N'章长英', N'36010319721114074x', N'会学院', 66, 4, 1)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'外聘教师', N'经济管理学院', N'20170133', N'章长英', N'36010319721114074x', N'会学院', 66, 4, 2)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'外聘教师', N'经济管理学院', N'20170133', N'章长英', N'36010319721114074x', N'会学院', 66, 4, 3)
INSERT [dbo].[aa] ([岗位类别], [开课单位], [工资号], [姓名], [身份证号], [所属单位], [折合系数课时量], [课时周数], [周序号]) VALUES (N'外聘教师', N'经济管理学院', N'20170133', N'章长英', N'36010319721114074x', N'会学院', 66, 4, 4)
