USE [master]
GO
/****** Object:  Database [LearnSQL]    Script Date: 02/11/2023 17:42:40 ******/
CREATE DATABASE [LearnSQL]
GO
ALTER DATABASE [LearnSQL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LearnSQL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LearnSQL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LearnSQL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LearnSQL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LearnSQL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LearnSQL] SET ARITHABORT OFF 
GO
ALTER DATABASE [LearnSQL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LearnSQL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LearnSQL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LearnSQL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LearnSQL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LearnSQL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LearnSQL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LearnSQL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LearnSQL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LearnSQL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LearnSQL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LearnSQL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LearnSQL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LearnSQL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LearnSQL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LearnSQL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LearnSQL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LearnSQL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LearnSQL] SET  MULTI_USER 
GO
ALTER DATABASE [LearnSQL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LearnSQL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LearnSQL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LearnSQL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LearnSQL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LearnSQL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LearnSQL] SET QUERY_STORE = OFF
GO
USE [LearnSQL]
GO
/****** Object:  Schema [sales]    Script Date: 02/11/2023 17:42:40 ******/
CREATE SCHEMA [sales]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FindMaxGpa]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[fn_FindMaxGpa](
	@major NVARCHAR(100)
)
RETURNS FLOAT(2)
AS
BEGIN
	DECLARE @max FLOAT;
	SELECT 
		@max = MAX(Gpa) 
	FROM 
		Students
	WHERE
		Major = @major;
	RETURN @max;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FindMinGpa]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[fn_FindMinGpa](
	@major NVARCHAR(100)
)
RETURNS FLOAT(2)
AS
BEGIN
	DECLARE @max FLOAT;
	SELECT 
		@max = MAX(Gpa) 
	FROM 
		Students;
	RETURN @max;
END;
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[PhoneNumber] [varchar](25) NULL,
	[Email] [varchar](255) NOT NULL,
	[Street] [nvarchar](255) NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[EmailLocalPart]  AS (substring([Email],(0),charindex('@',[Email],(0)))),
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Customers]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Customers] AS SELECT * FROM Customers
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[AddressNumber] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[District] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
 CONSTRAINT [PK__Stores__3B82F10177692DAC] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Stores]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Stores] AS SELECT * FROM Stores
GO
/****** Object:  Table [dbo].[SubjectApprovals]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectApprovals](
	[SubjectApprovalId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Credit] [int] NULL,
	[NumOfLesson] [int] NULL,
	[Type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectApprovalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Credit] [int] NULL,
	[NumOfLesson] [int] NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SubjectInfo]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_SubjectInfo]
AS
SELECT
	SubjectId,
	Name,
	Credit,
	NumOfLesson,
	Type,
	'Approved' AS [Approval Status]
FROM 
	Subjects
UNION
SELECT
	SubjectId,
	Name,
	Credit,
	NumOfLesson,
	Type,
	'Pending Approval' AS [Approval Status]
FROM 
	SubjectApprovals
GO
/****** Object:  Table [dbo].[Students]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MidName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Major] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Gpa] [float] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Students]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Students] AS SELECT * FROM Students
GO
/****** Object:  Table [dbo].[Registers]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registers](
	[RegisterId] [int] IDENTITY(1000,1) NOT NULL,
	[StudentId] [varchar](50) NOT NULL,
	[SubjectId] [varchar](50) NOT NULL,
	[RegisterTime] [datetime] NULL,
	[RegisterStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[RegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_StudentRegisters]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tạo view cho biết số lượng môn học đăng ký của từng sinh viên.
CREATE VIEW [dbo].[vw_StudentRegisters]
AS
	SELECT
		s.StudentId, 
		s.LastName, 
		s.FirstName, 
		s.Major,
		COUNT(r.StudentId) AS NumberOfSubject
	FROM
		Students s
		INNER JOIN Registers r
		ON s.StudentId = r.StudentId
	GROUP BY
		s.StudentId, 
		s.LastName, 
		s.FirstName, 
		s.Major
GO
/****** Object:  View [dbo].[vw_SubjectRegisters]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tạo view cho biết số lượng đăng ký của từng môn học.
CREATE VIEW [dbo].[vw_SubjectRegisters]
AS
	SELECT
		s.SubjectId, 
		s.Name, 
		s.Credit, 
		s.Type,
		COUNT(r.SubjectId) AS NumberOfRegister
	FROM
		Subjects s
		INNER JOIN Registers r
		ON s.SubjectId = r.SubjectId
	GROUP BY
		s.SubjectId, 
		s.Name, 
		s.Credit, 
		s.Type
GO
/****** Object:  View [dbo].[vw_EarliestRegisters]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tạo view cho biết sinh viên nào đăng ký môn học sớm nhất.
CREATE VIEW [dbo].[vw_EarliestRegisters]
AS
	SELECT TOP 1 WITH TIES
		s.*,
		r.RegisterTime
	FROM
		Students s
		INNER JOIN Registers r
		ON r.StudentId = s.StudentId
	ORDER BY
		r.RegisterTime ASC;

GO
/****** Object:  View [dbo].[vw_EarliestRegisteredSubjects]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tạo view cho biết môn học nào được đăng ký sớm nhất.
CREATE VIEW [dbo].[vw_EarliestRegisteredSubjects]
AS
	SELECT TOP 1 WITH TIES
		s.*,
		r.RegisterTime
	FROM
		Subjects s
		INNER JOIN Registers r
		ON r.SubjectId = s.SubjectId
	ORDER BY
		r.RegisterTime ASC;
GO
/****** Object:  View [dbo].[vw_NotRegistedStudents]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tạo view cho biết sinh viên nào không đăng ký môn học.
CREATE VIEW [dbo].[vw_NotRegistedStudents]
AS
	SELECT
		s.*
	FROM
		Students s
	WHERE
		s.StudentId NOT IN(
			SELECT	
				r.StudentId
			FROM
				Registers r
		);

GO
/****** Object:  View [dbo].[vw_NotRegistedSubjects]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tạo view cho biết môn học nào không có sinh viên đăng ký.
CREATE VIEW [dbo].[vw_NotRegistedSubjects]
AS
	SELECT
		s.*
	FROM
		Subjects s
	WHERE
		s.SubjectId NOT IN(
			SELECT	
				r.SubjectId
			FROM
				Registers r
		);

GO
/****** Object:  Table [dbo].[Salaries]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salaries](
	[SalaryId] [int] IDENTITY(100,1) NOT NULL,
	[StaffId] [int] NULL,
	[TargetId] [int] NULL,
	[BaseAmount] [decimal](10, 2) NOT NULL,
	[BaseSalary] [decimal](10, 2) NOT NULL,
	[Commission] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_TotalSalaries]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_TotalSalaries]
AS
	SELECT
		Commission,
		BaseSalary + Commission AS TotalSalary
	FROM
		Salaries
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Active] [bit] NULL,
	[StoreId] [int] NULL,
	[ManagerId] [int] NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StaffMaster]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[StaffMaster]
WITH SCHEMABINDING
AS 
	SELECT
		s.StaffId,
		s.FirstName,
		s.LastName,
		s.PhoneNumber,
		s.Email,
		st.StoreName,
		st.City
	FROM
		dbo.Staffs s
		INNER JOIN dbo.Stores st
		ON s.StoreId = st.StoreId;
GO
/****** Object:  View [dbo].[vw_StaffMasters]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[vw_StaffMasters]
WITH SCHEMABINDING
AS 
	SELECT
		s.StaffId,
		s.FirstName,
		s.LastName,
		s.PhoneNumber,
		s.Email,
		st.StoreName,
		st.City
	FROM
		dbo.Staffs s
		INNER JOIN dbo.Stores st
		ON s.StoreId = st.StoreId;
GO
/****** Object:  Table [dbo].[ChangeLogs]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeLogs](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[EventData] [xml] NOT NULL,
	[ChangedBy] [sysname] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[PetId] [int] NOT NULL,
	[Petname] [nvarchar](200) NULL,
	[PetKind] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pets_Id]    Script Date: 02/11/2023 17:42:40 ******/
CREATE CLUSTERED INDEX [IX_Pets_Id] ON [dbo].[Pets]
(
	[PetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreAudits]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreAudits](
	[StoreAuditId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[StoreName] [nvarchar](255) NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[AddressNumber] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[District] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[UpdateAt] [datetime] NOT NULL,
	[Operation] [char](3) NULL,
 CONSTRAINT [PK__StoreAud__26086C078639FBEB] PRIMARY KEY CLUSTERED 
(
	[StoreAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Targets]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Targets](
	[TargetId] [int] NOT NULL,
	[Percentage] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [varchar](30) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Regular] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Col1] [int] NULL,
	[Col2] [int] NULL,
	[FullName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestTable]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChangeLogs] ON 

INSERT [dbo].[ChangeLogs] ([ChangeLogId], [EventData], [ChangedBy]) VALUES (1, N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2022-08-04T17:25:42.987</PostTime><SPID>69</SPID><ServerName>BRANIUMACADEMY\SQLEXPRESS</ServerName><LoginName>branium</LoginName><UserName>dbo</UserName><DatabaseName>LearnSQL</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>TestTable1</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE TestTable1(Id INT PRIMARY KEY IDENTITY)</CommandText></TSQLCommand></EVENT_INSTANCE>', N'dbo')
INSERT [dbo].[ChangeLogs] ([ChangeLogId], [EventData], [ChangedBy]) VALUES (2, N'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2022-08-04T17:25:48.653</PostTime><SPID>69</SPID><ServerName>BRANIUMACADEMY\SQLEXPRESS</ServerName><LoginName>branium</LoginName><UserName>dbo</UserName><DatabaseName>LearnSQL</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>TestTable2</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE TestTable2(Id INT PRIMARY KEY IDENTITY)</CommandText></TSQLCommand></EVENT_INSTANCE>', N'dbo')
INSERT [dbo].[ChangeLogs] ([ChangeLogId], [EventData], [ChangedBy]) VALUES (3, N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2022-08-04T17:26:58.187</PostTime><SPID>69</SPID><ServerName>BRANIUMACADEMY\SQLEXPRESS</ServerName><LoginName>branium</LoginName><UserName>dbo</UserName><DatabaseName>LearnSQL</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>TestTable1</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE TestTable1</CommandText></TSQLCommand></EVENT_INSTANCE>', N'dbo')
INSERT [dbo].[ChangeLogs] ([ChangeLogId], [EventData], [ChangedBy]) VALUES (4, N'<EVENT_INSTANCE><EventType>DROP_TABLE</EventType><PostTime>2022-08-04T17:26:58.190</PostTime><SPID>69</SPID><ServerName>BRANIUMACADEMY\SQLEXPRESS</ServerName><LoginName>branium</LoginName><UserName>dbo</UserName><DatabaseName>LearnSQL</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>TestTable2</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>DROP TABLE TestTable2</CommandText></TSQLCommand></EVENT_INSTANCE>', N'dbo')
INSERT [dbo].[ChangeLogs] ([ChangeLogId], [EventData], [ChangedBy]) VALUES (5, N'<EVENT_INSTANCE><EventType>ALTER_TABLE</EventType><PostTime>2022-08-04T17:30:04.990</PostTime><SPID>69</SPID><ServerName>BRANIUMACADEMY\SQLEXPRESS</ServerName><LoginName>branium</LoginName><UserName>dbo</UserName><DatabaseName>LearnSQL</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>Test</ObjectName><ObjectType>TABLE</ObjectType><AlterTableActionList><Create><Columns><Name>FullName</Name></Columns></Create></AlterTableActionList><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>ALTER TABLE 
	Test 
ADD FullName NVARCHAR(200)</CommandText></TSQLCommand></EVENT_INSTANCE>', N'dbo')
SET IDENTITY_INSERT [dbo].[ChangeLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (1, N'Hoàng', N'Trần', N'0972123123', N'hoangtran@xmail.com', N'Bà Triệu', N'Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (2, N'Nam', N'Nguyễn', N'0972123145', N'namnguyen@xmail.com', N'Dịch Vọng', N'Cầu Giấy', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (3, N'Luân', N'Lê', N'0978123654', N'luanle@xmail.com', N'Thái Hà', N'Đống Đa', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (4, N'Minh', N'Ngô', N'0978456123', N'minhngo@xmail.com', N'Xuân Phương', N'Nam Từ Liêm', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (5, N'Ly', N'Phương', N'0902125463', N'phuongly@xmail.com', N'Phương Canh', N'Nam Từ Liêm', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (6, N'Trúc', N'Diễm', N'0974124125', N'trucdiem@xmail.com', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (7, N'Khánh', N'Nguyễn', N'0905225226', N'khanhnguyen@xmail.com', N'Cổ Nhuế', N'Bắc Từ Liêm', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (8, N'Toàn', N'Trương', N'0915225228', N'toantruong@xmail.com', N'Triều Khúc', N'Thanh Xuân', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (9, N'Linh', N'Lê', N'0356145156', N'linhle@xmail.com', N'Giáp Bát', N'Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (10, N'Khương', N'Mai', N'0354123123', N'maikhuong@xmail.com', N'Lê Thanh Nghị', N'Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (11, N'Hòa', N'Khúc', N'0362123565', N'hoalala@xmail.com', N'La Khê', N'Hà Đông', N'Hà Nội')
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber], [Email], [Street], [District], [City]) VALUES (12, N'Lâm', N'Trần', N'0346126127', N'tranlam@xmail.com', N'Dịch Vọng Hậu', N'Cầu Giấy', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Pets] ([PetId], [Petname], [PetKind]) VALUES (100, N'Mao Mao', N'Mèo mướp')
INSERT [dbo].[Pets] ([PetId], [Petname], [PetKind]) VALUES (102, N'Miu', N'Mèo đen')
INSERT [dbo].[Pets] ([PetId], [Petname], [PetKind]) VALUES (104, N'Gâu Gâu', N'Pitbull')
INSERT [dbo].[Pets] ([PetId], [Petname], [PetKind]) VALUES (106, N'Heo heo', N'Lợn ỉ')
INSERT [dbo].[Pets] ([PetId], [Petname], [PetKind]) VALUES (108, N'Quẹc quẹc', N'Vịt bầu')
GO
SET IDENTITY_INSERT [dbo].[Registers] ON 

INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1000, N'B25DCCN101', N'SUBJ1001', CAST(N'2022-04-19T00:00:00.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1001, N'B25DCCN102', N'SUBJ1002', CAST(N'2022-04-19T00:01:24.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1002, N'B25DCCN103', N'SUBJ1003', CAST(N'2022-04-19T00:10:20.000' AS DateTime), N'Đã hủy')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1003, N'B25DCDT108', N'SUBJ1004', CAST(N'2022-04-19T00:11:11.000' AS DateTime), N'Đã hủy')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1004, N'B25DCCN101', N'SUBJ1003', CAST(N'2022-04-19T00:01:01.000' AS DateTime), N'Lỗi đăng ký')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1005, N'B25DCQT109', N'SUBJ1005', CAST(N'2022-04-19T00:05:23.000' AS DateTime), N'Lỗi đăng ký')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1006, N'B25DCQT150', N'SUBJ1003', CAST(N'2022-04-19T00:03:45.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1007, N'B25DCCN178', N'SUBJ1007', CAST(N'2022-04-19T00:06:27.000' AS DateTime), N'Lỗi đăng ký')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1008, N'B25DCDT108', N'SUBJ1009', CAST(N'2022-04-19T00:07:12.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1009, N'B25DCQT150', N'SUBJ1007', CAST(N'2022-04-19T00:12:15.000' AS DateTime), N'Đã hủy')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1011, N'B25DCCN101', N'SUBJ1002', CAST(N'2022-04-19T01:00:01.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1012, N'B25DCCN104', N'SUBJ1005', CAST(N'2022-04-19T01:01:05.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1013, N'B25DCCN101', N'SUBJ1005', CAST(N'2022-04-19T01:02:32.000' AS DateTime), N'Lỗi đăng ký')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1014, N'B25DCCN102', N'SUBJ1006', CAST(N'2022-04-19T01:03:25.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1016, N'B25DCCN103', N'SUBJ1001', CAST(N'2022-04-19T01:05:36.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1017, N'B25DCCN102', N'SUBJ1001', CAST(N'2022-04-19T02:23:00.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1018, N'B25DCCN101', N'SUBJ1004', CAST(N'2022-04-19T02:21:13.000' AS DateTime), N'Đã hủy')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1019, N'B25DCQT150', N'SUBJ1001', CAST(N'2022-04-19T02:25:31.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1022, N'B25DCQT150', N'SUBJ1002', CAST(N'2022-04-19T02:26:20.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1023, N'B25DCQT150', N'SUBJ1004', CAST(N'2022-04-19T02:27:36.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1024, N'B25DCDT108', N'SUBJ1005', CAST(N'2022-04-19T00:00:00.000' AS DateTime), N'Lỗi đăng ký')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1025, N'B25DCCN108', N'SUBJ1004', CAST(N'2022-07-01T12:00:05.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1026, N'B25DCCN108', N'SUBJ1001', CAST(N'2022-07-01T15:03:24.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1027, N'B25DCCN108', N'SUBJ1002', CAST(N'2022-06-03T10:24:37.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1028, N'B25DCCN121', N'SUBJ1010', CAST(N'2022-06-03T15:24:31.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1031, N'B25DCCN122', N'SUBJ1003', CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1033, N'B25DCCN122', N'SUBJ1001', CAST(N'2022-07-20T15:34:26.000' AS DateTime), N'Lỗi đăng ký')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1037, N'B25DCDT108', N'SUBJ1205', CAST(N'2022-08-05T16:30:46.167' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1038, N'B25DCDT108', N'SUBJ1206', CAST(N'2022-08-05T16:30:46.167' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1040, N'B25DCCN121', N'SUBJ1001', CAST(N'2023-01-30T01:12:34.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1042, N'B25DCCN121', N'SUBJ1002', CAST(N'2023-01-31T01:26:55.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1043, N'B25DCCN121', N'SUBJ1003', CAST(N'2023-01-31T05:36:14.000' AS DateTime), N'Lỗi đăng ký')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1044, N'B25DCCN121', N'SUBJ1004', CAST(N'2023-02-02T05:37:54.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1045, N'B25DCCN121', N'SUBJ1006', CAST(N'2023-02-10T14:14:14.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1046, N'B25DCCN120', N'SUBJ1007', CAST(N'2023-02-10T15:30:24.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1047, N'B25DCCN122', N'SUBJ1005', CAST(N'2023-02-10T15:30:01.000' AS DateTime), N'Thành công')
INSERT [dbo].[Registers] ([RegisterId], [StudentId], [SubjectId], [RegisterTime], [RegisterStatus]) VALUES (1048, N'B25DCCN101', N'SUBJ1007', CAST(N'2023-02-10T15:30:45.000' AS DateTime), N'Thành công')
SET IDENTITY_INSERT [dbo].[Registers] OFF
GO
SET IDENTITY_INSERT [dbo].[Salaries] ON 

INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (104, 1, 2, CAST(21400000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(4280000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (105, 6, 3, CAST(39500000.00 AS Decimal(10, 2)), CAST(5500000.00 AS Decimal(10, 2)), CAST(11850000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (106, 7, 4, CAST(48500000.00 AS Decimal(10, 2)), CAST(6500000.00 AS Decimal(10, 2)), CAST(19400000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (107, 9, 5, CAST(57100000.00 AS Decimal(10, 2)), CAST(7500000.00 AS Decimal(10, 2)), CAST(28550000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (108, 8, 1, CAST(11500000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(1150000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (109, 10, 2, CAST(27500000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(5500000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (110, 11, 3, CAST(36500000.00 AS Decimal(10, 2)), CAST(5500000.00 AS Decimal(10, 2)), CAST(10950000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (111, 18, 5, CAST(56800000.00 AS Decimal(10, 2)), CAST(8500000.00 AS Decimal(10, 2)), CAST(28400000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (112, 19, NULL, CAST(11400000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(1140000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (113, 20, NULL, CAST(9500000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(950000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (114, 21, NULL, CAST(8500000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(850000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (115, 22, NULL, CAST(7100000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(710000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salaries] ([SalaryId], [StaffId], [TargetId], [BaseAmount], [BaseSalary], [Commission]) VALUES (116, 23, NULL, CAST(61500000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), CAST(6150000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Salaries] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (1, N'Trọng', N'Nguyễn', N'trongnguyen@xmail.com', N'0976123124', 1, 3, NULL)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (6, N'Hoàng', N'Ngô', N'hoangngo@xmail.com', N'0976123125', 1, 3, 1)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (7, N'Linh', N'Mai', N'mailinh@xmail.com', N'0912355265', 1, 3, 1)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (8, N'Long', N'Đinh', N'dinhlong@xmail.com', N'0359553305', 1, 3, 1)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (9, N'Khánh', N'Hoàng', N'khanhhoang@xmail.com', N'0362456456', 1, 4, NULL)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (10, N'Mạnh', N'Đặng', N'manhdang@xmail.com', N'0365456987', 1, 4, 9)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (11, N'Bách', N'Nguyễn', N'backnguyen@xmail.com', N'0986123654', 1, 4, 9)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (12, N'Hồng', N'Lê', N'hongle@xmail.com', N'0978655644', 1, 8, NULL)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (13, N'Minh', N'Trần', N'minhtran@xmail.com', N'0926003004', 1, 8, 12)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (14, N'Gấm', N'Đỗ', N'gamdo@xmail.com', N'0903553554', 1, 8, 12)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (15, N'Duy', N'Đào', N'duydao@xmail.com', N'0903001002', 1, 5, NULL)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (16, N'Dung', N'Khúc', N'dungkhuc@xmail.com', N'0904123444', 1, 5, 15)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (17, N'Mừng', N'Nguyễn', N'mungnguyen@xmail.com', N'0906002003', 1, 5, 15)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (18, N'Uyên', N'Hồ', N'houyen@xmail.com', N'0907117118', 1, 5, 15)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (19, N'Ánh', N'Bành', N'anhbanh@xmail.com', N'0908558668', 1, 5, 15)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (20, N'Lan', N'Nguyễn', N'lannguyen@xmail.com', N'', 1, 6, NULL)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (21, N'Nhung', N'Ma', N'manhung@xmail.com', N'0979119118', 1, 6, 20)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (22, N'Ngân', N'Hoàng', N'hoangngan@xmail.com', NULL, 1, 6, 20)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (23, N'Tuấn', N'Tô', N'tuanto@xmail.com', NULL, 1, 7, NULL)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (24, N'Tùng', N'Tạ', N'tatung@xmail.com', N'0988188999', 1, 7, 23)
INSERT [dbo].[Staffs] ([StaffId], [FirstName], [LastName], [Email], [PhoneNumber], [Active], [StoreId], [ManagerId]) VALUES (26, N'Sơn', N'Hoàng', N'hoangson@xmail.com', N'', 1, 7, 23)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
SET IDENTITY_INSERT [dbo].[StoreAudits] ON 

INSERT [dbo].[StoreAudits] ([StoreAuditId], [StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City], [UpdateAt], [Operation]) VALUES (1, 20, N'FPT Shop', N'19001288', N'fptshop@xmail.com', N'373 Cầu Diễn', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội', CAST(N'2022-08-17T09:52:10.733' AS DateTime), N'INS')
INSERT [dbo].[StoreAudits] ([StoreAuditId], [StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City], [UpdateAt], [Operation]) VALUES (2, 22, N'FPT Shop', N'19001289', N'fptshop1@xmail.com', N'101 Cầu Diễn', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội', CAST(N'2022-08-17T09:54:09.843' AS DateTime), N'INS')
INSERT [dbo].[StoreAudits] ([StoreAuditId], [StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City], [UpdateAt], [Operation]) VALUES (3, 22, N'FPT Shop', N'19001289', N'fptshop1@xmail.com', N'101 Cầu Diễn', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội', CAST(N'2022-08-17T09:55:32.663' AS DateTime), N'DEL')
INSERT [dbo].[StoreAudits] ([StoreAuditId], [StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City], [UpdateAt], [Operation]) VALUES (4, 20, N'FPT Shop', N'19001288', N'fptshop@xmail.com', N'373 Cầu Diễn', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội', CAST(N'2022-08-17T09:55:32.663' AS DateTime), N'DEL')
SET IDENTITY_INSERT [dbo].[StoreAudits] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City]) VALUES (3, N'TopZone366', N'0936123123', N'topzon@gmail.com', N'366 Cầu Diễn', N'Phúc Diễn', N'Nam Từ Liêm', N'Hà Nội')
INSERT [dbo].[Stores] ([StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City]) VALUES (4, N'Viettel store', N'02466813030', N'viettelstore@xmail.com', N'279 Hồ Tùng Mậu', N'Cầu Diễn', N'Nam Từ Liêm', N'Hà Nội')
INSERT [dbo].[Stores] ([StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City]) VALUES (5, N'ShopDunk', N'0981166673', N'shopdunk@xmail.com', N'386 Cầu Giấy', N'Dịch Vọng', N'Cầu Giấy', N'Hà Nội')
INSERT [dbo].[Stores] ([StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City]) VALUES (6, N'Hoàng Hà Mobile', N'0968323399', N'hoanghamobile@xmail.com', N'392 Cầu Giấy', N'Dịch Vọng', N'Cầu Giấy', N'Hà Nội')
INSERT [dbo].[Stores] ([StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City]) VALUES (7, N'FPT Shop', N'18006601', N'fptshop@xmail.com', N'45 Thái Hà', N'Trung Liệt', N'Đống Đa', N'Hà Nội')
INSERT [dbo].[Stores] ([StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City]) VALUES (8, N'TopZone191', N'1900969642', N'topzone@xmail.com', N'191 Điện Biên Phủ', N'Phường 6', N'Quận 3', N'TP.Hồ Chí Minh')
INSERT [dbo].[Stores] ([StoreId], [StoreName], [Phone], [Email], [AddressNumber], [Street], [District], [City]) VALUES (17, N'CellphoneS', N'18009988', N'celphones@xmail.com', N'12 Xuân Thủy', N'Dịch Vọng Hậu', N'Cầu Giấy', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN101', N'Dũng', N'Trần', N'Anh', N'Hà Nội', N'CNTT', CAST(N'2007-01-01' AS Date), N'0358213597', 3.15)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN102', N'Trang', N'Lê', N'Quỳnh', N'Thanh Hóa', N'CNTT', CAST(N'2007-10-10' AS Date), N'0362126126', 3.36)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN103', N'Hưng', N'Hoàng', N'Văn', N'Quảng Ngãi', N'CNTT', CAST(N'2007-01-21' AS Date), N'0978123123', 3.38)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN104', N'Giang', N'Mai', N'Trường', N'Thái Bình', N'CNTT', CAST(N'2006-05-23' AS Date), N'0987456456', 3.67)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN105', N'Vinh', N'Khúc', N'Bá', N'Cao Bằng', N'CNTT', CAST(N'2007-10-14' AS Date), N'0975123654', 3.18)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN106', N'Hà', N'Ma', N'Thị', N'Bắc Ninh', N'CNTT', CAST(N'2007-04-04' AS Date), N'0962123123', 3.67)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN107', N'Nga', N'Nguyễn', N'Thu', N'Điện Biên', N'CNTT', CAST(N'2006-05-15' AS Date), N'0362145652', 3.67)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN108', N'Trâm', N'Trương', N'Quỳnh', N'Hà Nội', N'CNTT', CAST(N'2006-04-27' AS Date), N'0358123698', 3.96)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN120', N'Vỹ', N'Trần', N'Văn', N'Hồ Chí Minh', N'CNTT', CAST(N'2007-02-23' AS Date), N'0362123123', 3.64)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN121', N'Mai', N'Nguyễn', N'Thị', N'Nam Định', N'CNTT', CAST(N'2006-05-05' AS Date), N'0391234234', 3.37)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN122', N'Anh', N'Đặng', N'Minh', N'Hà Nam', N'CNTT', CAST(N'2006-04-21' AS Date), N'0391234235', 3.67)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN123', N'Bách', N'Ngô', N'Xuân', N'Hà Nội', N'CNTT', CAST(N'2006-09-01' AS Date), N'0391234236', 3.62)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN178', N'Hùng', N'Trương', N'Việt', N'Đồng Nai', N'CNTT', CAST(N'2007-08-09' AS Date), N'0378123654', 3.26)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCCN224', N'Thành', N'Nông', N'Đức', N'Hà Nội', N'CNTT', CAST(N'2006-10-19' AS Date), N'0369123654', 3.56)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCDT106', N'Bình', N'Lê', N'Văn', N'Trà Vinh', N'ĐTVT', CAST(N'2007-06-25' AS Date), N'0956123587', 3.36)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCDT108', N'Hoàng', N'Nguyễn', N'Huy', N'Nam Định', N'ĐTVT', CAST(N'2007-04-20' AS Date), N'0965125456', 3.19)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCDT115', N'Tuấn', N'Lê', N'Văn', N'Đà Nẵng', N'ĐTVT', CAST(N'2007-09-11' AS Date), N'0974133669', 3.64)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCHT100', N'Hoàng', N'Ngô', N'Duy', N'Hà Nội', N'HTTT', CAST(N'2007-10-11' AS Date), N'0351236541', 3.68)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCHT102', N'Vỹ', N'Trần', N'Văn', N'Hải Phòng', N'HTTT', CAST(N'2006-08-09' AS Date), N'0387125126', 3.17)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCQT109', N'Thảo', N'Lưu', N'Thu', N'Hải Dương', N'QTKD', CAST(N'2007-07-16' AS Date), N'0964789512', 3.64)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCQT110', N'Hoa', N'Mai', N'Thị Thanh', N'Nghệ An', N'QTKD', CAST(N'2007-03-30' AS Date), N'0974154145', 3.2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCQT150', N'Trung', N'Trần', N'Khắc', N'Hồ Chí Minh', N'QTKD', CAST(N'2007-04-25' AS Date), N'0984157845', 3.71)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [MidName], [Address], [Major], [BirthDate], [PhoneNumber], [Gpa]) VALUES (N'B25DCVT101', N'Đình', N'Mai', N'Hắc', N'Đà Nẵng', N'ĐTVT', CAST(N'2006-06-14' AS Date), N'0398123123', 3.14)
GO
SET IDENTITY_INSERT [dbo].[SubjectApprovals] ON 

INSERT [dbo].[SubjectApprovals] ([SubjectApprovalId], [SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (1, N'SUBJ1025', N'Spring Framework', 4, 50, N'Chuyên ngành')
INSERT [dbo].[SubjectApprovals] ([SubjectApprovalId], [SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (2, N'SUBJ1026', N'Phân tích thiết kế CSDL', 3, 36, N'Chuyên ngành')
SET IDENTITY_INSERT [dbo].[SubjectApprovals] OFF
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1001', N'C++', 3, 36, N'Cơ bản')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1002', N'C#', 4, 48, N'Nâng cao')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1003', N'Java', 4, 48, N'Nâng cao')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1004', N'SQL', 3, 36, N'Cơ sở ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1005', N'Trí tuệ nhân tạo', 4, 48, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1006', N'Lập trình Android', 4, 48, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1007', N'Thiết kế đồ họa', 3, 36, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1008', N'Cơ sở dữ liệu phân tán', 3, 36, N'Cơ sở ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1009', N'Cấu trúc dữ liệu và giải thuật', 3, 36, N'Cơ bản')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1010', N'Lập trình Web', 4, 48, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1011', N'Lập trình mạng', 4, 48, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1012', N'Lập trình nhúng', 3, 36, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1013', N'Lập trình iOS', 5, 60, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1014', N'Phân tích thiết kế hệ thống', 3, 36, N'Cơ sở ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1015', N'Mật mã học', 4, 48, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1016', N'Lập trình game Unity', 4, 48, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1201', N'Android nâng cao', 3, 36, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1202', N'.NET nâng cao', 4, 48, N'Chuyên ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1203', N'Xác xuất thống kê', 3, 36, N'Cơ sở ngành')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1204', N'Đại số', 3, 36, N'Cơ bản')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1205', N'Giải tích 1', 4, 48, N'Cơ bản')
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Credit], [NumOfLesson], [Type]) VALUES (N'SUBJ1206', N'Giải tích 2', 3, 38, N'Cơ bản')
GO
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (1, CAST(0.10 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (2, CAST(0.20 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (3, CAST(0.30 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (4, CAST(0.40 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (5, CAST(0.50 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (6, CAST(0.60 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (7, CAST(0.70 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (8, CAST(0.80 AS Decimal(4, 2)))
INSERT [dbo].[Targets] ([TargetId], [Percentage]) VALUES (9, CAST(0.90 AS Decimal(4, 2)))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customers_Email]    Script Date: 02/11/2023 17:42:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customers_Email] ON [dbo].[Customers]
(
	[Email] ASC
)
INCLUDE([LastName],[FirstName],[City],[District]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customers_EmailAndDistrict]    Script Date: 02/11/2023 17:42:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customers_EmailAndDistrict] ON [dbo].[Customers]
(
	[Email] ASC
)
INCLUDE([FirstName],[District]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_Customers_EmailLocalPart]    Script Date: 02/11/2023 17:42:40 ******/
CREATE NONCLUSTERED INDEX [IX_Customers_EmailLocalPart] ON [dbo].[Customers]
(
	[EmailLocalPart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customers_Name]    Script Date: 02/11/2023 17:42:40 ******/
CREATE NONCLUSTERED INDEX [IX_Customers_Name] ON [dbo].[Customers]
(
	[FirstName] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customers_PhoneNumber]    Script Date: 02/11/2023 17:42:40 ******/
CREATE NONCLUSTERED INDEX [IX_Customers_PhoneNumber] ON [dbo].[Customers]
(
	[PhoneNumber] ASC
)
INCLUDE([LastName],[FirstName],[City]) 
WHERE ([PhoneNumber]>='090')
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Pets_PetName]    Script Date: 02/11/2023 17:42:40 ******/
CREATE NONCLUSTERED INDEX [IX_Pets_PetName] ON [dbo].[Pets]
(
	[Petname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER INDEX [IX_Pets_PetName] ON [dbo].[Pets] DISABLE
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stores_EmailAndPhone]    Script Date: 02/11/2023 17:42:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Stores_EmailAndPhone] ON [dbo].[Stores]
(
	[Email] ASC,
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stores_Phone]    Script Date: 02/11/2023 17:42:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Stores_Phone] ON [dbo].[Stores]
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_PhoneNumber]    Script Date: 02/11/2023 17:42:40 ******/
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [Unique_PhoneNumber] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 02/11/2023 17:42:40 ******/
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Registers] ADD  CONSTRAINT [CT_DefaultRegisterDate]  DEFAULT (getdate()) FOR [RegisterTime]
GO
ALTER TABLE [dbo].[Salaries] ADD  DEFAULT ((0)) FOR [BaseAmount]
GO
ALTER TABLE [dbo].[Salaries] ADD  DEFAULT ((0)) FOR [BaseSalary]
GO
ALTER TABLE [dbo].[Salaries] ADD  DEFAULT ((0)) FOR [Commission]
GO
ALTER TABLE [dbo].[Targets] ADD  DEFAULT ((0)) FOR [Percentage]
GO
ALTER TABLE [dbo].[Registers]  WITH CHECK ADD  CONSTRAINT [FK_Register_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registers] CHECK CONSTRAINT [FK_Register_Student]
GO
ALTER TABLE [dbo].[Registers]  WITH NOCHECK ADD  CONSTRAINT [FK_Register_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registers] NOCHECK CONSTRAINT [FK_Register_Subject]
GO
ALTER TABLE [dbo].[Salaries]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([StaffId])
GO
ALTER TABLE [dbo].[Salaries]  WITH CHECK ADD FOREIGN KEY([TargetId])
REFERENCES [dbo].[Targets] ([TargetId])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Staffs1] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([StaffId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Staffs1]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Stores]
GO
ALTER TABLE [dbo].[StoreAudits]  WITH CHECK ADD  CONSTRAINT [CK__StoreAudi__Opera__2116E6DF] CHECK  (([Operation]='INS' OR [Operation]='DEL'))
GO
ALTER TABLE [dbo].[StoreAudits] CHECK CONSTRAINT [CK__StoreAudi__Opera__2116E6DF]
GO
/****** Object:  StoredProcedure [dbo].[usp_CountResult]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Viết lệnh SQL động cho phép đếm số bản ghi trong bảng 
-- được chỉ định thỏa mãn tiêu chí của cột nào đó.
CREATE   PROC [dbo].[usp_CountResult]( 
	@tableName NVARCHAR(200),
	@colName NVARCHAR(200),
	@expression NVARCHAR(2),
	@value NVARCHAR(100)
) AS 
BEGIN 
	IF CHARINDEX(';', @value) = 0
	BEGIN
		DECLARE @sql NVARCHAR(MAX); 
		SET @sql = N'SELECT COUNT(*) AS Result FROM ' + QUOTENAME(@tableName) + 
			' WHERE ' + QUOTENAME(@colName) + ' ' + @expression + @value;
		-- thực thi lệnh SQL
		EXEC sp_executesql @sql;
	END
	ELSE
		RAISERROR('Error', 16, 1);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Customers_GetCustomerList]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	1. Khái niệm về biến trong SQL
	2. Cú pháp khai báo biến
	3. Sử dụng biến trong câu truy vấn
	4. Lưu trữ kết quả truy vấn trong một biến
	5. Ví dụ minh họa
	6. Bài tập thực hành
*/
/*
DECLARE @gpa AS FLOAT = 3.25;
PRINT @gpa;
SET @gpa = 3.55;
PRINT @gpa;

DECLARE @fullName NVARCHAR(200);
PRINT @fullName;
SET @fullName = N'Trần Công Nam';
PRINT @fullName;
*/
/*
DECLARE @district NVARCHAR(200);
SET @district = N'Nam Từ Liêm';

SELECT
	*
FROM
	Customers
WHERE
	District = @district
ORDER BY
	FirstName;
*/
/*
DECLARE @numberOfCustomer INT;
SET @numberOfCustomer = (
	SELECT	
		COUNT(*)
	FROM
		Customers
);

--PRINT @numberOfCustomer;
SELECT @numberOfCustomer AS [Số lượng khách hàng];

DECLARE @numberOfCustomer INT;
DECLARE @district NVARCHAR(200);
SET @district = N'Nam Từ Liêm';

SELECT
	@numberOfCustomer = COUNT(*)
FROM
	Customers
WHERE
	District = @district;

SELECT @numberOfCustomer AS [Số lượng khách hàng];

*/

CREATE   PROC [dbo].[usp_Customers_GetCustomerList]
AS
BEGIN
	DECLARE @customerList NVARCHAR(MAX);
	SET @customerList = '';
	SELECT 
		@customerList = @customerList + STR(CustomerId) + ' - ' +
		LastName + ' ' + FirstName + ' - ' +
		Email + CHAR(10)
	FROM
		Customers
	ORDER BY
		FirstName;
	PRINT @customerList;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Divide]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[usp_Divide](
	@a FLOAT,
	@b FLOAT,
	@c FLOAT OUTPUT
) AS
BEGIN
	BEGIN TRY
		SET @c = @a / @b;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRecords]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Viết lệnh SQL động cho phép chọn ra tất cả các dòng 
-- trong bảng nào đó thỏa mãn các tiêu chí cho trước.
CREATE   PROC [dbo].[usp_GetRecords]( 
	@tableName NVARCHAR(200),
	@col1 NVARCHAR(200),
	@operator1 NVARCHAR(10),
	@value1 NVARCHAR(200),
	@connection NVARCHAR(10),
	@col2 NVARCHAR(200),
	@operator2 NVARCHAR(10),
	@value2 NVARCHAR(200)
) AS 
BEGIN 
	IF CHARINDEX(';', @value2) = 0
	BEGIN
		DECLARE @sql NVARCHAR(MAX); 
		SET @sql = 'SELECT * FROM ' + QUOTENAME(@tableName) +
			' WHERE ' + QUOTENAME(@col1) + ' ' + @operator1 + ' @value1 ' +
			@connection + ' ' + @col2 + ' ' + @operator2 + ' @value2';
		-- thực thi lệnh SQL. Sử dụng tham số hóa để tránh lỗi Invalid column name 'xyz' 
		-- với xyz là giá trị trong biến @value
		EXEC sp_executesql 
			@sql, 
			N'@value1 NVARCHAR(200), @value2 NVARCHAR(200)', 
			@value1 = @value1,
			@value2 = @value2;
	END
	ELSE
		RAISERROR('Error', 16, 1);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Query]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[usp_Query] (
	@schema NVARCHAR(200),
	@table NVARCHAR(200) 
) 
AS 
BEGIN 
	DECLARE @sql NVARCHAR(MAX); 
	-- construct SQL 
	SET @sql = N'SELECT * FROM ' + 
	QUOTENAME(@schema) + '.' + 
	QUOTENAME(@table);
	-- execute the SQL 
	EXEC sp_executesql @sql; 
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_QueryTopN]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[usp_QueryTopN](
	@tableName NVARCHAR(200),
	@topN INT,
	@byColumn NVARCHAR(200)
) AS
BEGIN
	DECLARE
		@sql NVARCHAR(MAX),
		@topNStr NVARCHAR(MAX);
	SET @topNStr = CAST(@topN AS NVARCHAR);
	SET @sql = N'SELECT TOP ' + @topNStr + ' WITH TIES * ' +
		'FROM ' + @tableName + 
		' ORDER BY ' + @byColumn + ' DESC';
	-- chạy lệnh SQL động
	EXEC sp_executesql @sql;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RemoveRecord]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Viết lệnh SQL động xóa dữ liệu của một bảng nào đó theo tiêu chí cho trước.
CREATE   PROC [dbo].[usp_RemoveRecord]( 
	@tableName NVARCHAR(200),
	@col NVARCHAR(200),
	@operator VARCHAR(5),
	@value NVARCHAR(200)
) AS 
BEGIN 
	IF CHARINDEX(';', @value) = 0 AND
		(@col NOT LIKE '%[^a-z0-9 ]%' ) -- không được chứa các biểu thức như =, >=, <=

	BEGIN
		DECLARE @sql NVARCHAR(MAX); 
		SET @sql = N'DELETE FROM ' + QUOTENAME(@tableName) +
			' WHERE ' + QUOTENAME(@col) + @operator + '@value';
		-- thực thi lệnh SQL. Sử dụng tham số hóa để tránh lỗi Invalid column name 'xyz' 
		-- với xyz là giá trị trong biến @value
		EXEC sp_executesql @sql, N'@value NVARCHAR(200)', @value = @value;
	END
	ELSE
		RAISERROR('Error', 16, 1);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_RemoveRecords]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Viết lệnh SQL động xóa dữ liệu của một bảng nào đó theo tiêu chí cho trước.
CREATE   PROC [dbo].[usp_RemoveRecords]( 
	@tableName NVARCHAR(200),
	@col NVARCHAR(200),
	@operator VARCHAR(2),
	@value NVARCHAR(200)
) AS 
BEGIN 
	IF CHARINDEX(';', @value) = 0
	BEGIN
		DECLARE @sql NVARCHAR(MAX); 
		SET @sql = N'SELECT * FROM ' + QUOTENAME(@tableName) +
			' WHERE ' + @col + @operator + @value;
		-- thực thi lệnh SQL
		EXEC sp_executesql @sql;
	END
	ELSE
		RAISERROR('Error', 16, 1);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectTopN]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Viết lệnh SQL động cho phép select ra top n dòng và các dòng 
-- cùng giá trị sắp xếp giảm dần theo tiêu chí nào đó.
CREATE   PROC [dbo].[usp_SelectTopN]( 
	@tableName NVARCHAR(200),
	@topN INT,
	@colName NVARCHAR(200)
) AS 
BEGIN 
	DECLARE @topNStr NVARCHAR(20) = CAST(@topN AS VARCHAR(20));
	DECLARE @sql NVARCHAR(MAX); 
	SET @sql = N'SELECT TOP ' + @topNStr + ' WITH TIES * FROM ' + 
		QUOTENAME(@tableName) + 
		' ORDER BY ' + QUOTENAME(@colName) + ' DESC';
	-- thực thi lệnh SQL
	EXEC sp_executesql @sql;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Students_FindByGpa]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	1. Tạo stored procedure 1 tham số
	2. Tạo stored procedure nhiều tham số
	3. Tạo tham số tùy chọn
	4. Sử dụng giá trị NULL làm giá trị mặc định
*/
CREATE PROC [dbo].[usp_Students_FindByGpa](@gpa AS FLOAT)
AS
BEGIN
	SELECT
		*
	FROM
		Students
	WHERE
		Gpa >= @gpa
	ORDER BY
		Gpa DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Students_FindByRangeGpa]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	1. Tạo stored procedure 1 tham số
	2. Tạo stored procedure nhiều tham số
	3. Tạo tham số tùy chọn
	4. Sử dụng giá trị NULL làm giá trị mặc định
*/
/*
CREATE PROC usp_Students_FindByGpa(@gpa AS FLOAT)
AS
BEGIN
	SELECT
		*
	FROM
		Students
	WHERE
		Gpa >= @gpa
	ORDER BY
		Gpa DESC;
END;*/

CREATE   PROC [dbo].[usp_Students_FindByRangeGpa](
	@minGpa AS FLOAT = 0,
	@maxGpa AS FLOAT = NULL
)
AS
BEGIN
	SELECT
		*
	FROM
		Students
	WHERE
		Gpa >= @minGpa
		AND
		Gpa <= @maxGpa
	ORDER BY
		Gpa DESC;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_Students_FindMinMaxGpa]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- tham số đầu ra
-- parameter_name data_type OUTPUT

CREATE PROC [dbo].[usp_Students_FindMinMaxGpa](
	@major VARCHAR(200),
	@minGpa FLOAT OUT,
	@maxGpa FLOAT OUT
)
AS
BEGIN
	SELECT
		StudentId,
		LastName,
		FirstName,
		Gpa
	FROM
		Students
	WHERE 
		Major = @major;
	-- tìm min, max gpa:
	SELECT
		@minGpa = MIN(Gpa),
		@maxGpa = MAX(Gpa)
	FROM
		Students
	WHERE 
		Major = @major;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateRecords]    Script Date: 02/11/2023 17:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Viết lệnh SQL động sửa dữ liệu của một bản ghi nào đó theo tiêu chí cho trước.
CREATE   PROC [dbo].[usp_UpdateRecords]( 
	@tableName NVARCHAR(200),
	@idColName NVARCHAR(200),
	@idValue NVARCHAR(200),
	@colName NVARCHAR(200),
	@value NVARCHAR(200)
) AS 
BEGIN 
	IF CHARINDEX(';', @value) = 0 AND
		(@colName NOT LIKE '%[^a-z0-9 ]%' ) -- không được chứa các biểu thức như =, >=, <=

	BEGIN
		DECLARE @sql NVARCHAR(MAX); 
		SET @sql = N'UPDATE ' + QUOTENAME(@tableName) +
			' SET ' + QUOTENAME(@colName) + ' = @value' +
			' WHERE ' + @idColName + ' = @idValue';
		-- thực thi lệnh SQL. Sử dụng tham số hóa để tránh lỗi Invalid column name 'xyz' 
		-- với xyz là giá trị trong biến @value
		EXEC sp_executesql 
			@sql, 
			N'@value NVARCHAR(200), @idValue NVARCHAR(200)', 
			@value = @value,
			@idValue = @idValue;
	END
	ELSE
		RAISERROR('Error', 16, 1);
END
GO
USE [master]
GO
ALTER DATABASE [LearnSQL] SET  READ_WRITE 
GO
