USE [master]
GO

/****** Object:  Database [Library]    Script Date: 11/21/2018 17:03:12 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Library')
DROP DATABASE [Library]
GO

USE [master]
GO

/****** Object:  Database [Library]    Script Date: 11/21/2018 17:03:12 ******/
CREATE DATABASE [Library] ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Library] SET ARITHABORT OFF 
GO

ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Library] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Library] SET  READ_WRITE 
GO

ALTER DATABASE [Library] SET RECOVERY FULL 
GO

ALTER DATABASE [Library] SET  MULTI_USER 
GO

ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO

USE [Library]
GO

/****** Object:  Table [dbo].[Assign]    Script Date: 11/21/2018 17:03:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Assign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[assignid]  AS ('AS'+right('000'+CONVERT([varchar](3),[id],(0)),(6))),
	[studentid] [nvarchar](50) NULL,
	[bookid] [nvarchar](50) NULL,
	[assigneddate] [nvarchar](50) NULL,
	[returndate] [nvarchar](50) NULL,
	[penality] [nvarchar](50) NULL,
	[statusid] [nchar](10) NULL,
	[updatestatusdate] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Library]
GO

/****** Object:  Table [dbo].[BookRecord]    Script Date: 11/21/2018 17:04:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BookRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookid] [nvarchar](50) NOT NULL,
	[bookname] [nvarchar](250) NULL,
	[bookpubname] [nvarchar](50) NULL,
	[bookpubyear] [nvarchar](50) NULL,
	[bookprice] [nvarchar](50) NULL,
	[bookquantity] [nvarchar](50) NULL,
	[recorddate] [nvarchar](50) NULL,
 CONSTRAINT [PK_BookRecord] PRIMARY KEY CLUSTERED 
(
	[bookid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Library]
GO

/****** Object:  Table [dbo].[statusdetails]    Script Date: 11/21/2018 17:04:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[statusdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusid] [nchar](10) NOT NULL,
	[statusname] [nvarchar](50) NULL,
 CONSTRAINT [PK_statusdetails] PRIMARY KEY CLUSTERED 
(
	[statusid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Library]
GO

/****** Object:  Table [dbo].[Student]    Script Date: 11/21/2018 17:04:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [nvarchar](50) NOT NULL,
	[studentname] [nvarchar](50) NULL,
	[studentbranch] [nvarchar](50) NULL,
	[studentyear] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_BookRecord] FOREIGN KEY([bookid])
REFERENCES [dbo].[BookRecord] ([bookid])
GO

ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_BookRecord]
GO

ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Student] FOREIGN KEY([studentid])
REFERENCES [dbo].[Student] ([studentid])
GO

ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Student]
GO


USE [Library]
GO

/****** Object:  StoredProcedure [dbo].[Penality]    Script Date: 11/21/2018 17:06:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Penality]
--@EntryID varchar (20)
AS
begin
DECLARE 
    @ID AS INT, 
    @ReturnDate AS VARCHAR(50),
    @Days AS VARCHAR(50)

DECLARE Penality_Cursor CURSOR FOR
SELECT ID, ReturnDate FROM dbo.Assign FOR UPDATE OF penality
OPEN Penality_Cursor
FETCH NEXT FROM Penality_Cursor
INTO @ID, @ReturnDate 

WHILE (@@FETCH_STATUS = 0)
BEGIN
    SELECT @Days =  (SELECT DATEDIFF(day,ReturnDate, GETDATE()) from Assign where ID = @ID)
    if (@Days > 0)
    begin
     UPDATE Assign SET penality = 5 * @Days WHERE CURRENT OF Penality_Cursor
    end
       
    FETCH NEXT FROM Penality_Cursor 
    INTO @ID, @ReturnDate
END

CLOSE Penality_Cursor 
DEALLOCATE Penality_Cursor 
END

SET NOCOUNT OFF

GO


