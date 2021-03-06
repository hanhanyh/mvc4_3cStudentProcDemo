USE [master]
GO
/****** Object:  Database [MySchool]    Script Date: 2018/4/19 21:55:56 ******/
CREATE DATABASE [MySchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MySchool', FILENAME = N'F:\ASP.NET资料\ADO.NET晋级\Chapter04\01 提供给教员的内容\01 教学演示案例\示例1：显示年级信息\DB\MySchool.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MySchool_log', FILENAME = N'F:\ASP.NET资料\ADO.NET晋级\Chapter04\01 提供给教员的内容\01 教学演示案例\示例1：显示年级信息\DB\MySchool_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MySchool] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MySchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MySchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MySchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MySchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MySchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MySchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MySchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MySchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MySchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MySchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MySchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MySchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MySchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MySchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MySchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MySchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MySchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MySchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MySchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MySchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MySchool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MySchool] SET  MULTI_USER 
GO
ALTER DATABASE [MySchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MySchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MySchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MySchool] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MySchool] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MySchool]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[LoginId] [nvarchar](50) NOT NULL,
	[LoginPwd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin_1] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grade]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[StudentNo] [int] NOT NULL,
	[SubjectNo] [int] NOT NULL,
	[StudentResult] [int] NOT NULL,
	[ExamDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentNo] [int] NOT NULL,
	[LoginPwd] [nvarchar](50) NULL,
	[StudentName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[GradeId] [int] NULL,
	[Phone] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[BornDate] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[IdentityCard] [nchar](18) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectNo] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nchar](10) NOT NULL,
	[ClassHour] [int] NULL,
	[GradeId] [int] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[name] [nvarchar](50) NULL,
	[age] [int] NULL,
	[teachYear] [int] NULL,
	[gradeId] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([LoginId], [LoginPwd]) VALUES (N'jbit', N'bdqn')
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (1, N'一学期')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (2, N'二学期')
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (3, N'二年级')
SET IDENTITY_INSERT [dbo].[Grade] OFF
INSERT [dbo].[Result] ([StudentNo], [SubjectNo], [StudentResult], [ExamDate]) VALUES (23, 2, 49, CAST(N'2016-05-12 10:20:00.000' AS DateTime))
INSERT [dbo].[Result] ([StudentNo], [SubjectNo], [StudentResult], [ExamDate]) VALUES (23, 3, 88, CAST(N'2016-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Result] ([StudentNo], [SubjectNo], [StudentResult], [ExamDate]) VALUES (161223, 3, 88, CAST(N'2016-08-21 12:00:00.000' AS DateTime))
INSERT [dbo].[Result] ([StudentNo], [SubjectNo], [StudentResult], [ExamDate]) VALUES (23, 2, 60, CAST(N'2016-06-04 16:15:00.000' AS DateTime))
INSERT [dbo].[Result] ([StudentNo], [SubjectNo], [StudentResult], [ExamDate]) VALUES (23, 2, 85, CAST(N'2016-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Result] ([StudentNo], [SubjectNo], [StudentResult], [ExamDate]) VALUES (12, 1, 98, CAST(N'2016-01-08 14:30:00.000' AS DateTime))
INSERT [dbo].[Result] ([StudentNo], [SubjectNo], [StudentResult], [ExamDate]) VALUES (13, 1, 85, CAST(N'2016-07-08 09:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (12, N'121000081', N'王小毛', 1, 1, N'13522235676', N'北京海淀区...11', CAST(N'1992-06-04 00:00:00.000' AS DateTime), N'wxm@163.com', N'101101198805237856')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (13, N'13', N'张小毛', 1, 1, N'13522235234', N'北京海淀区成府路北大青鸟', CAST(N'1992-06-04 00:00:00.000' AS DateTime), N'24@fsd', N'411321198407150070')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (23, N'2312', N'花木兰11', 0, 1, N'13522236745', N'北京海淀区北宫门', CAST(N'1992-06-04 00:00:00.000' AS DateTime), N'1@3', N'12                ')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (45, N'45', N'武则天', 0, 1, N'13522235610', N'北京海淀区北宫门', CAST(N'1999-09-09 00:00:00.000' AS DateTime), N'wuze@12.com', N'45                ')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (56, N'56', N'赵飞111', 0, 1, N'13522235123', N'北京海淀区北宫门123', CAST(N'1999-09-09 00:00:00.000' AS DateTime), N'56@13.2don', N'56                ')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (198, N'aaabbb', N'王小龙123132', 1, 1, N'15910839375', N'北大东门', CAST(N'1994-07-15 00:00:00.000' AS DateTime), N'', N'411321198407150071')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (456, N'9AE2A12CEED491EB967D4632906EDF', N'光头强', 0, 1, N'13577789658', N'北京市海淀区', CAST(N'1997-01-02 00:00:00.000' AS DateTime), N'gtq@163.com', N'11010119970102176 ')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (888, N'0A113EF6B61820DAA5611C870ED8D5', N'888', 0, 1, N'888888888', N'', CAST(N'1998-09-09 00:00:00.000' AS DateTime), N'', N'120999999999999999')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (999, N'111', N'你好我是', 0, 2, N'18381506390', N'四川水利', CAST(N'1994-07-15 00:00:00.000' AS DateTime), N'chenxy@126.com', N'101107199403222311')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (1612, N'123', N'张英俊', 1, 2, N'13512139486', N'北京海淀区成府路201号', CAST(N'1997-01-01 00:00:00.000' AS DateTime), N'yingjun@163.com', N'101102199706127612')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (4567, NULL, N'测试189', NULL, NULL, N'', N'四川成都', NULL, NULL, NULL)
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (5656, NULL, N'测试123', NULL, NULL, N'13213', N'四川成都', NULL, NULL, NULL)
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (12313, NULL, N'何建均111', NULL, NULL, N'1132132132', N'四川成都', NULL, NULL, NULL)
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (161223, N'1233', N'alex123', 1, 1, N'123135', N'23132231', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'', N'                  ')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (1614412, N'123', N'李元超11', 1, 2, N'13521236852', N'四川成都', CAST(N'2001-06-02 00:00:00.000' AS DateTime), N'', N'                  ')
INSERT [dbo].[Student] ([StudentNo], [LoginPwd], [StudentName], [Gender], [GradeId], [Phone], [Address], [BornDate], [Email], [IdentityCard]) VALUES (16122323, N'1111111', N'alex21111', 1, 1, N'13521236852', N'四川成都', CAST(N'1999-07-02 00:00:00.000' AS DateTime), N'alex@1112.com', N'421087198808254614')
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectNo], [SubjectName], [ClassHour], [GradeId]) VALUES (1, N'oop       ', 78, 1)
INSERT [dbo].[Subject] ([SubjectNo], [SubjectName], [ClassHour], [GradeId]) VALUES (2, N'java      ', 67, 1)
INSERT [dbo].[Subject] ([SubjectNo], [SubjectName], [ClassHour], [GradeId]) VALUES (3, N'C#        ', 78, 2)
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([name], [age], [teachYear], [gradeId], [id]) VALUES (N'丽萨', 28, 3, 1, 1)
INSERT [dbo].[Teacher] ([name], [age], [teachYear], [gradeId], [id]) VALUES (N'瑞克', 35, 4, 2, 2)
INSERT [dbo].[Teacher] ([name], [age], [teachYear], [gradeId], [id]) VALUES (N'张洁洁', 40, 10, 2, 3)
INSERT [dbo].[Teacher] ([name], [age], [teachYear], [gradeId], [id]) VALUES (N'祖冲之', 36, 12, 1, 4)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([StudentNo])
REFERENCES [dbo].[Student] ([StudentNo])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Grade]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Grade] FOREIGN KEY([gradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Grade]
GO
/****** Object:  StoredProcedure [dbo].[aa]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[aa]
( 
  @StudentNo int,
  @LoginPwd  nvarchar(50),
  @StudentName nvarchar(50),
  @Gender bit,     
  @GradeId int,
  @Phone nvarchar(255),
  @Address nvarchar(255),
  @BornDate Datetime,
  @Email nvarchar(50),
  @IdentityCard nvarchar(50)
)
as

UPDATE [Student]
   SET [LoginPwd]= @LoginPwd
      ,[StudentName] = @StudentName
      ,[Gender] = @Gender
      ,[GradeId] = @GradeId
      ,[Phone] = @Phone
      ,[Address] = @Address
      ,[BornDate] = @BornDate
      ,[Email] = @Email
      ,[IdentityCard]=@IdentityCard
 WHERE [StudentNo]=@StudentNo

GO
/****** Object:  StoredProcedure [dbo].[createstu]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createstu]
@id int,
@name nvarchar(20),
@address nvarchar(20)
as 
insert into [dbo].[Student]([StudentNo],[StudentName],[Address])values(@id,@name,@address)

GO
/****** Object:  StoredProcedure [dbo].[selectAllStu]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectAllStu]
as
select * from [dbo].[Student] order by StudentNo desc

GO
/****** Object:  StoredProcedure [dbo].[selectstubyid]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[selectstubyid]
@id int 
as
select * from [dbo].[Student]   where StudentNo=@id

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_student]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_student]
(
   @StudentNo int
)
AS

BEGIN TRAN
--      DELETE FROM [Result] WHERE [StudentNo]=@StudentNo
--    
--     IF @@ERROR<>0
--     BEGIN
--         ROLLBACK TRAN
--         return
--     END

     DELETE FROM [Student] WHERE [StudentNo]=@StudentNo
     IF @@ERROR<>0
     BEGIN
         ROLLBACK TRAN
         return
     END
    
 

COMMIT TRAN


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_student]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[sp_insert_student]
(
  @StudentNo int,
  @LoginPwd  nvarchar(50),
  @StudentName nvarchar(50),
  @Sex  nvarchar(50),     
  @GradeId int,
  @Phone nvarchar(255),
  @Address nvarchar(255),
  @BornDate Datetime,
  @Email nvarchar(50),
  @IdentityCard nvarchar(50),
  @iSuccess int output
)
AS

INSERT INTO [Student] 
           ([StudentNo]
           ,[LoginPwd]
           ,[StudentName]
           ,[Gender]
           ,[GradeId]
           ,[Phone]
           ,[Address]
           ,[BornDate]
           ,[Email]
           ,[IdentityCard])
VALUES(@StudentNo,@LoginPwd,@StudentName,@Sex,@GradeId,@Phone,@Address,@BornDate,@Email,@IdentityCard)


GO
/****** Object:  StoredProcedure [dbo].[sp_update_result]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_result]
( 
  @StudentNo int,
  @SubjectNo  int,
  @StudentResult  int,     
  @ExamDate Datetime
)
as

UPDATE [Result]
   SET  
       [SubjectNo]=@SubjectNo
      ,[StudentResult]=@StudentResult
      ,[ExamDate]=@ExamDate
 WHERE [StudentNo]=@StudentNo

GO
/****** Object:  StoredProcedure [dbo].[sp_update_student]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_student]
( 
  @StudentNo int,
  @StudentName nvarchar(50),
  @LoginPwd  nvarchar(50),
  @Gender bit,     
  @GradeId int,
  @Phone nvarchar(255),
  @Address nvarchar(255),
  @BornDate Datetime,
  @Email nvarchar(50),
  @IdentityCard nvarchar(50)
)
as

UPDATE [Student]
   SET [LoginPwd]= @LoginPwd
      ,[StudentName] = @StudentName
      ,[Gender] = @Gender
      ,[GradeId] = @GradeId
      ,[Phone] = @Phone
      ,[Address] = @Address
      ,[BornDate] = @BornDate
      ,[Email] = @Email
      ,[IdentityCard]=@IdentityCard
 WHERE [StudentNo]=@StudentNo

GO
/****** Object:  StoredProcedure [dbo].[sp_update_studentEX]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_studentEX]
( 
  @StudentNo int,
  @LoginPwd  nvarchar(50),
  @StudentName nvarchar(50),
  @Gender bit,     
  @GradeId int,
  @Phone nvarchar(255),
  @Address nvarchar(255),
  @BornDate Datetime,
  @Email nvarchar(50),
  @IdentityCard nvarchar(50),
  @ret varchar(100) output  ---新加的参数
)
as

UPDATE [Student]
   SET [LoginPwd]= @LoginPwd
      ,[StudentName] = @StudentName
      ,[Gender] = @Gender
      ,[GradeId] = @GradeId
      ,[Phone] = @Phone
      ,[Address] = @Address
      ,[BornDate] = @BornDate
      ,[Email] = @Email
      ,[IdentityCard]=@IdentityCard
 WHERE [StudentNo]=@StudentNo
set @ret ='更新成功'
GO
/****** Object:  StoredProcedure [dbo].[updatenamephoneaddressbyid]    Script Date: 2018/4/19 21:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updatenamephoneaddressbyid]
@id int,
@name nvarchar(20),
@phone nvarchar(20),
@address nvarchar(20)
as
update [dbo].[Student] set [StudentName]=@name,[Phone]=@phone,[Address]=@address where [StudentNo]=@id

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0表示男，1表示女' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Student', @level2type=N'COLUMN',@level2name=N'Gender'
GO
USE [master]
GO
ALTER DATABASE [MySchool] SET  READ_WRITE 
GO
